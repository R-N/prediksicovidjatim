-- --------------------------------------------------------
-- Host:                         ec2-44-205-155-32.compute-1.amazonaws.com
-- Server version:               PostgreSQL 12.12 (Ubuntu 12.12-1.pgdg20.04+1) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table public.apscheduler_daily
CREATE TABLE IF NOT EXISTS "apscheduler_daily" (
	"id" VARCHAR(191) NOT NULL,
	"next_run_time" DOUBLE PRECISION NULL DEFAULT NULL,
	"job_state" BYTEA NOT NULL,
	PRIMARY KEY ("id"),
	INDEX "ix_apscheduler_daily_next_run_time" ("next_run_time")
);

-- Dumping data for table public.apscheduler_daily: 1 rows
/*!40000 ALTER TABLE "apscheduler_daily" DISABLE KEYS */;
REPLACE INTO "apscheduler_daily" ("id", "next_run_time", "job_state") VALUES
	('daily_job', 1596034800, _binary 0x5c7838303034393565313033303030303030303030303030376439343238386330373736363537323733363936663665393434623031386330323639363439343863303936343631363936633739356636613666363239343863303436363735366536333934386331323566356636643631363936653566356633613634363136393663373935663661366636323934386330373734373236393637363736353732393438633139363137303733363336383635363437353663363537323265373437323639363736373635373237333265363337323666366539343863306234333732366636653534373236393637363736353732393439333934323938313934376439343238363830313462303238633038373436393664363537613666366536353934386330343730373937343761393438633032356637303934393339343238386330633431373336393631326634613631366236313732373436313934346431343634346230303863303334633464353439343734393435323934386330613733373436313732373435663634363137343635393434653863303836353665363435663634363137343635393434653863303636363639363536633634373339343564393432383863323036313730373336333638363536343735366336353732326537343732363936373637363537323733326536333732366636653265363636393635366336343733393438633039343236313733363534363639363536633634393439333934323938313934376439343238386330343665363136643635393438633034373936353631373239343863306136393733356636343635363636313735366337343934383838633062363537383730373236353733373336393666366537333934356439343863323536313730373336333638363536343735366336353732326537343732363936373637363537323733326536333732366636653265363537383730373236353733373336393666366537333934386330643431366336633435373837303732363537333733363936663665393439333934323938313934376439343863303437333734363537303934346537333632363137353632363831383863306134643666366537343638343636393635366336343934393339343239383139343764393432383638316438633035366436663665373436383934363831663838363832303564393436383234323938313934376439343638323734653733363236313735363236383138386330663434363137393466363634643666366537343638343636393635366336343934393339343239383139343764393432383638316438633033363436313739393436383166383836383230356439343638323432393831393437643934363832373465373336323631373536323638313838633039353736353635366234363639363536633634393439333934323938313934376439343238363831643863303437373635363536623934363831663838363832303564393436383234323938313934376439343638323734653733363236313735363236383138386330653434363137393466363635373635363536623436363936353663363439343933393432393831393437643934323836383164386330623634363137393566366636363566373736353635366239343638316638383638323035643934363832343239383139343764393436383237346537333632363137353632363831613239383139343764393432383638316438633034363836663735373239343638316638393638323035643934363832323863306635323631366536373635343537383730373236353733373336393666366539343933393432393831393437643934323836383237346538633035363636393732373337343934346231363863303436633631373337343934346231363735363236313735363236383161323938313934376439343238363831643863303636643639366537353734363539343638316638393638323035643934363834643239383139343764393432383638323734653638353034623030363835313462303037353632363137353632363831613239383139343764393432383638316438633036373336353633366636653634393436383166383836383230356439343638346432393831393437643934323836383237346536383530346230303638353134623030373536323631373536323635386330363661363937343734363537323934346537353632386330383635373836353633373537343666373239343863303736343635363636313735366337343934386330343631373236373733393432393863303636623737363137323637373339343764393436383164363830333863313236643639373336363639373236353566363737323631363336353566373436393664363539343464353830323863303836333666363136633635373336333635393438383863306436643631373835663639366537333734363136653633363537333934346230313863306436653635373837343566373237353665356637343639366436353934386330383634363137343635373436393664363539343863303836343631373436353734363936643635393439333934343330613037653430373164313630303030303030303030393436383066323836383130346437303632346230303863303335373439343239343734393435323934383639343532393437353265);
/*!40000 ALTER TABLE "apscheduler_daily" ENABLE KEYS */;

