
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
    s.supplier_id,
    s.supplier_name,
    s.supplier_address,
    s.phone_number,
    s.comment as supplier_comment,
    s.account_balance,
    s.updated_time as supplier_updated_time,
    n.name as nation,
    r.name as region
from supplier s
join nation n
    on s.nation_id = n.nation_id
join region r
    on n.region_id = r.region_id