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