-- Dumping structure for table public.apscheduler_fit_quick
CREATE TABLE IF NOT EXISTS "apscheduler_fit_quick" (
	"id" VARCHAR(191) NOT NULL,
	"next_run_time" DOUBLE PRECISION NULL DEFAULT NULL,
	"job_state" BYTEA NOT NULL,
	PRIMARY KEY ("id"),
	INDEX "ix_apscheduler_fit_quick_next_run_time" ("next_run_time")
);

-- Dumping data for table public.apscheduler_fit_quick: 1 rows
/*!40000 ALTER TABLE "apscheduler_fit_quick" DISABLE KEYS */;
REPLACE INTO "apscheduler_fit_quick" ("id", "next_run_time", "job_state") VALUES
	('weekly_job_1', 1596045600, _binary 0x5c7838303034393530623034303030303030303030303030376439343238386330373736363537323733363936663665393434623031386330323639363439343863306337373635363536623663373935663661366636323566333139343863303436363735366536333934386331353566356636643631363936653566356633613737363536353662366337393566366136663632356633313934386330373734373236393637363736353732393438633139363137303733363336383635363437353663363537323265373437323639363736373635373237333265363337323666366539343863306234333732366636653534373236393637363736353732393439333934323938313934376439343238363830313462303238633038373436393664363537613666366536353934386330343730373937343761393438633032356637303934393339343238386330633431373336393631326634613631366236313732373436313934346431343634346230303863303334633464353439343734393435323934386330613733373436313732373435663634363137343635393434653863303836353665363435663634363137343635393434653863303636363639363536633634373339343564393432383863323036313730373336333638363536343735366336353732326537343732363936373637363537323733326536333732366636653265363636393635366336343733393438633039343236313733363534363639363536633634393439333934323938313934376439343238386330343665363136643635393438633034373936353631373239343863306136393733356636343635363636313735366337343934383838633062363537383730373236353733373336393666366537333934356439343863323536313730373336333638363536343735366336353732326537343732363936373637363537323733326536333732366636653265363537383730373236353733373336393666366537333934386330643431366336633435373837303732363537333733363936663665393439333934323938313934376439343863303437333734363537303934346537333632363137353632363831383863306134643666366537343638343636393635366336343934393339343239383139343764393432383638316438633035366436663665373436383934363831663838363832303564393436383234323938313934376439343638323734653733363236313735363236383138386330663434363137393466363634643666366537343638343636393635366336343934393339343239383139343764393432383638316438633033363436313739393436383166383836383230356439343638323432393831393437643934363832373465373336323631373536323638313838633039353736353635366234363639363536633634393439333934323938313934376439343238363831643863303437373635363536623934363831663838363832303564393436383234323938313934376439343638323734653733363236313735363236383138386330653434363137393466363635373635363536623436363936353663363439343933393432393831393437643934323836383164386330623634363137393566366636363566373736353635366239343638316638393638323035643934363832323863313635373635363536623634363137393532363136653637363534353738373037323635373337333639366636653934393339343239383139343764393432383638323734653863303536363639373237333734393434623033386330343663363137333734393434623033373536323631373536323638316132393831393437643934323836383164386330343638366637353732393436383166383936383230356439343638323238633066353236313665363736353435373837303732363537333733363936663665393439333934323938313934376439343238363832373465363834613462303136383462346230313735363236313735363236383161323938313934376439343238363831643863303636643639366537353734363539343638316638393638323035643934363835313239383139343764393432383638323734653638346134623030363834623462303037353632363137353632363831613239383139343764393432383638316438633036373336353633366636653634393436383166383836383230356439343638353132393831393437643934323836383237346536383461346230303638346234623030373536323631373536323635386330363661363937343734363537323934346537353632386330383635373836353633373537343666373239343863303736343635363636313735366337343934386330343631373236373733393432393863303636623737363137323637373339343764393436383164363830333863313236643639373336363639373236353566363737323631363336353566373436393664363539343464353830323863303836333666363136633635373336333635393438383863306436643631373835663639366537333734363136653633363537333934346230313863306436653635373837343566373237353665356637343639366436353934386330383634363137343635373436393664363539343863303836343631373436353734363936643635393439333934343330613037653430373165303130303030303030303030393436383066323836383130346437303632346230303863303335373439343239343734393435323934383639343532393437353265);
/*!40000 ALTER TABLE "apscheduler_fit_quick" ENABLE KEYS */;

