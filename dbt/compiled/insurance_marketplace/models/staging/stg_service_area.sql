

with staging_service_area as (
    select
        *
    from `vibrant-mantis-376307`.`insurance_dataset_376307`.`service_area_puf`
)

select distinct
    BusinessYear as business_year, -- Business year of the data
    StateCode as state_code, -- State code for the data
    IssuerId as issuer_id, -- Issuer ID for the plan,
    ServiceAreaId as service_area_id, -- Service area ID for the plan,
    ServiceAreaName as service_area_name, -- Name of the service area (if applicable),
    CoverEntireState as cover_entire_state, -- Indicates if the service area covers the entire state (true/false),
    County as fips_county_code, -- FIPS county code (if applicable), this can be used to join with other datasets for county-specific information
    PartialCounty as partial_county,
    ZipCodes as zip_codes, -- Zip codes included in the service area (if applicable), this can be used for more granular location information
    MarketCoverage as market_coverage_type,
    DentalOnlyPlan as dental_only_plan -- Indicates if the service area is for dental-only plans (true/false)

from staging_service_area



    limit 100

