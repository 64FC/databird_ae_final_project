SELECT
    p.product_id,
    p.brand_id,
    p.category_id,
    oi.order_id,
    p.product_name,
    COALESCE(oi.quantity, 0) AS quantity,
    oi.list_price,
    COALESCE(oi.discount, 0) AS discount
FROM {{ ref('stg_bikes_database__products') }} p
LEFT JOIN {{ ref('stg_bikes_database__order_items') }} oi ON p.product_id = oi.product_id
