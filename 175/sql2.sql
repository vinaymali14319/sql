with cte as (select id , tempreture ,recordsDate , lag() over (partition by recordsDate order by recordsDate ) as prev_temp from weather )

select id from cte where tempreture < prev_temp and datediff (recordsDate , recordsDate -  1) = 1 

#######################################


select player , min(event_date )  from activity group by player

#######################################

with cte(
select player_id , device id , rank() over (partition by player_id order by event_date asc ) as login from activity )


select player_id , device_id from cte where login = 1


#######################################




select player_id , event_date , sum(games_played) over (partition by player_id order by event_date ) as sum from activity


#######################################


select name from employee where id in (
select manager_id from employee group by manager_id having count(*) > 5 )



#######################################

with cte as (
select candidateid , count(candidateid) as total from vote group by candidateid )

select name from candidate where id in (
select candidateid from cte order by total desc limit 1 )


#######################################
 

 select bonus , name from employee left join bonus on a.empid = b.empid where b.bonus > 1000 or b.bonus is null




 #######################################
with cte as (

select id , month , salary , rank() over (partition by id order by month desc ) as ranking from employee )

select id ,month , sum(salary) over (partition by id order by ranking desc) as com_sal from cte limit ranking 1,3 


 #######################################


select department_name , sum(case when student_id is null then 0 else 1) as count from department left join student on a.department_id
= b.department_id group by department_id order by count desc , department_name  

 #######################################


select name from customer where refree_id != 2 or refree_id is null

 #######################################



select t1.id, case when isnull(t1.id ) then "root"
when  isnull(max(t2.p_id) ) then "leaf"
else "inner" as ans from tree t1 left join tree t2
on t1.id = t2.p_id
group by  
t1.id , t2.p_id


 #######################################


WITH MaxId AS (
    SELECT MAX(id) AS max_id FROM students
)
SELECT 
    student,
    CASE 
        WHEN id != (SELECT max_id FROM MaxId) AND id % 2 = 0 THEN id - 1
        WHEN id != (SELECT max_id FROM MaxId) AND id % 2 = 1 THEN id + 1
        ELSE id
    END AS ans
FROM students
order by ans 
