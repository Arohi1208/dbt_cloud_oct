{{config(tags='sample',
{#pre_hook= ("use warehouse test_wh"), post_hook = "select * from ANALYTICS.DBT_AMISHRA.stg_regions")#}
}}
with abcd as (
select 
   c_custkey as customer_id,
   c_nationkey as c_nation_id,
   c_name as name,
   c_address as address,
   c_phone as phone_number,
   c_acctbal as account_balance,
   c_mktsegment as market_segment,
   c_comment as comment
   
from {{ source('src','customers')}}
) 

select * from abcd