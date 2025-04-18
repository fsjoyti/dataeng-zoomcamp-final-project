{{
    config(
        materialized='table'
    )
}}

with staging_individual_dental AS (
    SELECT state_code,
    fips_county_code,
    hios_issuer_id,
    plan_id_standard_component,
    plan_marketing_name, 
    metal_level,
    child_only_plan, 
    premium_child_age_fourteen,
    premium_child_age_eighteen,
    premium_adult_individual_age_twenty_one,
    premium_adult_individual_age_twenty_seven,
    premium_adult_individual_age_thirty,
    premium_adult_individual_age_forty,
    premium_adult_individual_age_fifty,
    premium_adult_individual_age_sixty,
    premium_couple_twenty_one,
    premium_couple_thirty,
    premium_couple_forty,
    premium_couple_fifty,
    premium_couple_sixty,
    couple_one_child_age_twenty_one,
    couple_one_child_age_thirty,
    couple_one_child_age_forty,
    couple_one_child_age_fifty,
    couple_two_children_age_twenty_one,
    couple_two_children_age_thirty,
    couple_two_children_age_forty,
    couple_two_children_age_fifty,
    market_type_name,
    insurance_type_name,
    plan_year FROM {{ ref('stg_individual_dental') }}
),
staging_individual_medical AS (
    SELECT state_code,
    fips_county_code,
    hios_issuer_id,
    plan_id_standard_component,
    plan_marketing_name,
    metal_level,
    child_only_plan, 
    premium_child_age_fourteen,
    premium_child_age_eighteen,
    premium_adult_individual_age_twenty_one,
    premium_adult_individual_age_twenty_seven,
    premium_adult_individual_age_thirty,
    premium_adult_individual_age_forty,
    premium_adult_individual_age_fifty,
    premium_adult_individual_age_sixty,
    premium_couple_twenty_one,
    premium_couple_thirty,
    premium_couple_forty,
    premium_couple_fifty,
    premium_couple_sixty,
    couple_one_child_age_twenty_one,
    couple_one_child_age_thirty,
    couple_one_child_age_forty,
    couple_one_child_age_fifty,
    couple_two_children_age_twenty_one,
    couple_two_children_age_thirty,
    couple_two_children_age_forty,
    couple_two_children_age_fifty,
    market_type_name,
    insurance_type_name,
    plan_year  FROM {{ ref('stg_individual_medical') }}
), 
staging_shop_medical AS (
    SELECT state_code,
    fips_county_code,
    hios_issuer_id,
    plan_id_standard_component,
    plan_marketing_name,
    metal_level,
    child_only_plan, 
    premium_child_age_fourteen,
    premium_child_age_eighteen,
    premium_adult_individual_age_twenty_one,
    premium_adult_individual_age_twenty_seven,
    premium_adult_individual_age_thirty,
    premium_adult_individual_age_forty,
    premium_adult_individual_age_fifty,
    premium_adult_individual_age_sixty,
    premium_couple_twenty_one,
    premium_couple_thirty,
    premium_couple_forty,
    premium_couple_fifty,
    premium_couple_sixty,
    couple_one_child_age_twenty_one,
    couple_one_child_age_thirty,
    couple_one_child_age_forty,
    couple_one_child_age_fifty,
    couple_two_children_age_twenty_one,
    couple_two_children_age_thirty,
    couple_two_children_age_forty,
    couple_two_children_age_fifty,
    market_type_name,
    insurance_type_name,
    plan_year FROM {{ ref('stg_shop_medical') }}
),
staging_shop_dental AS (
    SELECT state_code,
    fips_county_code,
    hios_issuer_id,
    plan_id_standard_component,
    plan_marketing_name, 
    metal_level,
    child_only_plan, 
    premium_child_age_fourteen,
    premium_child_age_eighteen,
    premium_adult_individual_age_twenty_one,
    premium_adult_individual_age_twenty_seven,
    premium_adult_individual_age_thirty,
    premium_adult_individual_age_forty,
    premium_adult_individual_age_fifty,
    premium_adult_individual_age_sixty,
    premium_couple_twenty_one,
    premium_couple_thirty,
    premium_couple_forty,
    premium_couple_fifty,
    premium_couple_sixty,
    couple_one_child_age_twenty_one,
    couple_one_child_age_thirty,
    couple_one_child_age_forty,
    couple_one_child_age_fifty,
    couple_two_children_age_twenty_one,
    couple_two_children_age_thirty,
    couple_two_children_age_forty,
    couple_two_children_age_fifty,
    market_type_name,
    insurance_type_name,
    plan_year FROM {{ ref('stg_shop_dental') }}
),
staging_states AS (
    SELECT state_id, state_abbreviation   FROM {{ ref('dim_state') }}
),
staging_counties AS (
    SELECT county_id, state_id, fips_county_code FROM {{ ref('dim_county') }}
),
staging_metal_levels AS (
    SELECT metal_level_id, metal_level as metal_level_name FROM {{ ref('dim_metal_level') }}
),
staging_issuer as (
    SELECT issuer_id, hios_issuer_id FROM {{ ref('dim_issuer') }}
),
staging_plan_year AS (
    SELECT plan_year_id, plan_year FROM {{ ref('dim_plan_year') }}
),
staging_market_types AS (
    SELECT market_type_id, market_type_name FROM {{ ref('dim_market_type') }}
),
staging_insurance_types AS (
    SELECT insurance_type_id, insurance_type FROM {{ ref('dim_insurance_type') }}
),
staging_combined AS (
    SELECT * FROM staging_individual_dental
    UNION ALL
    SELECT * FROM staging_individual_medical
    UNION ALL
    SELECT *FROM staging_shop_medical
    UNION ALL
    SELECT * FROM staging_shop_dental
)

