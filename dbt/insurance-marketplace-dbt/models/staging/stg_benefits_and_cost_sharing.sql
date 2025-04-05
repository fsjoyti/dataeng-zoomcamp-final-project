{{ config(materialized='view') }}

WITH staging_benefits_and_cost_sharing AS (
    SELECT
        *
    FROM {{ source('insurance_marketplace_source', 'benefits_and_cost_sharing_puf') }}
)

select DISTINCT
    BusinessYear as business_year, -- Business year of the data
    StateCode as state_code, -- State code for the data
    IssuerId as issuer_id, -- Issuer ID for the plan,
    StandardComponentId as plan_id_standard_component, -- Standard component ID for the plan,
    PlanId as plan_id, -- Plan ID for the plan,
    BenefitName as benefit_name, -- Name of the benefit being described,
    CopayInnTier1 as copay_inn_tier_1, -- Copay for in-network tier 1 (if applicable),
    CopayInnTier2 as copay_inn_tier_2, -- Copay for in-network tier 2 (if applicable),
    CopayOutofNet as copay_out_of_net, -- Copay for out-of-network (if applicable),
    CoinsInnTier1 as coins_inn_tier_1, -- Coinsurance for in-network tier 1 (if applicable),
    CoinsInnTier2 as coins_inn_tier_2, -- Coinsurance for in-network tier 2 (if applicable),
    CoinsOutofNet as coins_out_of_net, -- Coinsurance for out-of-network (if applicable),
    IsEHB as is_ehb, -- Indicates if the benefit is an Essential Health Benefit (EHB),
    IsCovered as is_covered, -- Indicates if the benefit is covered by the plan,
    QuantLimitOnSvc as quant_limit_on_svc, -- Quantity limit on the service (if applicable),
    LimitQty as limit_qty, -- Limit quantity for the service (if applicable),
    LimitUnit as limit_unit, -- Unit of measure for the limit (if applicable),
    IsExclFromInnMOOP as is_excl_from_inn_moop, -- Indicates if the benefit is excluded from the in-network maximum out-of-pocket (MOOP),
    IsExclFromOonMOOP as is_excl_from_out_of_net_moop -- Indicates if the benefit is excluded from the out-of-network maximum out-of-pocket (MOOP)

from staging_benefits_and_cost_sharing

{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}

    