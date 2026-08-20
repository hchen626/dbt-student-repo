Select 
    *
FROM AIRBNB.PROD.dim_listings_cleansed listings
inner join AIRBNB.PROD.fct_reviews reviews
using (listing_id)
where listings.created_at > reviews.review_date
limit 10