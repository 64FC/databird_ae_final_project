-- TODO: anonymize instead of not importing?
SELECT
    customer_id,
    first_name,
    last_name,
--    phone,
--    email,
--    street,
    city,
    state,
    zip_code
FROM {{ source('bike_raw_data', 'customers') }}
