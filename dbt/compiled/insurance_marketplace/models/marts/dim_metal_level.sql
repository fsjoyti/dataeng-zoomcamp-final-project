

with staging_plan_attributes as (
    select distinct metal_level from `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_plan_attributes`
)

select
    to_hex(md5(cast(coalesce(cast(staging_plan_attributes.metal_level as string), '_dbt_utils_surrogate_key_null_') as string)))  as metal_level_id, 
    metal_level,
    case 
        when lower(metal_level) = 'bronze' then 1
        when lower(metal_level) = 'silver' then 2
        when lower(metal_level) = 'gold' then 3
        when lower(metal_level) = 'platinum' then 4
        when lower(metal_level) = 'catastrophic' then 5
        else 0 end as metal_level_rank -- Assign rank based on metal level for ordering purposes
    
from staging_plan_attributes