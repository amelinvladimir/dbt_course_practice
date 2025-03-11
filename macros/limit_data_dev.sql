{% macro limit_data_dev(column_name, days=5000) %}
{% if target.name == 'dev' %}
WHERE
    {{ column_name }} >= current_date - interval '{{ days }} days'
{% endif %}
{% endmacro %}