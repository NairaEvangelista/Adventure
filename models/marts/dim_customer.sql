with
    dim_customer as (
        select *
        from {{ ref('int_customer_prepared') }}
    )

select *
from dim_customer