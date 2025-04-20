

WITH staging_plan_attributes AS (
    SELECT
        *
    FROM `vibrant-mantis-376307`.`insurance_dataset_376307`.`plan_attributes_puf`
)

SELECT DISTINCT

    BusinessYear as business_year,
    StateCode as state_code,
    IssuerId as issuer_id,
    IssuerMarketPlaceMarketingName as issuer_marketplace_marketing_name, -- Marketing name of the issuer in the marketplace 
    MarketCoverage as market_coverage_type, -- Market coverage type (e.g., individual, small group)
    DentalOnlyPlan as dental_only_plan, -- Indicates if the plan is a dental-only plan (true/false)
    StandardComponentId as standard_component_id, -- Standard component ID for the plan, this can be used to join with other datasets for plan details
    PlanMarketingName as plan_marketing_name, -- Marketing name of the plan
    HIOSProductId as hios_product_id, -- HIOS product ID for the plan, this can be used to uniquely identify the plan in the marketplace
    NetworkId as network_id, -- Network ID for the plan, this can be used to identify the network associated with the plan (if applicable)
    ServiceAreaId as service_area_id, -- Service area ID for the plan, this can be used to join with the service area dataset for location-specific information
    FormularyId as formulary_id, -- Formulary ID for the plan, this can be used to identify the formulary associated with the plan (if applicable)
    IsNewPlan as is_new_plan, -- Indicates if the plan is new for the business year (true/false)
    PlanType as plan_type, -- Type of the plan (e.g., HMO, PPO, EPO, etc.), this can be used to categorize the plans based on their type
    MetalLevel as metal_level, -- Metal level of the plan (e.g., Bronze, Silver, Gold, Platinum), this can be used to categorize the plans based on their actuarial value
    QHPNonQHPTypeId as qhp_non_qhp_type_id, -- Qualified Health Plan (QHP) or Non-Qualified Health Plan (Non-QHP) type ID, this can be used to identify the plan's qualification status
    IsNoticeRequiredForPregnancy as is_notice_required_for_pregnancy, -- Indicates if a notice is required for pregnancy (true/false), this can be used to identify plans with specific requirements related to pregnancy
    IsReferralRequiredForSpecialist as is_referral_required_for_specialist, -- Indicates if a referral is required for specialist care (true/false), this can be used to identify plans with referral requirements
    SpecialistRequiringReferral as specialist_requiring_referral, -- Indicates the type of specialist requiring a referral (if applicable), this can be used to identify plans with specific referral requirements
    PlanLevelExclusions as plan_level_exclusions, -- Plan level exclusions (if applicable), this can be used to identify any exclusions at the plan level
    IndianPlanVariationEstimatedAdvancedPaymentAmountPerEnrollee as indian_plan_variation_estimated_advanced_payment_amount_per_enrollee, -- Estimated advanced payment amount per enrollee for Indian plans (if applicable), this can be used to identify plans with specific payment arrangements for Indian enrollees
    CompositeRatingOffered as composite_rating_offered, -- Indicates if composite rating is offered for the plan (true/false), this can be used to identify plans that offer composite rating options,
    ChildOnlyOffering as child_only_offering, -- Indicates if the plan is a child-only offering (true/false), this can be used to identify plans specifically designed for child-only coverage,
    ChildOnlyPlanId as child_only_plan_id, -- Child-only plan ID (if applicable), this can be used to identify child-only plans in the marketplace
    WellnessProgramOffered as wellness_program_offered, -- Indicates if a wellness program is offered for the plan (true/false), this can be used to identify plans that include wellness programs
    DiseaseManagementProgramsOffered as disease_management_programs_offered, -- Indicates if disease management programs are offered for the plan (true/false), this can be used to identify plans with disease management offerings
    EHBPercentTotalPremium as ehb_percent_total_premium, -- The percentage of the total premium that is attributable to essential health benefits (EHB), this can be used to assess the EHB coverage of the plan
    EHBPediatricDentalApportionmentQuantity as ehb_pediatric_dental_apportionment_quantity, -- The quantity of pediatric dental services apportioned to EHB (if applicable), this can be used to assess the pediatric dental coverage of the plan
    IsGuaranteedRate as is_guaranteed_rate, -- Indicates if the plan has a guaranteed rate (true/false), this can be used to identify plans with guaranteed rates for premiums
    PlanEffectiveDate as plan_effective_date, -- Effective date of the plan, this can be used to identify when the plan becomes effective in the marketplace
    PlanExpirationDate as plan_expiration_date, -- Expiration date of the plan (if applicable), this can be used to identify when the plan expires in the marketplace
    NationalNetwork as national_network, -- Indicates if the plan has a national network (true/false), this can be used to identify plans that offer nationwide coverage
    PlanId as plan_id, -- Plan ID for the plan, this can be used to uniquely identify the plan in the marketplace and can be used for joins with other datasets
    PlanVariantMarketingName as plan_variant_marketing_name, -- Marketing name of the plan variant (if applicable), this can be used to identify different variants of the same plan in the marketplace
    CSRVariationType as csr_variation_type, -- Cost-Sharing Reduction (CSR) variation type (if applicable), this can be used to identify the CSR variations associated with the plan
    MultipleInNetworkTiers as multiple_in_network_tiers, -- Indicates if the plan has multiple in-network tiers (true/false), this can be used to identify plans with tiered networks
    BeginPrimaryCareCostSharingAfterNumberOfVisits as begin_primary_care_cost_sharing_after_number_of_visits, -- Indicates the number of visits after which primary care cost sharing begins (if applicable), this can be used to identify plans with specific cost-sharing arrangements for primary care
    BeginPrimaryCareDeductibleCoinsuranceAfterNumberOfCopays as begin_primary_care_deductible_coinsurance_after_number_of_copays, -- Indicates the number of copays after which primary care deductible coinsurance begins (if applicable), this can be used to identify plans with specific arrangements for primary care deductibles
    IsHSAEligible as is_hsa_eligible -- Indicates if the plan is eligible for Health Savings Account (HSA) contributions (true/false), this can be used to identify plans that can be paired with HSAs
    from staging_plan_attributes