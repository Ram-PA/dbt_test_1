with table4 as (
    select 
    ID,
    CURRENT_DATETIME as created_at,
    Ind_M1,
    Ind_M2,
    Ind_M3
    from 
    {{source('dbt_test_1','raw_table4')}}
)

select * from table4