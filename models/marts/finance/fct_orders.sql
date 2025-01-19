with orders as (
    select *
    from {{ ref('stg_jaffle_shop__orders') }}
),
payment as (
    select *
    from {{ ref('stg_stripe__payment') }} 
)
select
    ord.order_id,
    ord.customer_id,
    pay.amount
from orders as ord 
left join payment as pay
on ord.order_id=pay.order_id