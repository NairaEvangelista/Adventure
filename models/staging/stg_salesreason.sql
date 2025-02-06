 with
    fonte_salesreason as (
        select *
        from {{ source('erp_adventure', 'salesreason') }}
    )
    
     , motivo_venda_renomeado as (
        select 
            cast(SALESREASONID as int) as pk_salesreason
            ,cast(NAME as string) as  name_salesreason
            ,cast(REASONTYPE as string) as type_salesreason


        from fonte_salesreason
    )

    select * 
    from motivo_venda_renomeado
    