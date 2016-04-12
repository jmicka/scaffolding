-- sourced from StackOverflow: http://stackoverflow.com/a/23500670

CREATE OR REPLACE FUNCTION fn_json_object_set_key(
    _json JSON,
    _key_to_set TEXT,
    _value_to_set ANYELEMENT
)

RETURNS JSON IMMUTABLE STRICT AS

$$
    SELECT  CONCAT('{', STRING_AGG(TO_JSON("key") || ':' || "value", ','), '}')::JSON
    FROM    (   SELECT  *
                FROM    JSON_EACH(_json)
                WHERE   "key" <> _key_to_set
                UNION ALL
                SELECT  _key_to_set, TO_JSON(_value_to_set) ) AS "fields"
$$ LANGUAGE SQL SECURITY DEFINER;

