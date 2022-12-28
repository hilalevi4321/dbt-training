{{
     config(materialized="table") 
}}

 SELECT * 
 FROM 
 { source("public", "raw_events") }}