-- Dumping structure for table public.apscheduler_fit_test
CREATE TABLE IF NOT EXISTS "apscheduler_fit_test" (
	"id" VARCHAR(191) NOT NULL,
	"next_run_time" DOUBLE PRECISION NULL DEFAULT NULL,
	"job_state" BYTEA NOT NULL,
	PRIMARY KEY ("id"),
	INDEX "ix_apscheduler_fit_test_next_run_time" ("next_run_time")
);

-- Dumping data for table public.apscheduler_fit_test: 1 rows
/*!40000 ALTER TABLE "apscheduler_fit_test" DISABLE KEYS */;
REPLACE INTO "apscheduler_fit_test" ("id", "next_run_time", "job_state") VALUES
	('weekly_job_1', NULL, _binary 0x5c7838303034393563663033303030303030303030303030376439343238386330373736363537323733363936663665393434623031386330323639363439343863306337373635363536623663373935663661366636323566333139343863303436363735366536333934386331353566356636643631363936653566356633613737363536353662366337393566366136663632356633313934386330373734373236393637363736353732393438633139363137303733363336383635363437353663363537323265373437323639363736373635373237333265363337323666366539343863306234333732366636653534373236393637363736353732393439333934323938313934376439343238363830313462303238633038373436393664363537613666366536353934386330343730373937343761393438633032356637303934393339343238386330633431373336393631326634613631366236313732373436313934346431343634346230303863303334633464353439343734393435323934386330613733373436313732373435663634363137343635393434653863303836353665363435663634363137343635393434653863303636363639363536633634373339343564393432383863323036313730373336333638363536343735366336353732326537343732363936373637363537323733326536333732366636653265363636393635366336343733393438633039343236313733363534363639363536633634393439333934323938313934376439343238386330343665363136643635393438633034373936353631373239343863306136393733356636343635363636313735366337343934383838633062363537383730373236353733373336393666366537333934356439343863323536313730373336333638363536343735366336353732326537343732363936373637363537323733326536333732366636653265363537383730373236353733373336393666366537333934386330643431366336633435373837303732363537333733363936663665393439333934323938313934376439343863303437333734363537303934346537333632363137353632363831383863306134643666366537343638343636393635366336343934393339343239383139343764393432383638316438633035366436663665373436383934363831663838363832303564393436383234323938313934376439343638323734653733363236313735363236383138386330663434363137393466363634643666366537343638343636393635366336343934393339343239383139343764393432383638316438633033363436313739393436383166383836383230356439343638323432393831393437643934363832373465373336323631373536323638313838633039353736353635366234363639363536633634393439333934323938313934376439343238363831643863303437373635363536623934363831663838363832303564393436383234323938313934376439343638323734653733363236313735363236383138386330653434363137393466363635373635363536623436363936353663363439343933393432393831393437643934323836383164386330623634363137393566366636363566373736353635366239343638316638393638323035643934363832323863313635373635363536623634363137393532363136653637363534353738373037323635373337333639366636653934393339343239383139343764393432383638323734653863303536363639373237333734393434623036386330343663363137333734393434623036373536323631373536323638316132393831393437643934323836383164386330343638366637353732393436383166383936383230356439343638323238633066353236313665363736353435373837303732363537333733363936663665393439333934323938313934376439343238363832373465363834613462303136383462346230313735363236313735363236383161323938313934376439343238363831643863303636643639366537353734363539343638316638393638323035643934363835313239383139343764393432383638323734653638346134623030363834623462303037353632363137353632363831613239383139343764393432383638316438633036373336353633366636653634393436383166383836383230356439343638353132393831393437643934323836383237346536383461346230303638346234623030373536323631373536323635386330363661363937343734363537323934346537353632386330383635373836353633373537343666373239343863303736343635363636313735366337343934386330343631373236373733393432393863303636623737363137323637373339343764393436383164363830333863313236643639373336363639373236353566363737323631363336353566373436393664363539343464353830323863303836333666363136633635373336333635393438383863306436643631373835663639366537333734363136653633363537333934346230313863306436653635373837343566373237353665356637343639366436353934346537353265);
/*!40000 ALTER TABLE "apscheduler_fit_test" ENABLE KEYS */;

-- Dumping structure for table public.apscheduler_worker_debug
CREATE TABLE IF NOT EXISTS "apscheduler_worker_debug" (
	"id" VARCHAR(191) NOT NULL,
	"next_run_time" DOUBLE PRECISION NULL DEFAULT NULL,
	"job_state" BYTEA NOT NULL,
	PRIMARY KEY ("id"),
	INDEX "ix_apscheduler_worker_debug_next_run_time" ("next_run_time")
);

