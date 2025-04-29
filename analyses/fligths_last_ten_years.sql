{% set date_today = run_started_at|string() %}
{% set prev_year = run_started_at.year|int - 10|int %}
{% set prev_date = prev_year ~ date_today[4:]|string() %}
  
SELECT 
    COUNT(scheduled_departure)
FROM {{ ref('fct_fligths') }}
WHERE scheduled_departure BETWEEN '{{prev_date}}' and '{{ date_today }}'