{{
    config(
        materialized='table'
    )
}}


with staging_combined AS (
    SELECT county_name, fips_county_code, state_code FROM {{ ref('stg_individual_dental') }}
    UNION ALL
    SELECT county_name, fips_county_code, state_code FROM {{ ref('stg_individual_medical') }}
    UNION ALL
    SELECT county_name, fips_county_code, state_code FROM {{ ref('stg_shop_medical') }}
    UNION ALL
    SELECT county_name, fips_county_code, state_code FROM {{ ref('stg_shop_dental') }}
),
staging_states as (
    select state_id, state_abbreviation from {{ ref('dim_state') }}  -- Ensure dim_state is referenced to get state_id and abbreviation for join
)
SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['sc.fips_county_code']) }} AS county_id,
    ds.state_id,
    sc.county_name,
    sc.fips_county_code
FROM staging_combined sc
JOIN staging_states ds
    ON sc.state_code = ds.state_abbreviation

{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}


