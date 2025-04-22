SELECT
    f.flight_no, 
    count(ft.flight_id) AS tickets
FROM
    {{ ref('fct_fligths') }} f
    LEFT JOIN {{ ref('fct_ticket_flights') }} ft 
        ON ft.flight_id = f.flight_id
    LEFT JOIN {{ ref('fct_tickets') }} t
        ON t.ticket_no = ft.ticket_no
GROUP BY
    f.flight_no