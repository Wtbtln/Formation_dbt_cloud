{%- set values = ['credit_card','coupon'] -%}
with payments as (
    select * from {{ ref('stg_stripe__payment')}}
)
select 
    order_id,
    {%  for payment_type in values -%}
    sum( case when payment_method='{{payment_type}}' then amount else 0 end) as {{payment_type}}_amount
    {%- if not loop.last %} , {% endif %}
    {% endfor -%}
from payments
where status='success'
group by 1