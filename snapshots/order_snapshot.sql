{% snapshot orders_snapshot %}

{{
    config(
        target_database="analytics",
        target_schema="snapshots",
        unique_key="order_id",
        strategy="timestamp",
        updated_at="inserted_at",
    )
}} select inserted_at,TYPE,
            ORDER_AMOUNT,
            ORDER_STATUS,
            ORDER_ID,
            ORDER_TYPE from {{ ref("order") }}

{% endsnapshot %}
