{{config(tags='sample')}}
with abcd as (
select 
   c_custkey as customer_id,
   c_nationkey as c_nation_id,
   c_name as name,
   c_address as address,
   c_phone as phone_number,
   c_acctbal as account_balance,
   c_mktsegment as market_segment,
   c_comment as comment,
   {{dbt_meta()}}
   
from {{ source('src','customers')}}
) 

select * from abcd