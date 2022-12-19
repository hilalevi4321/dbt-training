SELECT productid,
       productname,
       category,
       subcategory,
       sum(orders_profit) as profit
FROM {{ ref('stg_orders') }}
GROUP BY productid,
         productname,
         category,
         subcategory