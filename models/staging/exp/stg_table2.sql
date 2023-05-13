with table2 as (
    select * from {{source('dbt_test_2','raw_table2')}}
)

select * from table2