with
    fonte_salesterritory as (
        select *
        from {{ source('erp_adventure', 'salesterritory') }}
    )
    
     , territorio_vendas_renomeado as (
        select 
            cast(TERRITORYID as int) as pk_territory
            ,cast(COUNTRYREGIONCODE as string) fk_country
            ,cast(NAME as string) as name_territory

        from fonte_salesterritory
    )

    select * 
    from territorio_vendas_renomeado