with
     address as (
        select *
        from {{ ref('stg_address') }}
    )

    , stateprovince as (
        select *
        from {{ ref('stg_stateprovince') }}
    )

     ,countryregion as (
        select *
        from {{ ref('stg_countryregion') }}
    )

    , address_prepared as (
        select
            address.PK_ADDRESS
            ,address.CITY
            ,stateprovince.NAME_STATE
            ,countryregion.NAME_COUNTRY

        from address  
        left join stateprovince on address.fk_state = stateprovince.pk_state
        left join countryregion on stateprovince.fk_country = countryregion.pk_country
        
    )

    select * from address_prepared