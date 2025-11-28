{{ config(alias= this.name+ var('v_id'), access = 'public') }}
with nation as (
select 
   n_nationkey::int as nation_id,
   n_name as name,
   n_regionkey::int as region_id,
   --n_comment as comment,
   {#{jodo('n_name','n_comment')}#}--as jodo column
   updated_at,
   '{{invocation_id}}' as invocation_id
from {{ source('srcs','nations')}}
)

select * from nation