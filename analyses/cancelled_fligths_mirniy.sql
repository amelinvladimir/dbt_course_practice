SELECT  
    scheduled_departure::date as scheduled_departure,
    COUNT(*) as cancelled_fligth_cnt
FROM
    {{ ref('fct_fligths') }}
WHERE 
    departure_airport = 'MJZ'
    AND status = 'Cancelled'
GROUP BY
    scheduled_departure::date

--MJZ