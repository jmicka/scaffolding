
-- Ensure All connections are terminated
SELECT 	pg_terminate_backend(pg_stat_activity.pid)
	FROM 	pg_stat_activity
	WHERE 	datname = 'sample_db'
			AND pid <> pg_backend_pid();

DROP DATABASE IF EXISTS sample_db;

DO
$createusers$
BEGIN

	IF NOT EXISTS (
		SELECT *
		FROM   pg_catalog.pg_user
		WHERE  usename = 'SAMPLE_USER')
	THEN
		CREATE USER SAMPLE_USER WITH PASSWORD 'password' SUPERUSER;
	END IF;

END;
$createusers$;

SET ROLE 'sample_user';

CREATE DATABASE SAMPLE_DB;

-- ensure the DB is using the same config settings as prod/testing servers
ALTER SYSTEM SET TIMEZONE TO 'UTC';

-- ensure we are using the appropriate db
\c sample_db;

-- build archived version of (scrubbed) db
\i build/deploy_scripts/builds/build_0.db;

-- execute db scripts to advance db to next version
\i build/deploy_scripts/sprint_1.sql;
COMMIT;

-- make sure we have minimum set of possible permissions
REVOKE ALL ON ALL TABLES IN SCHEMA information_schema FROM public;
