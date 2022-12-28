
SELECT a.id ,
       a.created_at,
       a.inserted_at,
       a.type,
       a.gig_id,
       a.order_amount,
       a.order_created_at,
       a.order_delivery_type,
       a.order_id ,
       a.order_package_id ,
       a.order_parent_order_id, 
       a.order_status,
       a.order_type,
       "GROUP" as order_group,
       {{ amount_bucket() }}
    , SUBSTRING(a.created_at,0,10) date_create

FROM 
{{ ref('raw_events') }} as a

WHERE 1=1

AND  "GROUP" IN ( 'order_status',
                  'order_flow',
                  'order_requirements',
                  'resolution_center',
                  'ratings',
                  'rating',
                  'offer' )  

