-- item_id not used: brings no new information
-- list_price removed: already in Products table
SELECT
    CONCAT(order_id, '_', product_id) AS order_item_id,
    order_id,
--    item_id,
    product_id,
    quantity,
--    list_price,
    discount
FROM {{ source('bike_raw_data', 'order_items') }}
