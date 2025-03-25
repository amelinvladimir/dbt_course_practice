{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "raw_airports"
derived_columns:
  SOURCE: "!1"
  LOAD_DATETIME: "LOAD_DATE"
  EFFECTIVE_FROM: "LOAD_DATE::date"
hashed_columns:
  AIRPORT_HK: "airport_code"
  AIRPORT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "airport_name"
      - "city"
      - "coordinates"
      - "timezone"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}