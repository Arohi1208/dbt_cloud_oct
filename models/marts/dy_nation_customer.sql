{{ config(
    materialized = 'dynamic_table',
    target_lag = '5 minutes',
    snowflake_warehouse = 'TRANSFORM_WH',
    refresh_mode = 'INCREMENTAL'
) }}

with dy as (
    SELECT
    n.name,
    COUNT(c.customer_id)      AS total_customers,
    SUM(c.account_balance)     AS total_account_balance
FROM {{ ref('stg_customers') }} c
JOIN {{ ref('stg_nations') }} n
    ON c.c_nation_id = n.nation_id
GROUP BY
    n.name
ORDER BY
    n.name
)
select * from dy
