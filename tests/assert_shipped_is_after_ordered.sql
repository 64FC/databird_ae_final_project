SELECT *
FROM {{ ref('stg_bikes_database__orders') }}
WHERE 
    DATE_DIFF(shipped_at, ordered_at, DAY) < 0
