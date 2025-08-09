{{ config(materialized='table',
          database='dev_data_lake',
          schema='raw_stage_cricket'
          ) }}

with source_data as (

    select 1 as id, 'A1' as val
    union all
    select 2 as id, 'A2' as val
    union all
    select 3 as id, 'A3' as val
    union all
    select -1 as id, null as val

)

select *
from source_data