{{
    config(
        materialized='table'
    )
}}

with staging_combined AS (
    SELECT issuer_name, hios_issuer_id FROM {{ ref('stg_individual_dental') }}
    UNION ALL
    SELECT issuer_name, hios_issuer_id FROM {{ ref('stg_individual_medical') }}
    UNION ALL
    SELECT issuer_name, hios_issuer_id FROM {{ ref('stg_shop_medical') }}
    UNION ALL
    SELECT issuer_name, hios_issuer_id FROM {{ ref('stg_shop_dental') }}
)

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['sc.issuer_name', 'sc.hios_issuer_id']) }} AS issuer_id,
    sc.issuer_name,
    sc.hios_issuer_id
FROM staging_combined sc