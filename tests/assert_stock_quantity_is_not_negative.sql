SELECT
    stock_id,
    MIN(quantity) as min_quantity
FROM {{ ref('stg_bikes_database__stocks') }}
GROUP BY stock_id
HAVING min_quantity < 0
