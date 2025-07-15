SELECT
    ordered_at AS report_date,
--    EXTRACT(YEAR FROM ordered_at) AS report_year,
--    EXTRACT(MONTH FROM ordered_at) AS report_month,
--    EXTRACT(DAY FROM ordered_at) AS report_day,
--    manager_id,
    shipped_status,
    customer_city,
    staff_full_name,
    store_name,
    SUM(total_quantity) AS total_quantity,
    ROUND(SUM(total_amount), 2) AS total_amount,
    ROUND(SUM(total_discounted_amount), 2) AS total_discounted_amount,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(DATE_DIFF(shipped_at, ordered_at, DAY)), 1) AS average_shipping_delay_days
--    ROW_NUMBER() OVER (ORDER BY SUM(total_quantity) DESC) AS rn_quantity,
--    ROW_NUMBER() OVER (ORDER BY SUM(total_amount) DESC) AS rn_amount
FROM {{ ref('int_bikes_database__orders') }}
GROUP BY
    report_date,
--    report_year,
--    report_month,
--    report_day,
    shipped_status,
    customer_city,
    staff_full_name,
    store_name
ORDER BY 
    report_date
