{{ config( schema = 'Intermediate_Tables'
         , materialized = 'table'
         , transient = 'false'
) }}

WITH

Date_Spine AS (
    {{  dbt_utils.date_spine(
        datepart   = "day",
        start_date = "cast('2000-01-01' as date)",
        end_date   = dbt_date.today("Europe/Brussels")
    )
    }}
),

Date_Dim AS (
    SELECT date_day          AS Date_ID
         , DAY(date_day)     AS Day
         , WEEK(date_day)    AS Week
         , MONTH(date_day)   AS Month
         , QUARTER(date_day) AS Quarter
         , YEAR(date_day)    AS Year
    FROM date_spine
)

SELECT * FROM Date_Dim
--comment