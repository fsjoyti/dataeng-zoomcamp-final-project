

with staging_combined AS (
    SELECT issuer_name, hios_issuer_id FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_individual_dental`
    UNION ALL
    SELECT issuer_name, hios_issuer_id FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_individual_medical`
    UNION ALL
    SELECT issuer_name, hios_issuer_id FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_shop_medical`
    UNION ALL
    SELECT issuer_name, hios_issuer_id FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`stg_shop_dental`
)

SELECT DISTINCT
    to_hex(md5(cast(coalesce(cast(sc.hios_issuer_id as string), '_dbt_utils_surrogate_key_null_') as string))) AS issuer_id,
    sc.issuer_name,
    sc.hios_issuer_id
FROM staging_combined sc