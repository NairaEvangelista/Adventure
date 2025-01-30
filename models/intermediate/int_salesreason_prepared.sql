with
  
    salesreason as (
        select *
        from {{ ref('stg_salesreason') }}
    )

     , salesreason_prepared as (
        select
            salesreason.PK_SALESREASON
            ,salesreason.NAME_SALESREASON
            ,salesreason.TYPE_SALESREASON

        
        from salesreason
        
    )

    select * from salesreason_prepared