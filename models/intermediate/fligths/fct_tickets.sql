{{
    config(
        materialized = 'table'
    )
}}
select
    ticket_no, 
    book_ref, 
    passenger_id, 
    passenger_name, 
    contact_data
from
    {{ ref('stg_fligths__tickets') }}