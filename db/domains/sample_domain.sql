CREATE DOMAIN SAMPLE_DOMAIN AS CHARACTER VARYING(10)
	CHECK(VALUE IN('sample', 'foo', 'bar'));