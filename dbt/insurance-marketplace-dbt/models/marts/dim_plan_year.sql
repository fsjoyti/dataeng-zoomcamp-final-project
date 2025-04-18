{{
    config(
        materialized='table'
    )
}}

with staging_plan_year as (
    select 
        distinct business_year
    from 
        {{ ref('stg_plan_attributes') }}
)

select 
    {{ dbt_utils.generate_surrogate_key(['staging_plan_year.business_year']) }} as plan_year_id,
    business_year as plan_year,
    DATE(business_year, 1, 1) as plan_year_start_date,
    DATE(business_year, 12, 31) as plan_year_end_date
from 
    staging_plan_year