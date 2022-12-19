SELECT customerid,
       segment,
       country,
       sum(orders_profit) as profit
FROM {{ ref('stg_orders') }}
GROUP BY customerid,
         segment,
         country