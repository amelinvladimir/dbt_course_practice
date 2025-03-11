{% snapshot dim_aircrafts %}

{{
   config(
       target_schema= 'snapshot',
       unique_key= ["aircraft_code"],
       strategy= 'check',
       check_cols= ['model', 'range']
   )
}}

SELECT
    "aircraft_code",
    "model",
    "range"
FROM
    {{ ref('stg_flights__aircrafts') }}

{% endsnapshot %}