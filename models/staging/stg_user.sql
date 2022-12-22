WITH unique_users AS
(
    SELECT ifnull(uid,'') uid,
    inserted_at,
    ROW_NUMBER() OVER(PARTITION BY uid ORDER BY (SELECT inserted_at)) rn,
    user_amount_earned,
    user_gig_count,
    user_name,
    user_seller_level
   
    FROM {{ ref('raw_events') }}
    WHERE 1=1
    QUALIFY rn=1
)


SELECT uid,
       user_amount_earned,
       user_gig_count,
       user_name,
       user_seller_level

FROM unique_users
