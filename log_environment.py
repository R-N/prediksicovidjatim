import os
import subprocess

def log_environment():
    with open("build.log", "w") as log:
        log.write("=== Environment Variables ===\n")
        for k, v in os.environ.items():
            log.write(f"{k}: {v}\n")
        log.write("\n=== Python Version ===\n")
        log.write(subprocess.check_output(["python", "--version"]).decode())
        log.write("\n=== Installed Packages ===\n")
        log.write(subprocess.check_output(["pip", "list"]).decode())

log_environment()
