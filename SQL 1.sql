
use eg;

use world;

select name , substr(name, 2), substr(name, 2,4) from country;
use world;
SHOW DATABASES;
CREATE DATABASE world;

use world;
show tables;

select name , population  from country where substr(name,1,3)='alg';
select name ,instr(name,'b')from country;

select name , char_length(name) from country; 

select char_length( '     piyush     ');

select char_length (trim( '     piyush     '));

select char_length (rtrim( '     piyush     '));

select char_length (ltrim( '     piyush   '));

select trim(both 'z' from 'piyu shzzzzzz');

select name, trim(both 'a' from name)from country;

select name, trim(both 'A' from trim(both 'a' from name) )from country;

-- lpad or rpad 
-- when we want to define a colum with fixed size

select name, population, lpad(population, 9,"0") from country;

select name , replace(name , 'a','')from country;

use world;

 -- numeric fuction and date fuction
 select lifeexpectancy , round(lifeexpectancy)from country;
select 30.68, round(30.631,2);

-- round off to nearest 10th place
-- 456.10
-- 6 -> one place , 5 -> 10th place , 4 -> 100th place 
select 6.0012, round (3663.72,2), truncate(3663.72,1);

-- date fuctions { now () <= current date and time 
select now(), current_date(), current_time();

-- add date fuction => by default date add, (month , year , time )
select now(), adddate(now(),2),adddate(now(),interval 2 hour);

select now(), year(now());

select adddate(payment_date,2) from sakila.payment;

  -- extract ( year , moth , week , day ) 
 select now(), extract(year from now()); 
 select now(), extract(week from now());
 
 -- date format  => extract but with a string (message)
 select now(), extract(year from now()), date_format(now(), 'Year is %Y');

 select replace('i like java' , 'java' , 'Sql');
 
 -- aggregate fuction ( multi line fuction ) => will give you some result
 -- distinct
 
 select distinct continent from country;

select continent , region from country;

-- aggregate => to apply some calculation pver set of rows
select count(indepyear) from country;

USE world;

select count(indepyear) from country;

SELECT COUNT(indepyear) FROM country;

select count (continent), count(distinct continent)from country;

select count(indepyear), count(*) from country where Continent='Asia';

select * from country;

-- get the total country and total region along with the avaerage alive expentency and the total poulation for the
-- country is who have got the indepepncdence after 1947 and before 1998

select count(name), count(region),avg(lifeexpectancy), sum(population)
from country where indepyear>1947 and IndepYear<1998;

-- guess the total no. of country and the unique region along with the total population and higest lifeexpectancy 
-- rate with the total capitals for the country starting with the letter 'A' and letter 'D'

select count(name), count(distinct region), max(lifeexpectancy), sum(population), sum(Capital)
from country where left (name,1) = 'A' OR left (name,1) = 'D';

-- asia (total country)
select count(name) from country where continent = 'asia'; 

select count(name) from country where continent = 'africa'; 

-- group  by statement ( similar value ko collect krna in a group)

select continent from country group by continent;

select indepyear from country group by indepyear;

select continent, count(name)from country group by continent;

-- jis bhi colum pr group by krte ho ussi colum pr 

-- we need to find out the total country and the total populaion for each independent year 

select count(name), sum(population), indepyear from country group by indepyear;

-- group by ke sath column nhi lag sakta 

select sum(population)from country;

select continent, count(name) from country group by continent;

-- find out asia continent , how many country are there ?

select count(name) from country where continent='Asia' and indepyear>1950;

select continent, count(name) from country where indepyear>1950 group by continent;

select continent, count(name) from country group by continent;

-- where m sirf whii data filter hoga jo data physically present ho.

select continent, count(name) from country where count(name)>30 group by continent;

-- where hmesha data ko filter krta h and unhi data ko filter krta h jo data m present ho,and, having uss data ko filter krta h jo colum mila uspr filter krta h , aggregate function ke upper.
select continent, count(name) from country group by continent having count(name)>30;

-- you need to find out the total population innsach continent?

select continent , sum(population) from country group by continent;

select continent , sum(population) from country group by continent having sum(population)>30401150;

-- harr ek saal kitni country independent hui
select indepyear, count(name)from country group by indepyear;

select indepyear, count(name)from country where indepyear>1930 group by indepyear having count(name)>2;

-- you need to get gov. form and the total no. of country for each gov. form where there total no. of country should be greater than 20?
-- you need to get gov. form and the total no. of country for each gov. where the country should have the capital greater than 30?
-- get the no. of country and the region with the total population where the lifeexpectancy should be greater than 38 and the population in each continent should be greater than 3lac?

select GovernmentForm ,count(name) from country group by GovernmentForm having count(name)>20;

select GovernmentForm ,count(name) from country where capital>30 group by GovernmentForm;

select continent, count(name), count(region), sum(population) from country where lifeexpectancy>38 group by Continent having sum(population)<300000;

use sakila;

show tables;

select * from payment;

select count(*) from payment where amount=2.99; 

select * from payment;

select amount, count(*) from payment group by amount;


select customer_id, sum(amount) from payment group by customer_id;

select customer_id, sum(amount) from payment where  amount>3 group by customer_id;

select * from payment;

select amount, count(*) from payment where payment_date > 2005-05 group by amount;

select payment-date, month(payment-date) from payment where month (payyment-date)=5 group by customer-id;

select * from payment;
select customer_id, count(amount) from payment
where month(payment_date)=5 group by customer_id;

-- you need to find out the max transiction amount ther avg transiction amount and the total transiction amount done threough each staff

select * from payment;

select staff_id, max(amount), avg(amount), sum(amount) from payment where customer_id%2=0 group by staff_id;

select * from payment;

-- get the amount and the total transction for each amount only for the payment done througt the staff id 1 and the total transtion should be greater than 30

select amount, count(*) from payment where staff_id =1 group by amount having count(*)>30;

-- find out the no. of customer served along with avg amount and the total amount spent in each month for staff id 1 & 2

select month(payment_date), count (customer_id),
avg(amount), sum(amount)
from payment where staff_id=1 or staff_id=2 group by month(payment_date);

-- find out the no. of customer served along with avg amount and the total amount spent in each month each year staff id 1 & 2

select extract(year from paymentt_date),extract(month from payment_date), count (customer_id),
avg(amount), sum(amount)
from payment where staff_id=1 or staff_id=2 group by extract(year from payment_date), extract(month from payment_date);

select * from payment order by customer_id, amount desc;

use world;

-- Data Model :-

-- structure => how to organise 
-- 1. conceptional ,, 2. logical ,, 3. physical
-- 1. conceptional => entity,attributes => relationship
-- 2. logical
-- 3. phyiscal => table , column , relationship, data types

-- Primary key = unique { no dublicates value}
-- Foreign key = multiple { dublicates value}

use world;

-- city table (id primary key), country code(foregin key)
select * from city;
describe city;
select * from country;

-- code(primary key)
select count(code), count(distinct code) from country;

-- join (it is used to connect two tables from primary key and foregin key)

select cy.id, cy.name, cy.countrycode, cnt.code, cnt.name, cnt.continent from city as cy
join
country as cnt
where cy.countrycode=cnt.code;

select cnt.code, cnt.name, cnt.continent from country as cnt;

-- find the city name, population , country name along with the gov. form for each city 

select ct.name, ct.population, cuy.name, cuy.governmentform from city as ct
join 
country as cuy
where ct.countrycode=cuy.code;

-- get the country name and population and the language spoken with the percentage of each language  

CREATE DATABASE REGEX;

USE REGEX;CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);



