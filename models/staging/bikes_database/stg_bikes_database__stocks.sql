SELECT
    CONCAT(store_id, '_', product_id) AS stock_id, -- 3 x 313 = 939 distinct
    store_id, -- 3 distinct
    product_id, -- 313 distinct
    quantity
FROM {{ source('bike_raw_data', 'stocks') }}
