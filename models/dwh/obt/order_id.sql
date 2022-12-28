SELECT *
FROM {{ ref('orders_snapshot') }}
where DBT_VALID_TO IS NULL