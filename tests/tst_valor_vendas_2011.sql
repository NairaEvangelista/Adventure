/* Este teste garante que as vendas de 2011 é:

R$ 12.646.112,16 */

with

vendas_em_2011 as (

select sum(SOMA_TOTAL_BRUTO) as total_bruto

from {{ ref('int_metrics_prepared') }}

where CAST(ORDERDATE_SALESORDER AS DATE) between '2011-01-01' and '2011-12-31'

) -- R$ 12.646.112,16

select total_bruto

from vendas_em_2011

where total_bruto not between 12646112.10 and 12646112.20