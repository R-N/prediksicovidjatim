import numpy as np
from scipy.integrate import odeint, solve_ivp
import lmfit
from core import util
from .base_model import BaseModel
import math

class SeicrdRlcModelResult:
    def __init__(self, t, population, susceptible, exposed_normal, exposed_over, infectious, critical, recovered, dead_normal, dead_over, death_chance_val, r0_normal_val, kapasitas_rs_val, r0_over_val, test_coverage):
        self.t = t
        self.population = population
        self.susceptible = susceptible
        self.exposed_normal = exposed_normal
        self.exposed_over = exposed_over
        self.infectious = infectious
        self.critical = critical
        self.recovered = recovered
        self.dead_normal = dead_normal
        self.dead_over = dead_over
        self.death_chance = death_chance_val
        self.r0_normal = r0_normal_val
        self.kapasitas_rs = kapasitas_rs_val
        self.r0_over = r0_over_val
        self.test_coverage = test_coverage
        
    def r0_overall(self):
        return self.r0_normal + self.r0_over
        
    def exposed(self):
        return self.exposed_normal + self.exposed_over
        
    def critical_cared(self):
        ret = self.critical[:]
        return np.clip(ret, a_min=None, a_max=self.kapasitas_rs)
        
        
    def critical_over(self):
        return SeicrdRlcModel.critical_over(self.critical, self.kapasitas_rs)
        
    def dead(self):
        return self.dead_normal + self.dead_over
        
    def critical_over_scaled(self):
        return self.test_coverage * self.critical_over()
        
    def infectious_scaled(self):
        return self.test_coverage * self.infectious + self.critical_over_scaled()
        
    def critical_cared_scaled(self):
        return self.test_coverage * self.critical_cared()
        
    def recovered_scaled(self):
        return self.test_coverage * self.recovered
        
    def dead_scaled(self):
        return self.test_coverage * self.dead()
        
    def infected_scaled(self):
        return self.infectious_scaled() + self.critical_cared_scaled() + self.recovered_scaled() + self.dead_scaled()
    
    def daily_susceptible(self):
        return util.delta(self.susceptible)
        
    def daily_exposed_normal(self):
        return util.delta(self.exposed_normal)
        
    def daily_exposed_over(self):
        return util.delta(self.exposed_over)
        
    def daily_exposed(self):
        return util.delta(self.exposed())
        
    def daily_infectious(self):
        return util.delta(self.infectious)
        
    def daily_critical_cared(self):
        return util.delta(self.critical_cared())
        
    def daily_critical_over(self):
        return util.delta(self.critical_over())
        
    def daily_critical(self):
        return util.delta(self.critical)
        
    def daily_recovered(self):
        return util.delta(self.recovered)
        
    def daily_dead_normal(self):
        return util.delta(self.dead_normal)
        
    def daily_dead_over(self):
        return util.delta(self.dead_over)
        
    def daily_dead(self):
        return util.delta(self.dead())
    
    def daily_infectious_scaled(self):
        return util.delta(self.infectious_scaled())
        
    def daily_critical_cared_scaled(self):
        return util.delta(self.critical_cared_scaled())
        
    def daily_recovered_scaled(self):
        return util.delta(self.recovered_scaled())
        
    def daily_dead_scaled(self):
        return util.delta(self.dead_scaled())
        
    def daily_infected_scaled(self):
        return util.delta(self.infected_scaled())
        
    def get_dataset(self, d, shift=0):
        # TODO
        ret = None
        if d == "infectious":
            ret = self.infectious_scaled()
        elif d == "critical_cared":
            ret = self.critical_cared_scaled()
        elif d == "recovered":
            ret = self.recovered_scaled()
        elif d == "dead":
            ret = self.dead_scaled()
        elif d == "infected":
            ret = self.infected_scaled()
        else:
            raise ValueError("Invalid dataset: " + str(d))
        return np.array(ret) if not shift else util.shift_array(ret, shift)
        
    def get_datasets(self, datasets, shift=0):
        return {k:self.get_dataset(k, shift) for k in datasets}
        
