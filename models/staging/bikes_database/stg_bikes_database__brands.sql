SELECT
    brand_id, -- 9 distinct
    brand_name -- 9 distinct
FROM {{ source('bike_raw_data', 'brands') }}
