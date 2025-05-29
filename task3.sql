create database sales;
use sales;

create table cus1 (id int,product varchar(50),quantity int,price int);
insert into cus1 values(1,"apple",10,20);
insert into cus1 values(2,"orange",5,15);
insert into cus1 values(3,"apple",8,20);
insert into cus1 values(4,"banana",12,10);

# select where ,order by,group by 
#select+where 
select * from cus1 where product = "apple";
#orderby
select * from cus1 order by quantity desc;
#group by
select product,sum(quantity) as total_quantity from cus1 group by product;

#joins(inner,left,right)
create table cus3(customer_id int,name varchar(50));
insert into cus3 values(1,"aarav");
insert into cus3 values(2,"priya");
insert into cus3 values(3,"rahul");
select * from cus3;

create table orders2 (order_id int,customer_id int,product varchar(50));
insert into orders2 values(101,1,"laptop");
insert into orders2 values(102,2,"phone");
select * from orders2;
#inner join
SELECT cus3.name, orders2.product
FROM cus3
INNER JOIN orders2 ON cus3.customer_id = orders2.customer_id;
#left join 
SELECT cus3.name, orders2.product
FROM cus3
left JOIN orders2 ON cus3.customer_id = orders2.customer_id;
#right join 
SELECT cus3.name, orders2.product
FROM cus3
right JOIN orders2 ON cus3.customer_id = orders2.customer_id;

#subqueries(where,in select ,from)

create table cus5(id int,name varchar(50),marks int);
insert into cus5 values(1,"anu",90);
insert into cus5 values(2,"ravi",75);
insert into cus5 values(3,"meena",85);
#select+from+where 
select name,marks
from cus5 where marks=(select max(marks) from cus5);
#select+where+from+in
select name,marks 
from cus5 where marks in(select marks from cus5 where marks=75 or marks=85);

#create view for analysis 1st method
create view high_scores as
select name,marks from cus5 where marks>80;
select * from high_scores;
#2nd method
create view avg_marks as
select avg(marks) as average_marks from cus5;
select * from avg_marks;

#optimize queries with index
create table products1(product_id int,name varchar(100),category varchar(100),price int);
select * from products1 where category = "electronics";
create index idx_category on products1(category);
explain select * from products1 where category = "electronics";

#use aggregate functions 
create table cus6(id int ,product varchar(100),quantity int,price int ); 
insert into cus6 values(1,"apple",10,200);
insert into cus6 values(2,"banana",8,100);
insert into cus6 values(3,"dragon fruit",12,500);
insert into cus6 values(4,"mango",5,300);
insert into cus6 values(5,"guava",2,20);
#sum
SELECT SUM(Quantity) AS Total_Quantity FROM cus6;
#average
SELECT AVG(Price) AS Average_Price FROM cus6;
#max
SELECT MAX(Quantity) AS Max_Quantity FROM cus6;
#min
SELECT MIN(Price) AS Min_Price FROM cus6;
#count
SELECT COUNT(*) AS Total_Rows FROM cus6;












