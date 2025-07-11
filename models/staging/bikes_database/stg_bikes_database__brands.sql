SELECT
    brand_id,
    brand_name
FROM {{ source('bike_raw_data', 'brands') }}
