-- To have: would be best with a table dedicated to City, State and Zip Code
WITH orders_enrich AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.staff_id,
        o.shipped_status,
        o.ordered_at,
        o.shipped_at,
        SUM(op.quantity) AS total_quantity,
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
        o.shipped_at
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
    c.customer_first_name,
    c.customer_last_name,
    c.customer_city,
    c.customer_state,
    c.customer_zip_code,
    sta.staff_first_name,
    sta.staff_last_name,
    sto.store_name,
    sto.store_city,
    sto.store_state,
    sto.store_zip_code,
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
        staff_first_name,
        staff_last_name
    FROM {{ ref('stg_bikes_database__staffs') }}
    WHERE active = 1
) sta ON oe.staff_id = sta.staff_id
INNER JOIN {{ ref('stg_bikes_database__stores') }} sto ON sta.store_id = sto.store_id
