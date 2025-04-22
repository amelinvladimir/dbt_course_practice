{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'append', 
        tags = ['bookings']
    )
}}
SELECT
    book_ref,
    book_date,
    {{ kopeck_to_ruble('total_amount') }} as total_amount
FROM
    {{ source('demo_src', 'bookings') }}
{% if is_incremental() %}
WHERE 
    {{ bookref_to_bigint('book_ref') }} > (SELECT MAX({{ bookref_to_bigint('book_ref') }}) FROM {{ this }})
{% endif %} 