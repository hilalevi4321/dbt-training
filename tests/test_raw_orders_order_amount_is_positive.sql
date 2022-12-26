SELECT order_id, SUM(ORDER_AMOUNT) ORDERAMOUNTPRICE
FROM {{ ref('raw_events') }}
GROUP BY order_id
HAVING sum(ORDER_AMOUNT)<0