{% snapshot customers %}
{% set new_schema = target.schema + '_snapshot' %}
{{
    config(
        target_database = target.database,
        target_schema = new_schema,
        unique_key = 'Customer_ID',
        strategy = 'check',
        check_cols = 'all',
    )
}}
SELECT * FROM {{ ref('PRD_Customers') }}
{% endsnapshot %}