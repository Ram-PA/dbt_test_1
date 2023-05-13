with table3 as (
    select * from {{source('dbt_test_2','raw_table3')}}
)

select * from table3