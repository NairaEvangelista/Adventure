with
    fct_sales as (
        select *
        from {{ ref('int_metrics_prepared') }}
    )

select *
from fct_sales