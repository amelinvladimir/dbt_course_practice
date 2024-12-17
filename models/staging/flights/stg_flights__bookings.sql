{{
    config(
        materialized = 'table'
    )
}}
select
    book_ref,
    book_date,
    total_amount

from {{ source('demo_src', 'bookings') }}