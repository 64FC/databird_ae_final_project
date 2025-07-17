SELECT
    ordered_at,
--    EXTRACT(YEAR FROM ordered_at) AS report_year,
--    EXTRACT(MONTH FROM ordered_at) AS report_month,
--    EXTRACT(DAY FROM ordered_at) AS report_day,
--    manager_id,
    shipped_status,
    staff_full_name,
    store_name,
    COUNT(DISTINCT order_id) AS count_orders,
    SUM(total_quantity) AS total_quantity,
    ROUND(SUM(total_amount), 2) AS total_amount,
    ROUND(SUM(total_discounted_amount), 2) AS total_discounted_amount,
    ROUND(AVG(days_shipped_after), 1) AS average_shipping_delay_days
FROM {{ ref('int_bikes_database__orders') }}
GROUP BY
    ordered_at,
--    report_year,
--    report_month,
--    report_day,
    shipped_status,
    staff_full_name,
    store_name
--ORDER BY 
--    ordered_at
