{{ config(
  post_hook = "ALTER TABLE {{ this }} ADD ROW ACCESS POLICY Analytics_DB.Policies.EEmployee_policy ON (Team);
            
               GRANT USAGE ON SCHEMA Analytics_DB.Production TO ROLE Team_Manager_1;
               GRANT SELECT ON TABLE Analytics_DB.Production.PRD_Employees TO ROLE Team_Manager_1;
               GRANT USAGE ON SCHEMA Analytics_DB.Production TO ROLE Team_Manager_2;
               GRANT SELECT ON TABLE Analytics_DB.Production.PRD_Employees TO ROLE Team_Manager_2;"
) }}

WITH 

Source1 AS (
    SELECT *
    FROM {{ ref('STG_Employees') }}
)

SELECT *
FROM Source1
ORDER BY ID