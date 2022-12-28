WITH CALC_STATUS AS (
SELECT *, ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY (case type
                                                            when 'order.cancel' then 2
                                                            when 'order.completed' then 1
                                                            else 0 end) desc, order_created_at DESC ) RN
FROM {{ ref('stg_order') }}
WHERE order_group = 'order_status'
-- AND DATEADD(DAY, -1, CURRENT_DATE()) =TRY_TO_DATE(inserted_at)
    QUALIFY RN=1 
    order by inserted_at desc
)


SELECT c.* , g.GIG_CATEGORY_NAME
FROM CALC_STATUS c
LEFT JOIN 
{{ ref('stg_gig') }} g
ON c.gig_id=g.gig_id