{{
  config(
    materialized = 'table',
    pre_hook = "
      {% set now = modules.datetime.datetime.now().strftime('%Y_%m_%d_%H%M%S') %}
      {% set old_relation = adapter.get_relation(
            database=this.database,
            schema=this.schema,
            identifier=this.identifier) %}

      {%   set backup_relation = api.Relation.create(
            database = this.database,
            schema = this.schema,
            identifier = this.identifier ~ '__' ~ now,
            type = 'table') 
      %}

      {% if old_relation %} 
        {% do adapter.rename_relation(old_relation, backup_relation) %} 
      {% endif %}

    "
  )
}}

select
    aircraft_code, 
    model, 
    "range"
from
    {{ source('demo_src', 'aircrafts') }} 