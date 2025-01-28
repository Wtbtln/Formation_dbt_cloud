{% macro get_distinct_value() %}
    {% set results = run_query("SELECT DISTINCT status FROM {{ ref('stg_stripe__payment') }}") %}
    
    {% if results  %}
        {% set values = results.columns[0].values() %}
        {{ return(values) }}
    {% else %}
        {{ return([]) }}
    {% endif %}
{% endmacro %}

  {% set query %}
    SELECT DISTINCT status
    FROM {{ ref('stg_stripe__payment') }}
  {% endset %}
  {% set result = run_query ( query ) %}

{% if result %}
    {% set rows = result.columns[0].values() %}
    {{rows}}

{% endif %}
{{list_data}}

    {% set list_data = rows | list %}
    
{% macro convert_tuple_to_list(tuple_data) %}
    {{ tuple_data | list }}
{% endmacro %}
{{ convert_tuple_to_list((1,2,3)) }} 

{% set result = run_query("SELECT DISTINCT status FROM {{ ref('stg_stripe__payment') }}") %}
{% if result %}
    {% set rows = result.columns[0].values() %}
    {% set list_data = rows | list %}
{% endif %}

  {%- set query -%}
    SELECT DISTINCT status
    FROM {{ ref('stg_stripe__payment') }}
  {% endset -%}
  {%- set results = run_query(query) %}
  {% if results %}
        {% set rows = results.columns[0].values() %} 
        {% set list_data = rows | list %}
  {% endif %}


{% set A = (1, 2, 3) %}  {# A est un tuple #}
{% set B = [2, 3, 4] %}  {# B est une liste #}
{% do log("A est : " ~ A, info=True) %}
{{ A | length() }}

-- Afficher les types d'objets
Type de A : {{ A | type }}
Type de B : {{ B | type }}

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="to_date('01/01/2025', 'mm/dd/yyyy')",
    end_date="dateadd(week, 1, current_date)"
    )
}}