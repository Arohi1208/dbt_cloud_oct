{{ config(alias= this.name+ var('v_id')) }}
with nation as (
select 
   n_nationkey as nation_id,
   n_name as name,
   n_regionkey as region_id,
   --n_comment as comment,
   {#{jodo('n_name','n_comment')}#}--as jodo column
   updated_at
from {{ source('srcs','nations')}}
)

select * from nation