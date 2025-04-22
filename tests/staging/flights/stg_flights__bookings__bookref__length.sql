{{
    config(
        severity = 'error',
        error_if = '>1500000',
        warn_if = '>1470000'
    )
}}
SELECT
    b.book_ref
FROM
    {{ ref('stg_flights__bookings') }} b
    JOIN {{ ref('stg_fligths__tickets') }} t
        ON b.book_ref = t.book_ref
WHERE
    length(b.book_ref) > 5