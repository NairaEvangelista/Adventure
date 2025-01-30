with
    fonte_productcategory as (
        select *
        from {{ source('erp_adventure', 'productcategory') }}
    )
    
     , categoria_produto_renomeado as (
        select 
             cast(PRODUCTCATEGORYID as int) as pk_productcategory
            ,cast(NAME as string) as name_productcategory   
        from fonte_productcategory
    )

    select * 
    from categoria_produto_renomeado