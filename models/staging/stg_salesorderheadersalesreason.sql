 with
    fonte_salesorderheadersalesreason as (
        select *
        from {{ source('erp_adventure', 'salesorderheadersalesreason') }}
    )
    
     , cabecalho_motivo_ordemvenda_renomeado as (
        select 
            concat(SALESORDERID, '-', SALESREASONID) as pk_sales_order_reason
            ,cast(SALESORDERID as int) as fk_salesorder
            ,cast(SALESREASONID as int) fk_salereason


        from fonte_salesorderheadersalesreason
    )

    select * 
    from cabecalho_motivo_ordemvenda_renomeado
