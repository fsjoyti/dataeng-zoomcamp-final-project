

with stg_states as (
    select * from `vibrant-mantis-376307`.`insurance_dataset_376307`.`states`
)

select to_hex(md5(cast(coalesce(cast(stg_states.State as string), '_dbt_utils_surrogate_key_null_') as string))) as state_id,
State as state_name,
Abbreviation as state_abbreviation
from stg_states