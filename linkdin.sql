use linkin_prob;

show tables;

select * from data;


CREATE TABLE Products(
sell_date DATE,
product VARCHAR(25)
);

INSERT INTO Products(sell_date, product) VALUES
(CAST('2020-05-30' AS DATE), 'Headphones'),
(CAST('2020-06-01' AS DATE), 'Pencil'),
(CAST('2020-06-02' AS DATE), 'Mask'),
(CAST('2020-05-30' AS DATE), 'Basketball'),
(CAST('2020-06-01' AS DATE), 'Book'),
(CAST('2020-06-02' AS DATE), 'Mask'),
(CAST('2020-05-30' AS DATE), 'T-Shirt');

select * from Products;

select sell_date , count(product) , group_concat(product) from  Products  group by sell_date;

=========================================================================================================================================

create table brands
(
 Year int,
 Brand varchar(20),
 Amount int
);
insert into brands values (2018, 'Apple', 45000);
insert into brands values (2019, 'Apple', 35000);
insert into brands values (2020, 'Apple', 75000);
insert into brands values (2018, 'Samsung', 15000);
insert into brands values (2019, 'Samsung', 20000);
insert into brands values (2020, 'Samsung', 25000);
insert into brands values (2018, 'Nokia', 21000);
insert into brands values (2019, 'Nokia', 17000);
insert into brands values (2020, 'Nokia', 14000);

select * from brands;
select distinct(b.brand) from brands b where brand not in (
select a.brand from (
select   brand , Amount,Amount-lag (Amount ,1 ) over (PARTITION BY brand ORDER BY year ) as amt  from brands) a where a.amt < 0);

===============================================================================================================================================================
CREATE TABLE Employee(
emp_id INT,
emp_name VARCHAR(25),
salary INT,
dep_id INT
);

INSERT INTO Employee(emp_id, emp_name, salary, dep_id) VALUES
(1001, 'Marlania', 92643, 1),
(1002, 'Briana', 87202, 1),
(1003, 'Maysha', 70545, 1),
(1004, 'Jamacia', 65285, 1),
(1005, 'Kimberli', 51407, 2),
(1006, 'Lakken', 88933, 2),
(1007, 'Micaila', 82145, 2),
(1008, 'Gion', 66187, 2),
(1009, 'Latoynia', 55729, 3),
(1010, 'Shaquria', 52111, 3),
(1011, 'Tarvares', 82979, 3),
(1012, 'Gabriella', 74132, 4),
(1013, 'Medusa', 72551, 4),
(1014, 'Kubra', 55170, 4);
select e.dep_id,
min(case when max_sal = salary then emp_name end) as max_salary_emp,
min(case when min_sal = salary then emp_name end) as min_salary_emp
from employee e left join (
select  dep_id,
min(salary) as min_sal,
max(salary) as  max_sal from Employee a group by a.dep_id ) e2 on e.dep_id = e2.dep_id group by e.dep_id
order by e.dep_id;


