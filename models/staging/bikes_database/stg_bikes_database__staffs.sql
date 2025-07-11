-- If many rows, change manager_id to INT for storage optimization => change "NULL" to 0 for instance
SELECT
    staff_id,
    store_id,
    manager_id,
    first_name,
    last_name,
--    email,
--    phone,
    active
FROM {{ source('bike_raw_data', 'staffs') }}
