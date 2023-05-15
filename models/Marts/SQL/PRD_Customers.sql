{{ config( schema = 'Customers'
         , materialized = 'table'
         , transient = 'false'
) }}

WITH 

Source1 AS (
    SELECT *
    FROM {{ ref('STG_Customers') }}
)

SELECT *
FROM Source1
ORDER BY Customer_ID
