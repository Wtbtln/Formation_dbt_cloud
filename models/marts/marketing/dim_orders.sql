with customers as (

     select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as ( 

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

payment as (
    select 
        ord.customer_id,
        --sum(pay.amount) as amount_total
        sum (case when pay.status = 'success' then amount else 0 end) as amount_total
    from {{ ref('stg_jaffle_shop__orders') }} as ord
    inner join {{ ref('stg_stripe__payment') }} as pay
    on ord.order_id=pay.order_id
    --where pay.status='success'
    group by 1
),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce (customer_orders.number_of_orders, 0) 
        as number_of_orders,
        coalesce (payment.amount_total,0) as lifetime_value

    from customers

    left join customer_orders using (customer_id)
    left join payment using (customer_id)

)

select * from final