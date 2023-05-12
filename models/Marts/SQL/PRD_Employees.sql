WITH 

Source1 AS (
    SELECT *
    FROM {{ ref('STG_Employees') }}
)

SELECT *
FROM Source1
ORDER BY ID