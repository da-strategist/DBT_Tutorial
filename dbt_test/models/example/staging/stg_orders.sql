


select
            id as order_id,
            user_id as cus_id,
            order_date,
            status,
            _etl_loaded_at as load_time
    from dbt-tutorial.jaffle_shop.orders