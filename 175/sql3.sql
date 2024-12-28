update salary set sex = case when sex = "M" then "F"
when sex = "F" then "m" else sex end 

#####################################################

with cte as (select customet_id , count(distinct produnct_key ) as total from customer group by customet_id )
select customet_id from customer where total = 
(select count(distinct produnct_key)  from product )


#####################################################


with cte as (


    select count(distinct a.post_id) / count(distinct r.post_id) * 100 as percent from 
   action a left join removels r
   on  a.post_id = r.post_id

   where extra = 'spam'
        group by  action_date

)

select rount(avg(percent),2) from cte


##########################################################################################################


-- calculate rolling average 


-- Use UNBOUNDED PRECEDING when calculating avg/sum from 1st row
SELECT 
    employee_name,
    sales_date,
    sales_amount,
    SUM(sales_amount) OVER (
        ORDER BY sales_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS rolling_sum_all_prev
FROM sales;




-- Use offset (integer) PRECEDING when calculating avg/sum from last nth  row


SELECT 
    employee_name,
    sales_date,
    sales_amount,
    COALESCE(AVG(sales_amount) OVER (
        ORDER BY sales_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), sales_amount) AS rolling_avg_no_gaps
FROM sales;








