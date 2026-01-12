 

 select 
            cus_id, 
            min(order_date) as first_order,
            max(order_date) as most_recent_order,
            count(order_id) as tot_orders
    from {{ref('stg_orders')}}
    group by 1