SELECT
    op.product_id,
    op.category_id,
    op.brand_id,
    op.product_name,
    c.category_name,
    b.brand_name,
    SUM(op.quantity) AS total_quantity,
    SUM({{ calculate_total_amount('quantity', 'list_price') }}) AS total_amount,
    SUM({{ calculate_total_discounted_amount('quantity', 'list_price', 'discount') }}) AS total_discounted_amount,
    AVG(op.discount) AS avg_discount
FROM {{ ref('int_bikes_database__order_products') }} op
INNER JOIN {{ ref('stg_bikes_database__categories') }} c ON op.category_id = c.category_id
INNER JOIN {{ ref('stg_bikes_database__brands') }} b ON op.brand_id = b.brand_id
GROUP BY
    op.product_id,
    op.category_id,
    op.brand_id,
    op.product_name,
    c.category_name,
    b.brand_name
