with source as (
    select *
    from {{ref("stg_raw__sales")}}
    join {{ref("stg_raw__stock")}}
    using(product_id)
), renamed as (
    select * from source
)

select
    product_id,
    price,
    quantity,
    price * quantity as revenue
from renamed