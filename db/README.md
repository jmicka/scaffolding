# database
DDL scripts to create database structure

Sourcing the ./build/init.sql script will be sufficient to drop any existing records 
and recreate the DDL from the individual files.

> psql --host=$server --port=$port --user=$username --file=./build/init.sql

Useful scripts / tools for diffing DBs:
> pg_dump: http://www.postgresql.org/docs/9.4/static/app-pgdump.html
> apgdiff: http://apgdiff.com/how_to_use_it.php

The following might be really helpful (e.g. identifying schema diffs between dev and prod):

> pg_dump --host=$PG_HOST --username=$PG_USER --file=prod SAMPLE_DB -s
> pg_dump --host=localhost --file=localhost SAMPLE_DB -s
>
> java -jar apgdiff-2.4.jar --ignore-start-with prod localhost
