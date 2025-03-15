{% macro check_dependencies() %}
  {% if execute %}
    {% set current_model = model.name %}
    {% set deps = graph.nodes[model.unique_id].depends_on.nodes | length %}
    
    {% if deps > 1 %}
      {{ log("⚠️ Модель " ~ current_model ~ " имеет " ~ deps ~ " зависимостей!", info=True) }}
      {{ log(graph.nodes[model.unique_id].depends_on.nodes, info=True) }}
    {% endif %}
  {% endif %}
{% endmacro %}