-- Dumping data for table public.apscheduler_worker_debug: 1 rows
/*!40000 ALTER TABLE "apscheduler_worker_debug" DISABLE KEYS */;
REPLACE INTO "apscheduler_worker_debug" ("id", "next_run_time", "job_state") VALUES
	('weekly_job_2', NULL, _binary 0x5c7838303034393563663033303030303030303030303030376439343238386330373736363537323733363936663665393434623031386330323639363439343863306337373635363536623663373935663661366636323566333239343863303436363735366536333934386331353566356636643631363936653566356633613737363536353662366337393566366136663632356633323934386330373734373236393637363736353732393438633139363137303733363336383635363437353663363537323265373437323639363736373635373237333265363337323666366539343863306234333732366636653534373236393637363736353732393439333934323938313934376439343238363830313462303238633038373436393664363537613666366536353934386330343730373937343761393438633032356637303934393339343238386330633431373336393631326634613631366236313732373436313934346431343634346230303863303334633464353439343734393435323934386330613733373436313732373435663634363137343635393434653863303836353665363435663634363137343635393434653863303636363639363536633634373339343564393432383863323036313730373336333638363536343735366336353732326537343732363936373637363537323733326536333732366636653265363636393635366336343733393438633039343236313733363534363639363536633634393439333934323938313934376439343238386330343665363136643635393438633034373936353631373239343863306136393733356636343635363636313735366337343934383838633062363537383730373236353733373336393666366537333934356439343863323536313730373336333638363536343735366336353732326537343732363936373637363537323733326536333732366636653265363537383730373236353733373336393666366537333934386330643431366336633435373837303732363537333733363936663665393439333934323938313934376439343863303437333734363537303934346537333632363137353632363831383863306134643666366537343638343636393635366336343934393339343239383139343764393432383638316438633035366436663665373436383934363831663838363832303564393436383234323938313934376439343638323734653733363236313735363236383138386330663434363137393466363634643666366537343638343636393635366336343934393339343239383139343764393432383638316438633033363436313739393436383166383836383230356439343638323432393831393437643934363832373465373336323631373536323638313838633039353736353635366234363639363536633634393439333934323938313934376439343238363831643863303437373635363536623934363831663838363832303564393436383234323938313934376439343638323734653733363236313735363236383138386330653434363137393466363635373635363536623436363936353663363439343933393432393831393437643934323836383164386330623634363137393566366636363566373736353635366239343638316638393638323035643934363832323863313635373635363536623634363137393532363136653637363534353738373037323635373337333639366636653934393339343239383139343764393432383638323734653863303536363639373237333734393434623036386330343663363137333734393434623036373536323631373536323638316132393831393437643934323836383164386330343638366637353732393436383166383936383230356439343638323238633066353236313665363736353435373837303732363537333733363936663665393439333934323938313934376439343238363832373465363834613462313636383462346231363735363236313735363236383161323938313934376439343238363831643863303636643639366537353734363539343638316638393638323035643934363835313239383139343764393432383638323734653638346134623030363834623462303037353632363137353632363831613239383139343764393432383638316438633036373336353633366636653634393436383166383836383230356439343638353132393831393437643934323836383237346536383461346230303638346234623030373536323631373536323635386330363661363937343734363537323934346537353632386330383635373836353633373537343666373239343863303736343635363636313735366337343934386330343631373236373733393432393863303636623737363137323637373339343764393436383164363830333863313236643639373336363639373236353566363737323631363336353566373436393664363539343464353830323863303836333666363136633635373336333635393438383863306436643631373835663639366537333734363136653633363537333934346230313863306436653635373837343566373237353665356637343639366436353934346537353265);
/*!40000 ALTER TABLE "apscheduler_worker_debug" ENABLE KEYS */;

-- Dumping structure for table public.auth_group
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''auth_group_id_seq''::regclass)',
	"name" VARCHAR(150) NOT NULL,
	UNIQUE INDEX "auth_group_name_key" ("name"),
	PRIMARY KEY ("id"),
	INDEX "auth_group_name_a6ea08ec_like" ("name")
);

-- Dumping data for table public.auth_group: 0 rows
/*!40000 ALTER TABLE "auth_group" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_group" ENABLE KEYS */;

-- Dumping structure for table public.auth_group_permissions
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''auth_group_permissions_id_seq''::regclass)',
	"group_id" INTEGER NOT NULL,
	"permission_id" INTEGER NOT NULL,
	UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ("group_id", "permission_id"),
	PRIMARY KEY ("id"),
	INDEX "auth_group_permissions_group_id_b120cbf9" ("group_id"),
	INDEX "auth_group_permissions_permission_id_84c5c92e" ("permission_id"),
	CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.auth_group_permissions: 0 rows
