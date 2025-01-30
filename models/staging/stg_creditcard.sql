with
    fonte_creditcard as (
        select *
        from {{ source('erp_adventure', 'creditcard') }}
    )
    
     , cartao_renomeado as (
        select

            cast(CREDITCARDID as int) as pk_creditcard
            ,cast(CARDTYPE as string) as type_creditcard
            
        from  fonte_creditcard
    )

    select * 
    from cartao_renomeado