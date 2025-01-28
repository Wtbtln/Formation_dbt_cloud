{% macro get_col_to_list(col1,tableA) %}
  {% set query %}
    SELECT DISTINCT status
    FROM {{ ref('stg_stripe__payment') }}
  {% endset %}

  {% set result = run_query(query) %}
  {% set value_list=''   %}
  {% if result %}
        {% set values = result.columns[0].values() %} 
    {% for value in values -%}
        {{value}}
        {% if loop.first %}
            {% set value_list = value %}
        {% else %}
            {% set value_list = value_list + ', ' + value %}
        {% endif %}
    {% endfor %}
  {% endif %}
  {{value_list}}
{% endmacro %}

{% macro get_distinct_values(colA,tabB) %}
    {% set result = run_query("SELECT DISTINCT {{colA}} FROM {{ ref('{{tabB}}') }}") %}
    {% if result %}
        {% set values = result.columns[0].values() -%}
        {{ values }}
    {% endif -%}
{% endmacro %}

{{ get_distinct_values('status','stg_stripe__payment') }}


{% macro get_distinct_value3(colA,tabB) -%}
  {% set query -%}
    SELECT DISTINCT {{colA}}
    FROM {{ ref('tabB') }}
  {% endset %}

  {% set result = run_query(query) -%}
    {% if result %}
        {% set values = result.columns[0].values() -%}
        {{ values }}
    {% endif -%}
{% endmacro %}
{{ get_distinct_value3('customer_id','stg_jaffle_shop__customers') }}
