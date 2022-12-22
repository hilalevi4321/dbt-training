{{ config(materialized="table") }} select * from {{ source("public", "raw_events") }}
