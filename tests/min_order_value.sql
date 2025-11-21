with orders as (
    select *
    from analytics.dbt_arohi.stg_orders
)

select order_id, total_price
from orders
where total_price <= 800