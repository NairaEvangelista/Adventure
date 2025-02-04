with
    dim_salesperson as (
        select *
        from {{ ref('int_salesperson_prepared') }}
    )

select *
from dim_salesperson