{{
    config(
        materialized='table'
    )
}}

with staging_insurance_type as (
    select 'Dental' as insurance_type_name union all
    select 'Medical' as insurance_type_name
)

select 
    {{ dbt_utils.generate_surrogate_key(['staging_insurance_type.insurance_type_name']) }} as insurance_type_id,
    insurance_type_name as insurance_type
from staging_insurance_type