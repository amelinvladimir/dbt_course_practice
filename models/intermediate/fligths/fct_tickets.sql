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
where passenger_id not in (select cast(passenger_id as varchar) from {{ ref('airline_worker') }})