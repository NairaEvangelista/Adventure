with
    fonte_person as (
        select *
        from {{ source('erp_adventure', 'person') }}
    )
    
     , vendedor_renomeado as (
        select
            cast(BUSINESSENTITYID as int) as pk_person
            , cast(FIRSTNAME as string) as first_name_person 
            , cast(LASTNAME as string) as last_name_person
            , concat(
                FIRSTNAME, ' ',
                coalesce(MIDDLENAME, ''), ' ',
                LASTNAME
            ) AS full_name_person
        from  fonte_person
    )

    select * 
    from vendedor_renomeado