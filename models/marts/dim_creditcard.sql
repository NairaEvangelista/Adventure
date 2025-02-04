with
    dim_creditcard as (
        select *
        from {{ ref('int_creditcard_prepared') }}
    )

select *
from dim_creditcard