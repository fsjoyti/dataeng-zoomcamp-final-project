

with staging_insurance_type as (
    select 'Dental' as insurance_type_name union all
    select 'Medical' as insurance_type_name
)

select 
    to_hex(md5(cast(coalesce(cast(staging_insurance_type.insurance_type_name as string), '_dbt_utils_surrogate_key_null_') as string))) as insurance_type_id,
    insurance_type_name as insurance_type
from staging_insurance_type