select * from customers;
select * from orders;

select c.cid, c.customer_name,
o.order_id, o.customer_id, o.amount from customers as c
join orders as o 
where c.cid=o.customer_id;

select c.customer_id, c.customer_name,
o.order_id, o.customer_id, o.amount from customers as c inner
join orders as o 
on c.customer_id=o.customer_id;

select c.customer_id, c.customer_name,
o.order_id, o.customer_id, o.amount from customers as c left
join orders as o 
on c.customer_id=o.customer_id;

select c.customer_id, c.customer_name,
o.order_id, o.customer_id, o.amount from customers as c right
join orders as o 
on c.customer_id=o.customer_id;

alter table customers rename column customer_id to cid;
desc customers;

select c.customer_name, sum(o.amount) as total_amount
 from customers c join orders o 
 on c.cid=o.customer_id
 group by c.customer_name;
 
 use sakila;
 
 
 -- find actor id actor name total no. of movies he work in sakila database
 
 select * from film_actor;
 select * from actor;
 select * from film;
 
 select a.actor_id, concat(a.first_name, ' ', a.last_name), count(fa.film_id) 
 from actor as a join film_actor as  fa on a.actor_id=fa.actor_id
 group by a.actor_id, a.first_name, a.last_name;

 select a.actor_id, a.first_name, count(fa.film_id) 
 from actor as a join film_actor as  fa on a.actor_id=fa.actor_id
 group by a.actor_id, a.first_name;

-- super key and candidate key
-- what is normalization in sql
-- what is 1nf and 2nf and 3nf(partially dependency)
--  what are outer and self join