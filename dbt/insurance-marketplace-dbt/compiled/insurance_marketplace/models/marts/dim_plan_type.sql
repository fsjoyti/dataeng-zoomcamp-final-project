

with staging_plan_type as (
    select 'Individual' as plan_type_name union all
    select 'SHOP' as plan_type_name union all
)

select 
    to_hex(md5(cast(coalesce(cast(staging_plan_type.plan_type_name as string), '_dbt_utils_surrogate_key_null_') as string))) as plan_type_id,
    plan_type_name as plan_type
from staging_plan_type