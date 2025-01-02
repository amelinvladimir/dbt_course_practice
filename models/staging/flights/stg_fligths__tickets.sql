{{
    config(
        materialized = 'table',
    )
}}
SELECT 
    ticket_no, 
    book_ref, 
    passenger_id, 
    passenger_name, 
    contact_data
FROM
    {{ source('demo_src', 'tickets') }}