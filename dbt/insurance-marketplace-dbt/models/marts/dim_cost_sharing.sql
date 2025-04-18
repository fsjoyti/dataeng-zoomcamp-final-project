{{
    config(
        materialized='table'
    )
}}


WITH staging_cost_sharing_types AS (
    SELECT 
        'Coinsurance' AS cost_sharing_type, 
        'Percentage of costs shared by insured' AS cost_sharing_description
    UNION ALL
    SELECT 
        'Copayment' AS cost_sharing_type, 
        'Fixed dollar amount paid for a service' AS cost_sharing_description
    UNION ALL
    SELECT 
        'Deductible' AS cost_sharing_type, 
        'Amount paid before insurance coverage starts' AS cost_sharing_description
    UNION ALL
    SELECT 
        'Out-of-Pocket Maximum' AS cost_sharing_type, 
        'Maximum out-of-pocket expense limit' AS cost_sharing_description
    UNION ALL
    SELECT 
        'HSA/HRA' AS cost_sharing_type, 
        'Health Savings Account or Health Reimbursement Arrangement' AS cost_sharing_description
    UNION ALL
    SELECT 
        'Other' AS cost_sharing_type, 
        'Other cost-sharing mechanisms' AS cost_sharing_description
)

SELECT 
  {{ dbt_utils.generate_surrogate_key(['staging_cost_sharing_types.cost_sharing_type']) }} AS county_id,
  cost_sharing_type,
  cost_sharing_description
FROM staging_cost_sharing_types