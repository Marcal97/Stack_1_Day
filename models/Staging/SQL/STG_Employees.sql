WITH 

Source1 AS (
    SELECT *
    FROM {{source('Employee_Information','Employees_Info')}}
),

Source2 AS (
    
    SELECT * 
    FROM {{source('Employee_Information','Employees')}}
)

SELECT Source2.Employee_ID        AS ID 
     , Source1.First_Name         AS First_Name
     , Source1.Last_Name          AS Last_Name
     , Source2.Team               AS Team
     , Source2.Date1              AS Start_Date
     , Source2.Date2              AS End_Date

FROM Source2
LEFT JOIN Source1
ON Source2.Employee_ID = Source1.ID 