/*!40000 ALTER TABLE "auth_group_permissions" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_group_permissions" ENABLE KEYS */;

-- Dumping structure for table public.auth_permission
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''auth_permission_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"content_type_id" INTEGER NOT NULL,
	"codename" VARCHAR(100) NOT NULL,
	UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ("content_type_id", "codename"),
	PRIMARY KEY ("id"),
	INDEX "auth_permission_content_type_id_2f476e4b" ("content_type_id"),
	CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.auth_permission: 28 rows
/*!40000 ALTER TABLE "auth_permission" DISABLE KEYS */;
REPLACE INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add greeting', 7, 'add_greeting'),
	(26, 'Can change greeting', 7, 'change_greeting'),
	(27, 'Can delete greeting', 7, 'delete_greeting'),
	(28, 'Can view greeting', 7, 'view_greeting');
/*!40000 ALTER TABLE "auth_permission" ENABLE KEYS */;

-- Dumping structure for table public.auth_user
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''auth_user_id_seq''::regclass)',
	"password" VARCHAR(128) NOT NULL,
	"last_login" TIMESTAMPTZ NULL DEFAULT NULL,
	"is_superuser" BOOLEAN NOT NULL,
	"username" VARCHAR(150) NOT NULL,
	"first_name" VARCHAR(30) NOT NULL,
	"last_name" VARCHAR(150) NOT NULL,
	"email" VARCHAR(254) NOT NULL,
	"is_staff" BOOLEAN NOT NULL,
	"is_active" BOOLEAN NOT NULL,
	"date_joined" TIMESTAMPTZ NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE INDEX "auth_user_username_key" ("username"),
	INDEX "auth_user_username_6821ab7c_like" ("username")
);

-- Dumping data for table public.auth_user: 1 rows
/*!40000 ALTER TABLE "auth_user" DISABLE KEYS */;
REPLACE INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES
	(1, 'pbkdf2_sha256$180000$shJkhxVyTFCD$GCo7DhgBnCaHkVpf/DuLniKzsr9D6VmDsbEtUL2oMoc=', '2020-07-03 18:14:54.310285+00', 'true', 'linearch', '', '', 'rizqinur2010@gmail.com', 'true', 'true', '2020-07-03 17:46:48.98674+00');
/*!40000 ALTER TABLE "auth_user" ENABLE KEYS */;

-- Dumping structure for table public.auth_user_groups
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''auth_user_groups_id_seq''::regclass)',
	"user_id" INTEGER NOT NULL,
	"group_id" INTEGER NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ("user_id", "group_id"),
	INDEX "auth_user_groups_group_id_97559544" ("group_id"),
	INDEX "auth_user_groups_user_id_6a12ed8b" ("user_id"),
	CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.auth_user_groups: 0 rows
/*!40000 ALTER TABLE "auth_user_groups" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_user_groups" ENABLE KEYS */;

-- Dumping structure for table public.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''auth_user_user_permissions_id_seq''::regclass)',
	"user_id" INTEGER NOT NULL,
	"permission_id" INTEGER NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ("user_id", "permission_id"),
	INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ("permission_id"),
	INDEX "auth_user_user_permissions_user_id_a95ead1b" ("user_id"),
	CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.auth_user_user_permissions: 0 rows
/*!40000 ALTER TABLE "auth_user_user_permissions" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_user_user_permissions" ENABLE KEYS */;

-- Dumping structure for table public.django_admin_log
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''django_admin_log_id_seq''::regclass)',
	"action_time" TIMESTAMPTZ NOT NULL,
	"object_id" TEXT NULL DEFAULT NULL,
	"object_repr" VARCHAR(200) NOT NULL,
	"action_flag" SMALLINT NOT NULL,
	"change_message" TEXT NOT NULL,
	"content_type_id" INTEGER NULL DEFAULT NULL,
	"user_id" INTEGER NOT NULL,
	PRIMARY KEY ("id"),
	INDEX "django_admin_log_content_type_id_c4bce8eb" ("content_type_id"),
	INDEX "django_admin_log_user_id_c564eba6" ("user_id"),
	CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "django_admin_log_action_flag_check" CHECK (((action_flag >= 0)))
);

