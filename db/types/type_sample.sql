DO $$
BEGIN
	IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'type_sample') THEN
		DROP TYPE type_sample CASCADE;
	END IF;
END $$;

CREATE TYPE type_sample AS (
	string VARCHAR(128)
);