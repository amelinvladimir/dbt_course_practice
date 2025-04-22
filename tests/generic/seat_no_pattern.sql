{% test seat_no_pattern(model, column_name) %}

SELECT
FROM
    {{ model }}
where not ({{ column_name }} ~ '^[0-9]{1,2}[A-Za-z]+$')

{% endtest %}