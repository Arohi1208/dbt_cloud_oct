with customer as (
    select *
    from {{ ref('stg_customers') }}
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
    c.*,
    n.name as name1,
    n.updated_at,
    r.region_id,
    r.name as name2,
    r.comment as comm
from customer c
join nation n
    on c.c_nation_id = n.nation_id
join region r
    on n.region_id = r.region_id