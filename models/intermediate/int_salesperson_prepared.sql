    with
 
    salesperson as (
        select *
        from {{ ref('stg_salesperson') }}
    )

    , person as (
        select *
        from {{ ref('stg_person') }}
    )

     ,employee as (
        select *
        from {{ ref('stg_erp__employee') }}
    )

     , salesperson_prepared as (
        select
            salesperson.PK_SALESPERSON
            ,person.FULL_NAME_PERSON
            ,employee.JOBTITLE_EMPLOYEE
            ,employee.GENDER_EMPLOYEE
        
        from salesperson
        left join employee on salesperson.pk_salesperson = employee.pk_employee
        left join person on salesperson.pk_salesperson = person.pk_person
        
    )

    select * from salesperson_prepared