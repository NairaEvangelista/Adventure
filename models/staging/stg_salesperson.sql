with
    fonte_salesperson as (
        select *
        from {{ source('erp_adventure', 'salesperson') }}
    )
    
     , vendedores_renomeado as (
        select 
            cast(BUSINESSENTITYID as int) pk_salesperson
        from fonte_salesperson
    )

    select * 
    from vendedores_renomeado
    