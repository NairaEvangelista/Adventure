with
    
    salesorderdetail as (
        select *
        from {{ ref('stg_salesorderdetail') }}
    )

    , salesorderheader as (
        select *
        from {{ ref('stg_salesorderheader') }}
    )

    , salesorderheadersalesreason as (
        select *
        from {{ ref('stg_salesorderheadersalesreason') }}
    )

    , salesreason as (
        select *
        from {{ ref('stg_salesreason') }}
    )


     , metrics_prepared as (
        select
              MD5(CONCAT(salesorderheader.pk_salesorder , '-', salesorderdetail.pk_salesorderdetail)) AS sk_fact
            ,salesorderdetail.pk_salesorderdetail as pk_fact
            ,salesorderheader.pk_salesorder  
            ,salesorderdetail.FK_PRODUCT
            ,salesorderheader.FK_ADDRESS
            ,salesorderheader.FK_SALESPERSON
            ,salesorderheader.FK_CUSTOMER
            ,salesorderheader.FK_CREDITCARD
            ,salesorderheader.ORDERDATE_SALESORDER 
            ,salesorderheader.SHIPDATE_SALESORDER 
            ,salesorderheader.STATUS_SALESORDER
            ,salesreason.NAME_SALESREASON 
            ,salesreason.TYPE_SALESREASON 
            ,salesorderheader.IS_ONLINE_SALESORDER 
            ,salesorderdetail.QTY_SALESORDERDETAIL 
            ,salesorderdetail.UNITPRICE_SALESORDERDETAIL 
            ,salesorderdetail.DISCOUNT_SALESORDERDETAIL 
            ,salesorderheader.TAX_SALESORDER 
            ,salesorderheader.FREIGTH_SALESORDER 
            ,salesorderheader.SUBTOTAL_SALESORDER 
            ,salesorderheader.TOTAL_SALESORDER 
            ,UNITPRICE_SALESORDERDETAIL*QTY_SALESORDERDETAIL as gross_amount_negotiated
            ,(QTY_SALESORDERDETAIL*UNITPRICE_SALESORDERDETAIL)/count(sk_fact) over(partition by sk_fact) as soma_total_bruto
            ,((UNITPRICE_SALESORDERDETAIL*QTY_SALESORDERDETAIL)-(1-DISCOUNT_SALESORDERDETAIL)) as net_traded_value
            ,cast(COUNT(fk_product) over(partition by fk_product) as int)* UNITPRICE_SALESORDERDETAIL as gross_sale
            ,CAST((
                     (COUNT(fk_product) OVER (PARTITION BY fk_product)) * UNITPRICE_SALESORDERDETAIL*(1 - DISCOUNT_SALESORDERDETAIL)
                    ) / 
                    (COUNT(fk_product) OVER (PARTITION BY fk_product)) 
                        AS numeric(18,2)) AS medium_ticket
            
            
        
        from salesorderheader
        left join salesorderdetail on salesorderheader.pk_salesorder = salesorderdetail.fk_salesorder
        left join salesorderheadersalesreason on salesorderheader.pk_salesorder = salesorderheadersalesreason.fk_salesorder
        left join salesreason on salesorderheadersalesreason.fk_salesreason = salesreason.pk_salesreason
        
    )

  
    select * from metrics_prepared order by sk_fact