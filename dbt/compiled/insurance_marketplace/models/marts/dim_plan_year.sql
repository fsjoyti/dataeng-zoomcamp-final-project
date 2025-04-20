

with staging_plan_year as (
    select 
        distinct business_year
    from 
        `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_plan_attributes`
)

select 
    to_hex(md5(cast(coalesce(cast(staging_plan_year.business_year as string), '_dbt_utils_surrogate_key_null_') as string))) as plan_year_id,
    business_year as plan_year,
    DATE(business_year, 1, 1) as plan_year_start_date,
    DATE(business_year, 12, 31) as plan_year_end_date
from 
    staging_plan_year