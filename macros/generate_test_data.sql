{% macro generate_test_data() %}
  {% if flags.TEST_DATA %}
    INSERT INTO {{ ref('stg_flights__flights') }} 
    (
        flight_id, 
        flight_no, 
        scheduled_departure, 
        scheduled_arrival, 
        departure_airport, 
        arrival_airport, 
        status, 
        aircraft_code, 
        actual_departure, 
        actual_arrival
    )
    VALUES (
        1000000, 
        1000000, 
        '2025-03-15T09:25:00+00:00'::timestamp, 
        '2025-03-15T13:15:00+00:00'::timestamp, 
        'msk', 
        'spb', 
        'ARRIVED', 
        '747', 
        '2025-03-15T09:25:00+00:00'::timestamp,
        '2025-03-15T13:15:00+00:00'::timestamp
    );
  {% endif %}
{% endmacro %}

    