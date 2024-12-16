{{
    config(
        materialized = 'table'
    )
}}
select
    aircraft_code, 
    model, 
    "range"
from
    {{ source('demo_src', 'aircrafts') }}