class SeicrdRlcModel(BaseModel):
    params = ["incubation_period",
                    "critical_chance", "critical_time", 
                    "recovery_time_normal", "recovery_time_critical",
                    "death_chance_normal", "death_time_normal",
                    "death_chance_over", "death_time_over", 
                    "r_over", "k", "kapasitas_rs_mul",
                    "test_coverage_0", "test_coverage_increase", "test_coverage_max"]
                    
    def __init__(self, kabko):
        super().__init__(kabko) 
        self.prev_dydt = None
    
    def critical_over(critical, kapasitas_rs):
        ret = critical-kapasitas_rs
        return np.clip(ret, a_min=0, a_max=None)
        
    def deriv(self, y, t, population,
    #def deriv(self, t, y, population,
                    exposed_rate_normal, exposed_rate_over, 
                    infectious_rate, 
                    critical_rate, critical_chance, 
                    recovery_rate_normal, recovery_rate_critical, 
                    death_rate_normal, death_chance_normal, 
                    death_rate_over, death_chance_over, kapasitas_rs):
                    
        population_y, susceptible, exposed_normal, exposed_over, infectious, critical, recovered, dead_normal, dead_over = y
        y_name = ("population", "susceptible", "exposed_normal", "exposed_over", "infectious", "critical", "recovered", "dead_normal", "dead_over")
        population_y, susceptible, exposed_normal, exposed_over, infectious, critical, recovered, dead_normal, dead_over = [util.sanity_check_init(*args) for args in zip(y_name, y)]
        
        exposed_flow_normal = exposed_rate_normal(t) * susceptible * infectious / population
        
        
        infectious_flow_normal = infectious_rate * exposed_normal * 1
        infectious_flow_over = infectious_rate * exposed_over * 1
        
        recovery_flow_normal = recovery_rate_normal * infectious * (1.0-critical_chance)
        critical_flow = critical_rate * infectious * critical_chance
        
        #tricky part because I must not take y+dy (the flow) into account, because I need dt to do that
        kapasitas_rs_val = kapasitas_rs(t)
        if critical > kapasitas_rs_val:
            critical_cared = kapasitas_rs_val
            critical_over = kapasitas_rs_val - critical_cared
        else:
            critical_cared = critical
            critical_over = 0
        
        exposed_flow_over = exposed_rate_over * susceptible * critical_over / population
        recovery_flow_critical = recovery_rate_critical * critical_cared * (1.0-death_chance_normal)
        
        if recovery_flow_normal > infectious:
            raise Exception("There can't be more people recovering than infected people. (%f, %f, %f. %f)" % (recovery_rate_normal, critical_chance, recovery_flow_normal, infectious))
        
        if recovery_flow_critical > critical_cared:
            raise Exception("There can't be more people recovering than being cared")
        
        
        death_flow_normal = death_rate_normal * critical_cared * death_chance_normal
        death_flow_over = death_rate_over * critical_over * death_chance_over
        
        flow = exposed_flow_normal, exposed_flow_over, infectious_flow_normal, infectious_flow_over, recovery_flow_normal, recovery_flow_critical, death_flow_normal, death_flow_over, critical_flow
        flow_name = ("exposed_flow_normal", "exposed_flow_over", "infectious_flow_normal", "infectious_flow_over", "recovery_flow_normal", "recovery_flow_critical", "death_flow_normal", "death_flow_over", "critical_flow")
        exposed_flow_normal, exposed_flow_over, infectious_flow_normal, infectious_flow_over, recovery_flow_normal, recovery_flow_critical, death_flow_normal, death_flow_over, critical_flow = [util.sanity_check_flow(*args) for args in zip(flow_name, flow)]
        
        dSdt = -exposed_flow_normal - exposed_flow_over
        dENdt = exposed_flow_normal - infectious_flow_normal
        dEOdt = exposed_flow_over - infectious_flow_over
        dIdt = infectious_flow_normal + infectious_flow_over - recovery_flow_normal - critical_flow
        dCdt = critical_flow - recovery_flow_critical - death_flow_normal - death_flow_over
        dRdt = recovery_flow_normal + recovery_flow_critical
        dDNdt = death_flow_normal
        dDOdt = death_flow_over
        dPdt = dSdt + dENdt + dEOdt + dIdt + dCdt + dRdt + dDNdt + dDOdt
        '''
        if dPdt != 0:
            raise Exception("Population must not change: %f" % (dPdt,))
        '''
        dydt = dPdt, dSdt, dENdt, dEOdt, dIdt, dCdt, dRdt, dDNdt, dDOdt
        
        check_result = [util.sanity_check_y(*args) for args in zip(y_name, y, dydt)]
        
        self.prev_dydt = dict(zip(y_name, dydt))
        
        return dydt
        
    def model(self, days, incubation_period,
                    critical_chance, critical_time, 
                    recovery_time_normal, recovery_time_critical,
                    death_chance_normal, death_time_normal,
                    death_chance_over, death_time_over, 
                    r_over, k, kapasitas_rs_mul,
                    test_coverage_0, test_coverage_increase, test_coverage_max,
                    **kwargs):
        days = int(days)
        #unpack rt values
        rt_values = util.get_kwargs_rt(kwargs, self.kabko.rt_count)
        rt_data = list(zip(self.kabko.rt_days, rt_values))
        rt_delta = util.rt_delta(rt_data, self.kabko.oldest_tanggal)
        r_0 = rt_values[0]
        
        #load values
        population = self.kabko.population
        
        # this is derived parameter
        infectious_period_opt = recovery_time_normal * (1-critical_chance) + critical_time * critical_chance #this is derived parameter
        exposed_rate_over = r_over / death_time_over
        infectious_rate = 1.0 / incubation_period # this is derived parameter
        recovery_rate_normal = 1.0 / recovery_time_normal # this is derived parameter
        death_rate_normal = 1.0 / death_time_normal # this is derived parameter
        critical_rate = 1.0 / critical_time # this is derived parameter
        recovery_rate_critical = 1.0 / recovery_time_critical #this is derived parameter
        death_rate_over = 1.0/death_time_over # this is a derived parameter
        
        def kapasitas_rs(t):
            return self.kabko.kapasitas_rs(t) * kapasitas_rs_mul
        
        def test_coverage(t):
            return min(test_coverage_max, test_coverage_0 + test_coverage_increase * t)
        
        def logistic_rt(t):
            return self.kabko.logistic_rt(r_0, rt_delta, t, k)

        def exposed_rate_normal(t):
            ret = logistic_rt(t) / infectious_period_opt
            return ret
        
        def r0_over(critical_over):
            return exposed_rate_over * death_time_over * critical_chance * (critical_over/population)

        population_init, susceptible_init, exposed_normal_init, exposed_over_init, infectious_init, critical_init, recovered_init, dead_normal_init, dead_over_init = population, population-1, 1, 0, 0, 0, 0, 0, 0  # initial conditions: one exposed, rest susceptible
        
        y0 = population_init, susceptible_init, exposed_normal_init, exposed_over_init, infectious_init, critical_init, recovered_init, dead_normal_init, dead_over_init # Initial conditions tuple

        
        # Integrate the SIR equations over the time grid, t.
        t = np.linspace(0, days-1, days) # days
        ret = odeint(self.deriv, y0, t, args=(
            population,
            exposed_rate_normal, exposed_rate_over, 
            infectious_rate, 
            critical_rate, critical_chance, 
            recovery_rate_normal, recovery_rate_critical, 
            death_rate_normal, death_chance_normal, 
            death_rate_over, death_chance_over,
            kapasitas_rs
        ))
        retT = ret.T
        '''
        sol = solve_ivp(self.deriv, (0,days-1), y0, dense_output=True, args=(
            population,
            exposed_rate_normal, exposed_rate_over, 
            infectious_rate, 
            critical_rate, critical_chance, 
            recovery_rate_normal, recovery_rate_critical, 
            death_rate_normal, death_chance_normal, 
            death_rate_over, death_chance_over,
            kapasitas_rs
        ))
        retT = sol.sol(t)
        '''
        population_2, susceptible, exposed_normal, exposed_over, infectious, critical, recovered,  dead_normal, dead_over = retT
        
        kapasitas_rs_val = util.map_function(t, self.kabko.kapasitas_rs)
        #kapasitas_rs_val = np.zeros(days)
        
        exposed = util.sum_element(exposed_normal, exposed_over)
        dead = util.sum_element(dead_normal, dead_over)
        death_chance_val = self.death_chance(t, exposed, dead, infectious_rate)
        #death_chance_val = np.zeros(days)
        
        test_coverage_val = util.map_function(t, test_coverage)
        r0_normal_val = util.map_function(t, logistic_rt)
        critical_over = SeicrdRlcModel.critical_over(critical, kapasitas_rs_val)
        r0_over_val = util.map_function(critical_over, r0_over)
        #r0_normal_val = np.zeros(days)
        #r0_over_val = np.zeros(days)
        
        return SeicrdRlcModelResult(t, population_2, susceptible, exposed_normal, exposed_over, infectious, critical, recovered, dead_normal, dead_over, death_chance_val, r0_normal_val, kapasitas_rs_val, r0_over_val, test_coverage_val)
        
    
    def _fitter(self, ret):
                    
        self.last_result_full = ret
        
            
        results = []
        for d in self.datasets:
            if d == "infectious":
                results.append(ret.infectious_scaled())
            elif d == "critical_cared":
                results.append(ret.critical_cared_scaled())
            elif d == "recovered":
                results.append(ret.recovered_scaled())
            elif d == "dead":
                results.append(ret.dead_scaled())
            elif d == "infected":
                results.append(ret.infected_scaled())
            else:
                raise ValueError("Invalid dataset: " + str(d))
                
        results = np.array(results)
        self.last_result = results
        return results
    
    def fitter(self, **kwargs):
                    
        #days = self.kabko.data_days(self.kabko.outbreak_shift(incubation_period))
        ret = self.model(**kwargs)
        return self._fitter(ret)
        

Model = SeicrdRlcModel