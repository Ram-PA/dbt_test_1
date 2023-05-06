with table1 as (
    select * from {{source('dbt_test_1','raw_table1')}}
)

select * from table1