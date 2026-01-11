
select 
            id as cus_id,
            first_name,
            last_name
    from {{source('jaffle-shop-source', 'customers')}}