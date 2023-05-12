WITH 

Source1 AS (
    SELECT *
    FROM {{ ref('STG_Employees') }}
)

SELECT Source1.ID                                             AS ID
     , DATEDIFF(day, Source1.Start_Date, Source1.End_Date)    AS Days_Working
     , Source1.Start_Date                                     AS Start_Date
     , Source1.End_Date                                       AS End_Date
FROM Source1
WHERE 1=1
  AND End_Date !LIKE '9999%'
ORDER BY ID