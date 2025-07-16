SELECT
    product_id,
    SUM(quantity) AS total_stock_quantity
FROM {{ ref('stg_bikes_database__stocks') }}
GROUP BY
    product_id
