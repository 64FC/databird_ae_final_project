SELECT
    product_id,
    product_name,
    category_name,
    brand_name,
    total_quantity,
    ROUND(total_amount, 2) AS total_amount,
    ROUND(total_discounted_amount, 2) AS total_discounted_amount,
    ROUND(avg_discount, 2) AS avg_discount
--    ROW_NUMBER() OVER (ORDER BY total_quantity DESC) AS rn_quantity,
--    ROW_NUMBER() OVER (ORDER BY total_amount DESC) AS rn_amount
FROM {{ ref('int_bikes_database__products') }}
ORDER BY
    category_name, 
    brand_name
