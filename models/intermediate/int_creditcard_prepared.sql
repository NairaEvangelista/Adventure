with
    creditcard as (
        select *
        from {{ ref('stg_creditcard') }}
    )

      , creditcard_prepared as (
        select
            creditcard.PK_CREDITCARD
            ,creditcard.TYPE_CREDITCARD

        from creditcard
    )

    select * from creditcard_prepared