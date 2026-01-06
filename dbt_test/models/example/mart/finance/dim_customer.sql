
with customers as (
    
        select * from {{ref ('stg_customers')}}
),
    order_paid as (
        select * from {{ref('fct_orders')}}
), 
    cus_spending as (
        select 
            cus_id as cus_id,
            count(order_id) as tot_purchase,
            min(order_date) as first_pur_date,
            max(order_date) as most_rec_pur,
            sum(tot_spendings) as cltv
        from order_paid
        group by 1
), 
    cltv as (
        select 
            customers.cus_id as cus_id,
            customers.first_name as first_name,
            cus_spending.first_pur_date as first_pur_date,
            cus_spending.most_rec_pur as last_pur_date,
            coalesce(tot_purchase, 0) as tot_orders,
            cus_spending.cltv
        from customers
        left join cus_spending using(cus_id)
)
    select * from cltv