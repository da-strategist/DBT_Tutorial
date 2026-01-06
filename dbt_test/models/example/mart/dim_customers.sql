
with customers as (
    select * from {{ref('stg_customers')}}

),

    orders as (
    
    select * from {{ref('stg_orders') }}

), 
    cus_orders as (
    select * from {{ref('stg_cus_orders')}}
),
    final as (
    select
        customers.cus_id,
        customers.first_name,
        customers.last_name,
        cus_orders.first_order,
        cus_orders.most_recent_order,
        coalesce(cus_orders.tot_orders, 0) as tot_orders,
        date_diff(cus_orders.most_recent_order, cus_orders.first_order, DAY) as days_btw_next_pur
    from customers 
    left join cus_orders using (cus_id)
)
select * from final

