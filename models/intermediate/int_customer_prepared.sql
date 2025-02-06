 with
  
    customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

 , person as (
        select *
        from {{ ref('stg_person') }}
    )

    , customer_prepared as (
        select
            customer.PK_CUSTOMER
            ,person.FULL_NAME_PERSON
            
        from customer
        left join person on customer.fk_person = person.pk_person
    )

    select * from customer_prepared