select 
    {{ dbt_utils.generate_surrogate_key(['staging_combined.plan_id_standard_component', 'staging_combined.plan_marketing_name']) }} as plan_id, -- Surrogate key
    staging_states.state_id,
    staging_counties.county_id,
    staging_metal_levels.metal_level_id,
    staging_issuer.issuer_id,
    staging_plan_year.plan_year_id,
    staging_market_types.market_type_id,
    staging_insurance_types.insurance_type_id,
    staging_combined.plan_id_standard_component,
    staging_combined.plan_marketing_name,
    staging_combined.child_only_plan,
    staging_combined.premium_child_age_fourteen,
    staging_combined.premium_child_age_eighteen,
    staging_combined.premium_adult_individual_age_twenty_one,
    staging_combined.premium_adult_individual_age_twenty_seven,
    staging_combined.premium_adult_individual_age_thirty,
    staging_combined.premium_adult_individual_age_forty,
    staging_combined.premium_adult_individual_age_fifty,
    staging_combined.premium_adult_individual_age_sixty,
    staging_combined.premium_couple_twenty_one,
    staging_combined.premium_couple_thirty,
    staging_combined.premium_couple_forty,
    staging_combined.premium_couple_fifty,
    staging_combined.premium_couple_sixty,
    staging_combined.couple_one_child_age_twenty_one,
    staging_combined.couple_one_child_age_thirty,
    staging_combined.couple_one_child_age_forty,
    staging_combined.couple_one_child_age_fifty,
    staging_combined.couple_two_children_age_twenty_one,
    staging_combined.couple_two_children_age_thirty,
    staging_combined.couple_two_children_age_forty,
    staging_combined.couple_two_children_age_fifty
from 
    staging_combined
inner join 
    staging_states on staging_combined.state_code = staging_states.state_abbreviation
inner join 
    staging_counties on staging_combined.fips_county_code = staging_counties.fips_county_code
inner join
    staging_metal_levels on staging_combined.metal_level = staging_metal_levels.metal_level_name
inner join
    staging_plan_year on staging_combined.plan_year = staging_plan_year.plan_year
inner join
    staging_market_types on staging_combined.market_type_name = staging_market_types.market_type_name
inner join
    staging_insurance_types on staging_combined.insurance_type_name = staging_insurance_types.insurance_type
inner join
    staging_issuer on staging_combined.hios_issuer_id = staging_issuer.hios_issuer_id
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
