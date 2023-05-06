{{ config(
    materialized='incremental',
    partition_by={
      "field": "created_at",
      "data_type": "timestamp",
      "granularity": "day",
        
    }
)}}

with monthly as (
    select * from {{ref('stg_table1')}}
   ),

history as (
   select * from {{ref('cur_table4')}}
    where created_at IN (
        select MAX(created_at) 
        from {{ref('cur_table4')}}
),


final as (
    
    select
      
        monthly.ID,
        monthly.Amount,
        monthly.Ind_Latest,
        history.Ind_M1,
        history.Ind_M2,
        history.Ind_M3
    from monthly
    join history 
    on monthly.ID = history.ID

)
select * from final
