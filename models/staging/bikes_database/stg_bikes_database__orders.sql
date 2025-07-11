-- store_id not used because can be retrieved with link to table staffs
-- order_status reworked until I know what is the difference between statuses 1, 2 and 3; 4 is shipped
-- required_date because I do not know what it means: can't extract value from it
SELECT
    order_id,
    customer_id,
--    store_id,
    staff_id,
    CASE
        WHEN order_status IN (1, 2, 3) THEN 0
        ELSE 1
    END AS shipped_status,
    order_date AS ordered_at,
--    required_date,
    shipped_date AS shipped_at
FROM {{ source('bike_raw_data', 'orders') }}
