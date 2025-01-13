{{
    config(
        materialized = 'table',
    )
}}
SELECT
    city,
    region
FROM
    {{ ref('city_region') }}