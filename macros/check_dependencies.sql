{% macro check_dependencies() %}
  {% if execute %}
    {% set current_model = model.name %}
    {% set deps = model.depends_on.nodes | length %}
    
    {% if deps > 5 %}
      {{ log("⚠️ Модель " ~ current_model ~ " зависит от  " ~ deps ~ " объектов!", info=True) }}
      {{ log(model.depends_on.nodes, info=True) }}
    {% endif %}
  {% endif %}
{% endmacro %}