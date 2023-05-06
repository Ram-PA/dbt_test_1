-- depends_on: {{ ref('stg_table1') }}

{{ config(
    materialized='table',
    partition_by={
      "field": "created_at",
      "data_type": "timestamp",
      "granularity": "day",
        
    }
)}}

{%- set source_relation = adapter.get_relation(
      database=source('dbt_test_1', 'raw_table1').database,
      schema=source('dbt_test_1', 'raw_table1').schema,
      identifier=source('dbt_test_1', 'raw_table1').name) -%}

{% set table_exists=source_relation is not none %}

{% if table_exists %}

({{ log("Table exists", info=True) }}
    with monthly as (
    select * from {{ref('stg_table1')}}
   ),

history as (
   select * from {{ref('cur_table4')}}
    where created_at IN (
        select MAX(created_at) 
        from {{ref('cur_table4')}}
)),

final as (
    
    select
        monthly.ID,
        CURRENT_DATETIME as created_at,
        monthly.Amount,
        monthly.Ind_Latest,
        history.Ind_M1,
        history.Ind_M2,
        history.Ind_M3
    from monthly
    join history 
    on monthly.ID = history.ID
)

select * from final)
{% else %}
{{ log("Table does not exist", info=True) }}
with final as (
select * from {{ref('cur_table4')}}    
)

select * from final
{% endif %}


