WITH 

Source1 AS (
    SELECT *
    FROM {{ ref('STG_Employees') }}
),

Source2 AS (
    SELECT *
    FROM {{ ref('FCT_Dates') }}
)

SELECT Source2.Month                                          AS Month
     , Source2.Year                                           AS Year
     , COUNT(Source1.ID)                                      AS Active_Employees
FROM Source1
LEFT JOIN Source2
ON Source1.Start_Date <= Source2.Date_ID AND Source1.End_Date >= Source2.Date_ID
WHERE 1=1
  AND End_Date !LIKE '9999%'
GROUP BY Year, Month
ORDER BY Year, Month