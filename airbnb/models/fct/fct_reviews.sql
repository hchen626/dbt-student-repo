{{
  config(
    materialized = 'incremental',
    on_schema_change='fail',
    event_time='review_date'
    )
}}

WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
select 
  {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} as review_id,
  *

from src_reviews
{% if is_incremental() %}
  where review_date > (select max(review_date) from {{ this }})
{% endif %}
