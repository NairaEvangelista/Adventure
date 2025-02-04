with
    dim_salesreason as (
        select *
        from {{ ref('int_salesreason_prepared') }}
    )

select *
from dim_salesreason