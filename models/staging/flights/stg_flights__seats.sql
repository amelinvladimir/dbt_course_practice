{{
    config(
        materialized = 'table'
    )
}}
select
    aircraft_code,
    seat_no,
    fare_conditions

from 
    {{ source('demo_src', 'seats') }}
  