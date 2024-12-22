{{
    config(
        materialized = 'table',
    )
}}
SELECT 
    ticket_no, 
    flight_id, 
    boarding_no, 
    seat_no
FROM
    {{ source('demo_src', 'boarding_passes') }}