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



