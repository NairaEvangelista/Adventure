with
    fonte_employee as (
        select *
        from {{ source('erp_adventure', 'employee') }}
    )

    , funcionario_renomeado as (
        select 
            cast(BUSINESSENTITYID as int) as pk_employee
            ,cast(JOBTITLE as string) as jobtitle_employee
            ,cast(GENDER as char(1)) as gender_employee

        from fonte_employee
           
    )

select *
from funcionario_renomeado
