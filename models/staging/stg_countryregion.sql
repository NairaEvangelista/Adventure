with
    fonte_countryregion as (
        select *
        from {{ source('erp_adventure', 'countryregion') }}
    )
    
     , pais_renomeado as (
        select
            cast (COUNTRYREGIONCODE as string) as pk_country
            ,cast (NAME as string) as name_country
            
        from  fonte_countryregion
    )

    select * 
    from pais_renomeado