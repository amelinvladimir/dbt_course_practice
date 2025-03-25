{{
    config(
        materialized = 'table'
    )
}}
SELECT
    airport_code,
    airport_name,
    city,
    coordinates,
    timezone,
    'bookings' as RECORD_SOURCE,
    now() as LOAD_DATE
FROM
    {{ source('demo_src', 'airports') }}

