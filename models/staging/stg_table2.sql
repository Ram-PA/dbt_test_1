with table2 as (
    select * from {{source('dbt_test_1','raw_table2')}}
)

select * from table2