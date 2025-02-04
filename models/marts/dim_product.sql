with
    dim_product as (
        select *
        from {{ ref('int_product_prepared') }}
    )

select *
from dim_product