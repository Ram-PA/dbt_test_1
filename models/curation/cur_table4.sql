{{ config(
    materialized='incremental',
    partition_by={
      "field": "created_at",
      "data_type": "timestamp",
      "granularity": "day",
      
      
    }
)}}

with table4 as (
    select * from {{ref('stg_table4')}}
)

select * from table4