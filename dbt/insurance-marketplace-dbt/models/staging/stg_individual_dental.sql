{{ config(materialized='view') }}

with staging_individual_dental as (

    select
    *
    from {{ source('insurance_marketplace_source', 'individual_market_dental_data') }}
   

)
 select
        state_code,
        fips_county_code,
        county_name,
        metal_level,
        issuer_name,
        hios_issuer_id,
        plan_id_standard_component,
        plan_marketing_name,
        plan_type,
        rating_area
from staging_individual_dental

{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
