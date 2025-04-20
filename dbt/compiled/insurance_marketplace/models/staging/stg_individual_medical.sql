

with staging_individual_medical as (

    select
    *
    from `vibrant-mantis-376307`.`insurance_dataset_376307`.`individual_market_medical_data`
   

)
 select distinct
        state_code,
        fips_county_code,
        county_name,
        metal_level,
        issuer_name,
        hios_issuer_id,
        plan_id_standard_component,
        plan_marketing_name,
        plan_type,
        rating_area,
        child_only_offering as child_only_plan,
        premium_child_age_fourteen,
        premium_child_age_eighteen,
        premium_adult_individual_age_twenty_one,
        premium_adult_individual_age_twenty_seven,
        premium_adult_individual_age_thirty,
        premium_adult_individual_age_forty,
        premium_adult_individual_age_fifty,
        premium_adult_individual_age_sixty,
        premium_couple_twenty_one,
        premium_couple_thirty,
        premium_couple_forty,
        premium_couple_fifty,
        premium_couple_sixty,
        couple_one_child_age_twenty_one,
        couple_one_child_age_thirty,
        couple_one_child_age_forty,
        couple_one_child_age_fifty,
        couple_two_children_age_twenty_one,
        couple_two_children_age_thirty,
        couple_two_children_age_forty,
        couple_two_children_age_fifty,
        couple_three_or_more_children_age_twenty_one as couple_three_children_age_twenty_one,
        couple_three_or_more_children_age_thirty as couple_three_children_age_thirty,
        couple_three_or_more_children_age_forty as couple_three_children_age_forty,  
        couple_three_or_more_children_age_fifty as couple_three_children_age_fifty,
        'Individual' as market_type_name,
        'Medical' as insurance_type_name,
        extract (YEAR from formatted_date) as plan_year
from staging_individual_medical



  limit 100

