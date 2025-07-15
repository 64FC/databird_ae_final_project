SELECT
    category_id, -- 7 distinct
    category_name -- 7 distinct
FROM {{ source('bike_raw_data', 'categories') }}
