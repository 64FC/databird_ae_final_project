-- TODO: anonymize instead of not importing?
SELECT
    customer_id, -- 1445 distinct
--    first_name AS customer_first_name,
--    last_name AS customer_last_name,
--    phone AS customer_phone,
--    email AS customer_email,
--    street AS customer_street,
    city AS customer_city, -- 195 distinct
    state AS customer_state, -- 3 distinct
    zip_code AS customer_zip_code -- 195 distinct
FROM {{ source('bike_raw_data', 'customers') }}
