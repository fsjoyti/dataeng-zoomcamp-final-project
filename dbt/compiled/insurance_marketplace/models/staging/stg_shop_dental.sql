

with staging_shop_dental as (

    select
    *
    from `vibrant-mantis-376307`.`insurance_dataset_376307`.`shop_market_dental_data`
   

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
        'SHOP (Small Group)' as market_type_name,
        'Dental' as insurance_type_name,
        extract (YEAR from formatted_date) as plan_year -- Extracting the year from the formatted date for clarity,
from staging_shop_dental



  limit 100

