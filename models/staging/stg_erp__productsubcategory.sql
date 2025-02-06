with
    fonte_productsubcategory as (
        select *
        from {{ source('erp_adventure', 'productsubcategory') }}
    )
    
     , subcategoria_produto_renomeado as (
        select 
            cast(PRODUCTSUBCATEGORYID as int) as pk_productsubcategory
            ,cast(PRODUCTCATEGORYID as int) as fk_productcategory
            ,cast(NAME as string) as name_subcategory

        from fonte_productsubcategory
    )

    select * 
    from subcategoria_produto_renomeado