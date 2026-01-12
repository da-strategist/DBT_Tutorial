

select order_id,
        sum(amount) as tot_amount
from {{ref('stg_stripe_payments')}}
group by 1
having tot_amount < 0