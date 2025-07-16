SELECT
--    p.product_id,
    p.product_name,
    p.category_name,
    p.brand_name,
    p.total_quantity,
    ROUND(p.total_amount, 2) AS total_amount,
    ROUND(p.total_discounted_amount, 2) AS total_discounted_amount,
    ROUND(p.avg_discount, 2) AS avg_discount,
    s.total_stock_quantity
FROM {{ ref('int_bikes_database__products') }} p
INNER JOIN {{ ref('int_bikes_database__stocks') }} s ON p.product_id = s.product_id
--ORDER BY
--    category_name, 
--    brand_name
