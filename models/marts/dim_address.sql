with
    dim_address as (
        select *
        from {{ ref('int_address_prepared') }}
    )

select *
from dim_address