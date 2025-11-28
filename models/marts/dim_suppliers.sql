--supplier_id,supplier_name,sccount_balance,phone_number,supplier_addresss,nation_name,region_name,updated_time,dbt_batch_is,dbt_batch_ts

{{ config (refresh_mode = 'INCREMENTAL')}}

with dim as (
    select
    supplier_id,
    supplier_name,
    account_balance,
    phone_number,
    supplier_address,
    nation as nation_name,
    region as region_name,
    supplier_updated_time as updated_time
from {{ref('int_suppliers') }} 
)

{% if is_incremental()%}
where updated_time < (select max(updated_time) from {{this}})
{% endif %}

select *,{{dbt_meta()}} from dim