SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS count_orders,
    MIN(o.ordered_at) AS first_order_at,
    MAX(o.ordered_at) AS last_order_at,
    SUM(o.total_amount) AS total_amount_order,
    SUM(o.total_discounted_amount) AS total_discounted_amount_order,
    AVG(o.total_amount) AS average_amount_order
FROM {{ ref('stg_bikes_database__customers') }} c
LEFT JOIN {{ ref('int_bikes_database__orders') }} o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_city,
    c.customer_state
