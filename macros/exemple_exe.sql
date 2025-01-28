{#
{%  set my_string='wow'%}
{%  set my_seconde_string='it is jinja!'%}
{%  set my_number=100 %}

{{my_string}} {{my_seconde_string}} I want to use it for {{my_number}} years!


{%set my_list=['cat','dog','chick']%}
{{my_list[0]}}

{%-for animal in my_list %}
test
My fiverate animal is {{animal}}
{%-endfor %}


{%- set day=6    -%}
{%- if day==1    -%}
Today is Monday.
{%- else %}  {%-if day==6 -%}
We take a rest.
{%-  else-%}
We do not go to work.
{%-  endif %}
{%- endif %}


{%-  set websters_dict= {
    "word":"data",
    "speach":none,
    "discription":"if you want to know"
}
-%}
{{ websters_dict['word']}} {{ websters_dict['speach']}}: is "{{ websters_dict['discription']}}"
#}
{# pas bon
{%  run_query("SELECT distinct payment_method FROM {{ ref('stg_stripe__payment') }} ") %}

{% set result = run_query("SELECT distinct payment_method FROM {{ ref('stg_stripe__payment') }} ") %}
{% set values = result.columns[0] %}
select {{value}} from None
{{result.columns[0][0]}}
{% set result = ['credit_card','coupon'] %}

{% set result = run_query("SELECT distinct payment_method FROM {{ ref('stg_stripe__payment') }} ") %}
{% set values = result.columns[0] %}
#}


{#
{% macro get_distinct_col1_values(col1,tableA) %}
  {% set query %}
    SELECT DISTINCT col1
    FROM {{ ref('tableA') }}
  {% endset %}

  {% set result = run_query(query) %}
  
  {% if result %}
    {% set values = result.columns[0] %}
    {% for value in values %}
      {% do log(value, info=True) %}
    {% endfor %}
  {% else %}
    {% do log("Aucune valeur trouvée.", info=True) %}
  {% endif %}
{% endmacro %}

  {%- set query -%}
    SELECT DISTINCT status
    FROM {{ ref('stg_stripe__payment') }}
  {% endset -%}
  {%- set results = run_query(query) %}
  {% if results %}
        {% set values = results.columns[0].values() %} 
    {% for value in values -%}
        {{value}}
        {% if loop.first %}
            {% set value_list = value %}
        {% else %}
            {% set value_list = value_list + ', ' + value %}
        {% endif %}
    {% endfor -%} 

  {% endif %}
  {{value_list}}

    {%- set query -%}
    SELECT DISTINCT status
    FROM {{ ref('stg_stripe__payment') }}
  {% endset -%}
  {%- set results = run_query(query) %}
  {% if results %}
        {% set values = results.columns[0].values() %} 
  {% endif %}
  {{value_list}}


  {%- set result = run_query(query) %}

   {% if result %}
  {% set values = result.columns[0] -%}
     {{values}}
    {% for value in values -%}
        {{value}}
        {%  set value_list={{value_list}}:',':{{value}} %}
    {% endfor -%} 
      {% endif %}
  {{value_list}}

{{ get_col_to_list('status','stg_stripe__payment')}}

  {%- set query -%}
    SELECT DISTINCT status
    FROM {{ ref('stg_stripe__payment') }}
  {% endset -%}
  {%- set results = run_query(query) %}
  {% if results %}
    {% set values = results.columns[0].values() %} 
    {{values}}
    {% for value in values -%}
        {{value}}
        {{value_list}}
        {% if loop.first %}
            {% set value_list = {{value}} %}
            {{value_list}}
        {% else %}
            {% set value_list = {{value_list}} + ', ' + {{value}} %}
            {{value_list}}
        {% endif %}
    {% endfor -%} 

  {% endif %}

{% set result = run_query("SELECT DISTINCT status FROM {{ ref('stg_stripe__payment') }}") %}
{% if result %}
    {% set rows = result.columns[0].values() %}

    {% set list_data = rows | list %}
{% endif %}
{{list_data}} #}

SELECT *
FROM {{ ref('stg_jaffle_shop__orders') }}
WHERE customer_id IN {{ get_distinct_value3('customer_id','stg_jaffle_shop__customers') }}