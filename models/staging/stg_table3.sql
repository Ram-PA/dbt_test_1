with table3 as (
    select * from {{source('dbt_test_1','raw_table3')}}
)

select * from table3