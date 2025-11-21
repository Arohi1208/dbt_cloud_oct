{{ config(tags='sample') }}

with supplier as (
    select *
    from {{ ref('stg_supplier') }}
),

nation as (
    select *
    from {{ ref('stg_nations') }}
),

region as (
    select *
    from {{ ref('stg_regions') }}
)

select 
    s.*,
    n.name,
    n.updated_at,
    r.region_id,
    r.name,
    r.comment
from supplier s
join nation n
    on s.nation_id = n.nation_id
join region r
    on n.region_id = r.region_id