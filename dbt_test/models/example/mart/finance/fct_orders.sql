

with orders as (
        select * from {{ref ('stg_orders')}}
),

payments as (
        select * from {{ref('stg_stripe_payments')}}
),

order_payment as (

        select
                order_id,
            sum(payments.amount) as amount
        from payments
        group by 1

),
final as(
        select 
                orders.order_id,
                orders.cus_id,
                orders.order_date,
               coalesce(order_payment.amount, 0) as tot_spendings
        from orders
        left join order_payment using (order_id)
)
select * from final