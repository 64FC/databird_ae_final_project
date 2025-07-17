-- To have: would be best with a table dedicated to City, State and Zip Code
WITH orders_enrich AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.staff_id,
        o.shipped_status,
        o.ordered_at,
        DATE_DIFF(o.shipped_at, o.ordered_at, DAY) AS days_shipped_after,
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
    oe.days_shipped_after,
    sta.staff_full_name,
    sto.store_name,
    oe.total_quantity,
    oe.total_amount,
    oe.total_discounted_amount
FROM orders_enrich oe
INNER JOIN ( -- selecting only active staff members
    SELECT 
        staff_id,
        store_id,
        manager_id,
        staff_full_name
    FROM {{ ref('stg_bikes_database__staffs') }}
    WHERE active = 1
) sta ON oe.staff_id = sta.staff_id
INNER JOIN {{ ref('stg_bikes_database__stores') }} sto ON sta.store_id = sto.store_id
