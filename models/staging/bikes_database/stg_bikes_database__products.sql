SELECT
    product_id,
    brand_id,
    category_id,
    product_name,
    model_year,
    list_price
FROM {{ source('bike_raw_data', 'products') }}
