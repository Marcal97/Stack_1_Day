WITH 

Source1 AS (
    SELECT *
    FROM {{source('Customer_Information','Customer')}}
),

Source2 AS (
    
    SELECT * 
    FROM {{source('Nation_Information','Nation')}}
),

Source3 AS (
    
    SELECT * 
    FROM {{source('Nation_Information','Region')}}
)

SELECT Source1.C_Custkey          AS Customer_ID 
     , Source1.C_Name             AS Customer_Name
     , Source1.C_MKTSegment       AS Market_Segment
     , Source1.C_Phone            AS Phone_Number
     , Source1.C_AcctBal          AS Account_Balance
     , Source2.N_Name             AS Nation
     , Source3.R_Name             AS Region

FROM Source1
LEFT JOIN Source2
ON Source1.C_Nationkey = Source2.N_Nationkey
LEFT JOIN Source3
ON Source2.N_Regionkey = Source3.R_Regionkey