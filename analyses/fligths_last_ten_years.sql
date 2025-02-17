{% set current_date = run_started_at | string | truncate(10, True, "")   %}
{% set current_year = run_started_at | string | truncate(4, True, "") | int  %}
{% set prev_year = current_year - 10 %}

SELECT 
    COUNT(*)
FROM
    {{ ref('fct_fligths') }}
WHERE 
    scheduled_departure BETWEEN '{{ current_date }}' AND '{{ current_date | replace(current_year, prev_year) }}'