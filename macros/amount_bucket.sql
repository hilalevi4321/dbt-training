  {% macro amount_bucket() %}
  

   case when order_amount <= 5.5                             then '1_5_dollar'
                   when order_amount >  5.5 and order_amount <= 10    then '2_10_dollar'
                   when order_amount >  10  and order_amount <= 50    then '3_11_to_50_dollar'
                   when order_amount >  50  and order_amount <= 100   then '4_51_to_100_dollar'
                   when order_amount >  100  and order_amount <= 200  then '5_101_to_200_dollar'
                   when order_amount >  200                             then '6_above_200'
              end as amount_bucket


{% endmacro %}