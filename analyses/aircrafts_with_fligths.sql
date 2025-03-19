{% set aircraft_codes_with_fligths = dbt_utils.get_column_values(
    table=ref('stg_flights__flights'),
    column='aircraft_code'
) %}

SELECT * 
FROM {{ ref('stg_flights__aircrafts') }}
WHERE aircraft_code in ('{{ aircraft_codes_with_fligths | join("', '") }}')
