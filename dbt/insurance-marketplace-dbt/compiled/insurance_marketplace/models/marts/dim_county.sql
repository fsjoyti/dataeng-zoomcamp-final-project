


with staging_combined AS (
    SELECT county_name, fips_county_code, state_code FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_individual_dental`
    UNION ALL
    SELECT county_name, fips_county_code, state_code FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_individual_medical`
    UNION ALL
    SELECT county_name, fips_county_code, state_code FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_shop_medical`
    UNION ALL
    SELECT county_name, fips_county_code, state_code FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_shop_dental`
),
staging_states as (
    select state_id, state_abbreviation from `vibrant-mantis-376307`.`insurance_dataset_376307`.`dim_state`  -- Ensure dim_state is referenced to get state_id and abbreviation for join
)
SELECT DISTINCT
    to_hex(md5(cast(coalesce(cast(sc.fips_county_code as string), '_dbt_utils_surrogate_key_null_') as string))) AS county_id,
    ds.state_id,
    sc.county_name,
    sc.fips_county_code
FROM staging_combined sc
JOIN staging_states ds
    ON sc.state_code = ds.state_abbreviation



  limit 100

