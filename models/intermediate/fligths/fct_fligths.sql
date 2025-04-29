{{
    config(
        materialized = 'table'
    )
}}
select
    flight_id, 
    flight_no, 
    scheduled_departure, 
    scheduled_arrival, 
    departure_airport, 
    arrival_airport, 
    status, 
    aircraft_code, 
    actual_departure, 
    actual_arrival,
    case
        when actual_departure is not null and scheduled_departure < actual_departure
            then actual_departure - scheduled_departure
            else INTERVAL '0 seconds'
    end as flight_departure_delay
from
    {{ ref('stg_flights__flights') }}