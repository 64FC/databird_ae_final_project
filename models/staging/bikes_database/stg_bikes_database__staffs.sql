-- Change manager_id to INT for storage optimization
SELECT
    staff_id, -- 10 distinct
    store_id, -- 3 distinct
    SAFE_CAST(NULLIF(manager_id, 'NULL') AS INT) AS manager_id,
    first_name AS staff_first_name,
    last_name AS staff_last_name,
--    email AS staff_email,
--    phone AS staff_phone,
    active
FROM {{ source('bike_raw_data', 'staffs') }}
