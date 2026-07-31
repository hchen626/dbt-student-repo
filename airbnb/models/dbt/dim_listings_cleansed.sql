with src_listing as (
    select * from {{ ref('src_listings') }}
)

select *