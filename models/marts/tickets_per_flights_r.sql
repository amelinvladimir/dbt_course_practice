{{
    config(
        materialized = 'view',
    )
}}
SELECT
    flight_no as "Номер полета", 
    tickets as "Количество купленных билетов" 
FROM
    {{ ref('tickets_per_flights') }}