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



