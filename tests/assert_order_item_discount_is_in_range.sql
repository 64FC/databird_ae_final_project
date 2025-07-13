SELECT
    order_item_id,
    MIN(discount) AS min_discount,
    MAX(discount) AS max_discount
FROM {{ ref('stg_bikes_database__order_items') }}
GROUP BY order_item_id
HAVING min_discount < 0
OR max_discount > 1
