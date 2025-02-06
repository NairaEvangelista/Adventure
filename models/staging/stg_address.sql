  with
    fonte_address as (
        select *
        from {{ source('erp_adventure', 'address') }}
    )
    
     , endereco_renomeado as (
        select
            cast(ADDRESSID as int) as pk_address
            ,cast(STATEPROVINCEID as int) as fk_state
            ,cast(CITY as string) as city

        from  fonte_address
    )

    select * 
    from endereco_renomeado