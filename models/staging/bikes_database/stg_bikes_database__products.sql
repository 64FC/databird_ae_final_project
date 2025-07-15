-- 321 distinct product_id versus 291 distinct product_name: problem is some products have different category_id
-- some are in categories 5-3-2, others in 3-2, others in 3-1: here I choose to only keep the max value
-- and I take the min of product_id to secure the deduplication
SELECT
    MIN(product_id) AS product_id,
    brand_id, -- 9 distinct
    MAX(category_id) AS category_id, -- 7 distinct
    product_name,
    model_year, -- 4 distinct: 2016, 2017, 2018, 2019
    list_price
FROM {{ source('bike_raw_data', 'products') }}
GROUP BY
    brand_id,
    product_name,
    model_year,
    list_price
