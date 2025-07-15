SELECT
    store_id, -- 3 distinct
    store_name, -- 3 distinct
--    phone,
--    email,
--    street,
    city AS store_city,
    state AS store_state,
    zip_code AS store_zip_code
FROM {{ source('bike_raw_data', 'stores') }}
