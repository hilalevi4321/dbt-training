WITH CALC_STATUS AS (
SELECT *, ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY (case type
                                                            when 'order.cancel' then 2
                                                            when 'order.completed' then 1
                                                            else 0 end) desc, order_created_at DESC ) RN
FROM {{ ref('stg_order') }}
WHERE order_group = 'order_status'
-- AND ORDER_ID= 718479393
QUALIFY RN=1
)

SELECT * 
FROM CALC_STATUS 
