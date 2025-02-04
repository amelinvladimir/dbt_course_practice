{% set important_aircrafts = ['CN1', 'CR2', '763'] %}

SELECT 
    {% for aircraft in important_aircrafts -%}
    SUM(CASE WHEN aircraft_code = '{{ aircraft }}' THEN 1 ELSE 0 END) as fligths_{{ aircraft }} 
        {%- if not loop.last %},{% endif %}
    {%- endfor %}
FROM
    {{ ref('fct_fligths') }}