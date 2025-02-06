  with
    
    product as (
        select *
        from {{ ref('stg_erp__product') }}
    )

    , productcategory as (
        select *
        from {{ ref('stg_erp__productcategory') }}
    )

     ,productsubcategory as (
        select *
        from {{ ref('stg_erp__productsubcategory') }}
    )

    , product_prepared as (
        select
            product.PK_PRODUCT
            ,product.NAME_PRODUCT
            ,product.WEIGHT_PRODUCT
            ,coalesce(productcategory.NAME_PRODUCTCATEGORY, 'raw material/maintenance material') as NAME_PRODUCTCATEGORY
            ,coalesce(productsubcategory.NAME_SUBCATEGORY, 'raw material/maintenance material') as NAME_SUBCATEGORY
        from  product
        left join productsubcategory on product.fk_subcategory = productsubcategory.PK_PRODUCTSUBCATEGORY 
        left join productcategory on productsubcategory.FK_PRODUCTCATEGORY  = productcategory.PK_PRODUCTCATEGORY
            
       
    )

    select * from product_prepared