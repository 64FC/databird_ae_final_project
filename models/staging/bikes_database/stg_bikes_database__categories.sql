SELECT
    category_id,
    category_name
FROM {{ source('bike_raw_data', 'categories') }}
