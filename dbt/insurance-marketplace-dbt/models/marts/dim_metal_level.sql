{{
    config(
        materialized='table'
    )
}}

with staging_plan_attributes as (
    select distinct metal_level from {{ ref('stg_plan_attributes') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['staging_plan_attributes.metal_level']) }}  as metal_level_id, 
    metal_level,
    case 
        when lower(metal_level) = 'bronze' then 1
        when lower(metal_level) = 'silver' then 2
        when lower(metal_level) = 'gold' then 3
        when lower(metal_level) = 'platinum' then 4
        when lower(metal_level) = 'catastrophic' then 5
        else 0 end as metal_level_rank -- Assign rank based on metal level for ordering purposes
    
from staging_plan_attributes