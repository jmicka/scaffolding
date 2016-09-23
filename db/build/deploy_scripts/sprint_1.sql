\echo "Running deploy script to update DB from build 0 to build 1"

BEGIN TRANSACTION;

\echo "Configure database with appropriate extensions"
-- necessary for analyzing performance issues over time
CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;
-- useful for handling comparisons between é and e
CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;
-- UUIDs are helpful
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;

\echo "Sourcing new domains"
\i domains/sample_domain.sql;

\echo "Sourcing new functions"
\i functions/fn_json_object_set_key.sql;

\echo "Sourcing new tables"
\i tables/t_sample.sql;

\echo "Sourcing new views"
\i views/v_sample.sql;

\echo "Sourcing new types"
\i types/type_sample.sql;

\echo "Sourcing new triggers"
\i triggers/trigger_sample.sql;

\echo "Sourcing new stored procedures"
\i stored_procedures/sp_sample_sproc.sql;

