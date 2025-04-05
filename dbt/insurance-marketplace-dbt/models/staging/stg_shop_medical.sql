{{ config(materialized='view') }}

with staging_shop_medical as (

    select
    *
    from {{ source('insurance_marketplace_source', 'shop_market_medical_data') }}
   

)
 select distinct
        state_code,
        fips_county_code,
        county_name,
        metal_level,
        issuer_name,
        hios_issuer_id,
        plan_id_standard_component,
        plan_marketing_name,
        plan_type,
        rating_area,
        child_only_offering as child_only_plan,
        'shop' as market_coverage_type, -- Static value for plan category as 'individual'
        extract (YEAR from formatted_date) as plan_year, -- Extracting the year from the formatted date for clarity,
        false as dental_only_plan -- Static value indicating this is a dental-only plan
from staging_shop_medical

{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
