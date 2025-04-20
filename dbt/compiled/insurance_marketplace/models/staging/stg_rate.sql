

WITH staging_rate AS (
    SELECT
        *
    FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`rate_puf`
)

select DISTINCT
    BusinessYear as business_year, -- Business year of the data
    StateCode as state_code, -- State code for the data
    IssuerId as issuer_id, -- Issuer ID for the plan,
    RateEffectiveDate as rate_effective_date, -- Effective date of the rate,
    RateExpirationDate as rate_expiration_date, -- Expiration date of the rate (if applicable),
    PlanId as plan_id, -- Plan ID for the plan,
    RatingAreaId as rating_area_id, -- Rating area ID for the plan,
    Tobacco as tobacco, -- Indicates if the rate is for tobacco users (if applicable),
    Age as age, -- Age of the individual for whom the rate applies (if applicable),
    IndividualRate as individual_rate, -- Rate for an individual (if applicable),
    IndividualTobaccoRate as individual_tobacco_rate,
    Couple as couple,-- Rate for an individual who uses tobacco (if applicable),
    PrimarySubscriberAndOneDependent as primary_subscriber_and_one_dependent, -- Rate for a primary subscriber and one dependent (if applicable),
    PrimarySubscriberAndTwoDependents as primary_subscriber_and_two_dependents,
    PrimarySubscriberAndThreeOrMoreDependents as primary_subscriber_and_three_or_more_dependents, -- Rate for a primary subscriber and three or more dependents (if applicable),
    CoupleAndOneDependent, -- Rate for a primary subscriber and two dependents (if applicable),
    CoupleAndTwoDependents as couple_and_two_dependents,
    CoupleAndThreeOrMoreDependents as couple_and_three_or_more_dependents -- Rate for a primary subscriber and three or more dependents (if applicable),
    from staging_rate
    
    
    
        limit 100
    
    