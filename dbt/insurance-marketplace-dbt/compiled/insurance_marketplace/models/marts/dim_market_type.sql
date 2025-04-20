

with staging_market_type as (
    select distinct market_coverage_type from `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_plan_attributes`
)

select 
    to_hex(md5(cast(coalesce(cast(staging_market_type.market_coverage_type as string), '_dbt_utils_surrogate_key_null_') as string))) as market_type_id,
    market_coverage_type as market_type_name
from staging_market_type