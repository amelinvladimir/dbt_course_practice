{% macro log_results(results) %}

  {% if execute %}  
    {% set query %}
      INSERT INTO {{ target.database }}.logs.dbt_logs
      (event_date, event_name, node_name)
      VALUES
        {% for res in results -%}
            ('{{ res.timing[0].completed_at }}', 'run model', '{{ res.node.unique_id }}') 
            {% if not loop.last %},{% endif %}
        {% endfor %};
    {% endset %}
    {% do run_query(query) %}
  {% endif %}

{% endmacro %}