-- Dumping data for table public.django_admin_log: 0 rows
/*!40000 ALTER TABLE "django_admin_log" DISABLE KEYS */;
/*!40000 ALTER TABLE "django_admin_log" ENABLE KEYS */;

-- Dumping structure for table public.django_content_type
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''django_content_type_id_seq''::regclass)',
	"app_label" VARCHAR(100) NOT NULL,
	"model" VARCHAR(100) NOT NULL,
	UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ("app_label", "model"),
	PRIMARY KEY ("id")
);

-- Dumping data for table public.django_content_type: 7 rows
/*!40000 ALTER TABLE "django_content_type" DISABLE KEYS */;
REPLACE INTO "django_content_type" ("id", "app_label", "model") VALUES
	(1, 'admin', 'logentry'),
	(2, 'auth', 'permission'),
	(3, 'auth', 'group'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(7, 'web', 'greeting');
/*!40000 ALTER TABLE "django_content_type" ENABLE KEYS */;

-- Dumping structure for table public.django_migrations
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''django_migrations_id_seq''::regclass)',
	"app" VARCHAR(255) NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"applied" TIMESTAMPTZ NOT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.django_migrations: 19 rows
/*!40000 ALTER TABLE "django_migrations" DISABLE KEYS */;
REPLACE INTO "django_migrations" ("id", "app", "name", "applied") VALUES
	(1, 'contenttypes', '0001_initial', '2020-06-29 15:26:57.466341+00'),
	(2, 'auth', '0001_initial', '2020-06-29 15:26:57.656774+00'),
	(3, 'admin', '0001_initial', '2020-06-29 15:26:57.837434+00'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2020-06-29 15:26:57.881474+00'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-06-29 15:26:57.913491+00'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2020-06-29 15:26:57.963943+00'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2020-06-29 15:26:57.98828+00'),
	(8, 'auth', '0003_alter_user_email_max_length', '2020-06-29 15:26:58.013656+00'),
	(9, 'auth', '0004_alter_user_username_opts', '2020-06-29 15:26:58.033041+00'),
	(10, 'auth', '0005_alter_user_last_login_null', '2020-06-29 15:26:58.067729+00'),
	(11, 'auth', '0006_require_contenttypes_0002', '2020-06-29 15:26:58.080399+00'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2020-06-29 15:26:58.107703+00'),
	(13, 'auth', '0008_alter_user_username_max_length', '2020-06-29 15:26:58.141496+00'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2020-06-29 15:26:58.162686+00'),
	(15, 'auth', '0010_alter_group_name_max_length', '2020-06-29 15:26:58.18392+00'),
	(16, 'auth', '0011_update_proxy_permissions', '2020-06-29 15:26:58.204022+00'),
	(17, 'sessions', '0001_initial', '2020-06-29 15:26:58.237658+00'),
	(18, 'web', '0001_initial', '2020-06-29 15:26:58.263903+00'),
	(19, 'web', '0002_auto_20200704_0029', '2020-07-03 17:40:32.53191+00');
/*!40000 ALTER TABLE "django_migrations" ENABLE KEYS */;

-- Dumping structure for table public.django_session
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key" VARCHAR(40) NOT NULL,
	"session_data" TEXT NOT NULL,
	"expire_date" TIMESTAMPTZ NOT NULL,
	PRIMARY KEY ("session_key"),
	INDEX "django_session_expire_date_a5c62663" ("expire_date"),
	INDEX "django_session_session_key_c0390e0f_like" ("session_key")
);

-- Dumping data for table public.django_session: 0 rows
/*!40000 ALTER TABLE "django_session" DISABLE KEYS */;
/*!40000 ALTER TABLE "django_session" ENABLE KEYS */;

-- Dumping structure for table public.test
CREATE TABLE IF NOT EXISTS "test" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''test_id_seq''::regclass)',
	"num" INTEGER NULL DEFAULT NULL,
	"data" VARCHAR NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.test: 0 rows
/*!40000 ALTER TABLE "test" DISABLE KEYS */;
/*!40000 ALTER TABLE "test" ENABLE KEYS */;

-- Dumping structure for table public.web_greeting
CREATE TABLE IF NOT EXISTS "web_greeting" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''web_greeting_id_seq''::regclass)',
	"when" TIMESTAMPTZ NOT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.web_greeting: 1 rows
/*!40000 ALTER TABLE "web_greeting" DISABLE KEYS */;
REPLACE INTO "web_greeting" ("id", "when") VALUES
	(1, '2020-06-29 15:28:46.358206+00');
/*!40000 ALTER TABLE "web_greeting" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;