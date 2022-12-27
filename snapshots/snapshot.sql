{% snapshot gigs_snapshot %}

{{
    config(
        target_database="analytics",
        target_schema="snapshots",
        unique_key="GIG_ID",
        strategy="timestamp",
        updated_at="INSERTED_AT",
    )
}} 
       
            SELECT INSERTED_AT,
                   TYPE,
            GIG_CATEGORY_ID,
            GIG_CATEGORY_NAME,
            GIG_ID,
            GIG_PRICE,
            GIG_STATUS,
            GIG_SUB_CATEGORY_NAME
FROM {{ ref("stg_gig") }}