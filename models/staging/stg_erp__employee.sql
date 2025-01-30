with
    fonte_employee as (
        select *
        from {{ source('erp_adventure', 'employee') }}
    )

    , funcionario_renomeado as (
        select
        cast (BUSINESSENTITYID as int) as pk_funcionario
        , cast (NATIONALIDNUMBER as varchar) as nacionalidade_funcionario
        , cast (JOBTITLE as varchar) as cargo_funcionario
        , cast (GENDER as varchar) as genero_funcionario
        , cast (HIREDATE as varchar) as admissao_funcionario
        , cast (MODIFIEDDATE as varchar) as modificacao_data_funcionario
        ---, cast (ORGANIZATIONNODE as varchar) as
        --, cast (BIRTHDATE as varchar) as
        --, cast (MARITALSTATUS as varchar) as
        --, cast (VACATIONHOURS as varchar) as
        --, cast (SICKLEAVEHOURS as varchar) as
        --, cast (LOGINID as varchar) as
        --, cast (CURRENTFLAG as varchar) as
        --, cast (ROWGUID as varchar) as
        --, cast (SALARIEDFLAG as varchar) as
           

        from fonte_employee
    )

select *
from funcionario_renomeado
