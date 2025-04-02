  SELECT
    CAST(BusinessYear AS INT64) AS BusinessYear,
    CAST(StateCode AS STRING) AS StateCode,
    CAST(IssuerId AS INT64) AS IssuerId,
    CAST(SourceName AS STRING) AS SourceName,
    CAST(ImportDate AS TIMESTAMP) AS ImportDate,
    CAST(ServiceAreaId AS STRING) AS ServiceAreaId,
    CAST(ServiceAreaName AS STRING) AS ServiceAreaName,
    CAST(CoverEntireState AS BOOL) AS CoverEntireState,
    CAST(County AS INT64) AS County,
    CAST(PartialCounty AS BOOL) AS PartialCounty,
    CAST(ZipCodes AS STRING) AS ZipCodes,
    CAST(PartialCountyJustification AS STRING) AS PartialCountyJustification,
    CAST(MarketCoverage AS STRING) AS MarketCoverage,
    CAST(DentalOnlyPlan AS BOOL) AS DentalOnlyPlan
  FROM your_table_name;