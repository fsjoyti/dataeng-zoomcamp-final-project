{{
    config(
        materialized='table'
    )
}}

with staging_market_type as (
    select distinct market_coverage_type from {{ ref('stg_plan_attributes') }}
)

select 
    {{ dbt_utils.generate_surrogate_key(['staging_market_type.market_coverage_type']) }} as market_type_id,
    market_coverage_type as market_type_name
from staging_market_type