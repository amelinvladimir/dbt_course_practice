{% macro count_project_entities() %}
    {% do log('Всего в проекте:', True) %}
    {% do log('- ' ~ graph.nodes.values() | selectattr("resource_type", "equalto", "model") | list | length ~ ' моделей', True) %}
    {% do log('- ' ~ graph.nodes.values() | selectattr("resource_type", "equalto", "seed") | list | length ~ ' seed', True) %}
    {% do log('- ' ~ graph.nodes.values() | selectattr("resource_type", "equalto", "snapshot") | list | length ~ ' snapshot', True) %}
{% endmacro %}