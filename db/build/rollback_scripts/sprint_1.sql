\echo "Running rollback script to revert DB from build 1 to build 0"

\c postgres;

DROP DATABASE IF EXISTS sample_db
