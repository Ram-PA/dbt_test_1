{{ config(
    materialized='table',
    
)}}

{%- set table_names = ['raw_table1', 'raw_table2', 'raw_table3', 'raw_table4'] -%}
with audit as (
    {% for table_name in table_names -%}
    select
    '{{ table_name }}' as table_name,
    (select count(*) from dbt_test_1.{{ table_name }} ) as rec_count,
    CURRENT_DATE as created_at
    {%- if not loop.last %}
    union all
    {% endif -%}
{%- endfor %}
)

select * from audit