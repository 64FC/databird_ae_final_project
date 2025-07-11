-- To have: would be best with a table dedicated to City, State and Zip Code
WITH orders_enrich AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.staff_id,
        o.shipped_status,
        o.ordered_at,
        o.shipped_at,
        SUM(o.quantity) AS total_quantity,
        SUM({{ calculate_total_amount('quantity', 'list_price') }}) AS total_amount,
        SUM({{ calculate_total_discounted_amount('quantity', 'list_price', 'discount') }}) AS total_discounted_amount
    FROM {{ ref('stg_bikes_database__orders') }} o
    INNER JOIN {{ ref('int_bikes_database__order_products') }} op ON o.order_id = op.order_id
    GROUP BY
        o.order_id,
        o.customer_id,
        o.staff_id,
        o.shipped_status,
        o.ordered_at,
        o.shipped_at,
        o.list_price,
        o.discount,
)
SELECT
    oe.order_id,
    oe.customer_id,
    oe.staff_id,
    sta.store_id,
    sta.manager_id,
    oe.shipped_status,
    oe.ordered_at,
    oe.shipped_at,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name
    c.city AS customer_city,
    c.state AS customer_state,
    c.zip_code AS customer_zip_code,
    sta.first_name AS staff_first_name,
    sta.last_name AS staff_last_name,
    sto.store_name,
    sto.city AS store_city,
    sto.state AS store_state,
    sto.zip_code AS store_zip_code,
    oe.total_quantity,
    oe.total_amount,
    oe.total_discounted_amount
FROM orders_enrich oe
INNER JOIN {{ ref('stg_bikes_database__customers') }} c ON oe.customer_id = c.customer_id
INNER JOIN ( -- selecting only active staff members
    SELECT 
        staff_id,
        store_id,
        manager_id,
        first_name,
        last_name
    FROM {{ ref('stg_bikes_database__staffs') }}
    WHERE active = 1
) sta ON oe.staff_id = sta.staff_id
INNER JOIN {{ ref('stg_bikes_database__stores') }} sto ON sta.store_id = sto.store_id
