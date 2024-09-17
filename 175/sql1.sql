select a.firstname,a.lastname,b.state,b.city from person a left join address b on a.personid = b.personid

#############################

# Wrong answer because is there is no 2nd height then it will give enmpty insted of null

# select salary from text order by salary limit 1, 1


select max(salary) from text where salary <  (select max(salary) from text ) 



################################
with cte as (
select salary , dense_rank() over (order by salary desc ) as dense_order from text )

select salary from cte where dense_order = @n 


#############################################


select score , dense_rank() over (order by score desc ) as rank from text 


#############################################
with cte as (
select id, num , lag (num) over (order by id) as last_num , lead (num) over (order by id) as next_num from logs )

select * from cte where num= last_num and num = next_num

###########################################


select name from employee a inner join employee b  on  a.id = b.id where  a.salary  > b.salary


##############################################

select email , count(*) from person group  by email where count (*) > 1 

##############################################


select name from customer where is not in (select id from orders)


##############################################



with cte as (
select name , dense_rank( ) over (partition by department_id   order by salary desc ) as ranking from employee ) 

select name from cte where ranking = 1


##############################################


with cte as (
select a.name ,b.dept_name , a.salary ,  dense_rank( ) over (partition by b.dept_name   order by a.salary desc ) as ranking 
from employee a inner join department b on a.id = b.id 


) 

select name,dept_name , salary from cte where ranking < 4

##############################################



delete a.emails , a.id from   person a inner join person b on a.emails = b.email and a.id < b.id



##############################################
