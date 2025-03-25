{% macro elements_cnt_v2() %}

{% if execute %}

{% set models_cnt = 0 %}
{% set seeds_cnt = 0 %}
{% set snapshots_cnt = 0 %}
   
{% for node in [1, 2, 3] %}
    {% do log('0 ' ~ models_cnt, True)%}
    {% set models_cnt = models_cnt + 1 %}
    {% do log('1 ' ~ models_cnt, True)%}
    {% do log('2 ' ~ models_cnt, True)%}
    {% set some_vrb = 1 %}
    {% do log('-1 ' ~ some_vrb, True)%}
{% endfor %}
{% do log('3 ' ~ models_cnt, True)%}
{% do log('-2 ' ~ some_vrb1, True)%}

{% set result %}
    Всего в проекте:
    - {{ models_cnt }} моделей
    - {{ seeds_cnt }} seed
    - {{ snapshots_cnt }} snapshot
{% endset %}

{% do log(result, True)%}

{% endif %}
{% endmacro %}