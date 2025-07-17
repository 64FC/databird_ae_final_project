-- item_id not used: brings no new information
SELECT
    CONCAT(order_id, '_', product_id) AS order_item_id, -- 4722 distinct
    order_id, -- 1615 distinct
--    item_id,
    product_id, -- 307 distinct
    quantity,
    list_price,
    discount -- 4 distinct: .05, .07, .1, .2
FROM {{ source('bike_raw_data', 'order_items') }}
