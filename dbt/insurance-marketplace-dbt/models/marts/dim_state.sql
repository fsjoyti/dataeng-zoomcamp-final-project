{{
    config(
        materialized='table'
    )
}}

with stg_states as (
    select * from {{ ref('states') }}
)

select {{ dbt_utils.generate_surrogate_key(['stg_states.State']) }} as state_id,
State as state_name,
Abbreviation as state_abbreviation
from stg_states

