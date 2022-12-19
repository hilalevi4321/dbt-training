select o.orderid,
       o.orderdate,
       o.SHPIDATE,
       o.shipmode,
       o.ORDERSELLINGPRICE-o.ORDERCOSTPRICE AS orders_profit,
       o.ORDERSELLINGPRICE,
       o.ORDERCOSTPRICE,
       c.customerid,
       c.customername,
       c.segment,
       c.country,
       g.category,
       g.productname,
       g.productid,
       g.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid=c.customerid
left join {{ ref('raw_products') }} as g
on o.productid=g.productid