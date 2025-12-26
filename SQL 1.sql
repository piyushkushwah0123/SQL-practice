
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

-- super key and candidate key in SQL?

-- A Super Key is any set of one or more columns that can uniquely identify a row in a table.It may contain extra (unnecessary) attributes.
-- Super Keys: {student_id}  ,,  {email}  ,,  {phone}  ,,  {student_id, name}  ,,  {email, phone}
-- All of these uniquely identify a record → Super Keys

-- A Candidate Key is a minimal super key.
-- No extra attribute.  If you remove any column, it won’t remain unique
-- Candidate Keys from above table: {student_id}  ,, {email}  ,,  {phone}
-- {student_id, name} → Not candidate key (extra column name)


-- what is normalization in sql ?

-- Normalization = break big tables into smaller, well-structured tables
-- Normalization is the process of organizing database tables to reduce redundancy and improve data integrity.


-- what is 1nf and 2nf and 3nf(partially dependency)?

-- Normal Form	Removes
-- 1NF	Repeating / multi-valued data
-- 2NF	Partial dependency
-- 3NF	Transitive dependency


--  what are outer and self join

-- Outer Join means: Show matching data + non-matching data
-- Types: LEFT JOIN → all rows from left table 
--        RIGHT JOIN → all rows from right table
--        FULL JOIN → all rows from both tables
-- If no match → value becomes NULL

-- Self Join means: A table is joined with itself
-- Used when: One row depends on another row in the same table
--            (example: employee and manager)

-- Outer Join: Join two tables and keep unmatched rows
-- Self Join: Join a table with itself

use regex;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);
INSERT INTO employee (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),

(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),

(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),

(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),

(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),

(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),

(15, 'Sybil', 'Intern', 8, 35000);

select * from employee;

-- in terms of employee
select emp.emp_id , emp.emp_name , emp.manager_id from employee as emp join employee as manager;

-- in trefernce of manager
select manager.emp_id , manager.emp_name from employee as manager;

select emp.emp_id , emp.emp_name , emp.manager_id ,emp.salary, manager.emp_id , manager.emp_name  , manager.salary from employee as emp join employee as manager
where emp.manager_id = manager.emp_id;

use regex;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50)
);

INSERT INTO students (student_id, student_name, major) VALUES
(1, 'Aarav', 'Computer Science'),
(2, 'Bhavya', 'Mathematics'),
(3, 'Chetan', 'Physics'),
(4, 'Diya', 'Computer Science'),
(5, 'Esha', 'Mathematics'),
(6, 'Farhan', 'Physics'),
(7, 'Gauri', 'Computer Science'),
(8, 'Harsh', 'Mathematics'),
(9, 'Isha', 'Physics'),
(10, 'Jay', 'Computer Science'),
(11, 'Kiran', 'Mathematics'),
(12, 'Leena', 'Physics'),
(13, 'Manav', 'Computer Science'),
(14, 'Neha', 'Mathematics'),
(15, 'Om', 'Physics'),
(16, 'Pooja', 'Computer Science'),
(17, 'Qadir', 'Mathematics'),
(18, 'Riya', 'Physics'),
(19, 'Sahil', 'Computer Science'),
(20, 'Tina', 'Mathematics');


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO enrollments (enrollment_id, student_id, course_name, credits) VALUES
(101, 1, 'Data Structures', 4),
(102, 1, 'Algorithms', 4),
(103, 2, 'Linear Algebra', 3),
(104, 3, 'Quantum Mechanics', 4),
(105, 4, 'Operating Systems', 4),
(106, 5, 'Statistics', 3),
(107, 6, 'Electromagnetism', 4),
(108, 7, 'Databases', 4),
(109, 8, 'Probability', 3),
(110, 9, 'Thermodynamics', 4),
(111, 10, 'Computer Networks', 4),
(112, 11, 'Calculus II', 3),
(113, 12, 'Optics', 4),
(114, 13, 'Machine Learning', 4),
(115, 14, 'Discrete Math', 3),
(116, 15, 'Nuclear Physics', 4),
(117, 16, 'Software Engineering', 4),
(118, 17, 'Numerical Methods', 3),
(119, 18, 'Solid State Physics', 4),
(120, 1, 'Artificial Intelligence', 4);

select * from students;
select * from enrollments;

-- get the student who have enrolled in any courses or not 

select s.student_id , s.student_name, e.enrollment_id,e.course_name from students as s left join enrollments e on s.student_id=e.student_id;

-- Write a sql , query to list all student alomg with their enrolled it ..... only incluse who have enrolled at least one course

select s.student_name, e.course_name from students as s left join enrollments e on s.student_id=e.student_id;

select  s.student_id, s.student_name, e.enrollment_id, e.course_name from students as s left join enrollments e on s.student_id=e.student_id
where enrollment_id is NULL;

select  s.student_id, s.student_name, e.enrollment_id, e.course_name from students as s left join enrollments e on s.student_id=e.student_id;

select s.student_id, s.student_name, count(e.enrollment_id) from students as s join enrollments as e on s.student_id = e.student_id
group by s.student_id, s.student_name;

-- calculate the total credits earned by each students , including students who have not enrolled in any courses 

-- find the number of students in each major
select major, count(student_id) from students group by major;

select s.major, sum(c.credits) from students as s join enrollments e on s.student-id=e.student_id group by s.major;

 -- length of their names and show the count of students in each group
select char_length(student_name), count(student_id )from students group by char_length(student_name);

-- find out in each group how many students enrolled in courses
select char_length(s.student_name),count(s.student_id) from students s join enrollments e
on s.student_id = e.student_id group by char_length(s.student_name);

select char_length(s.student_name), count(e.student_id) from students s join enrollments e on s.student_id = e.student_id 
group by char_length(s.student_name) order by count(e.enrollment_id) desc limit 1;

-- CASE
/*
if (condition , true, false)
if( condition , true , if(condtion, true, if)

case 
    when condition Expression then output
    when condition. then output
end     
*/

select name , population,
case 
    when population=0 then 'No population'
    when population between 8000 and 70000 then 'Med population'
    else 'Condtion is False'
end as 'status' from world.country;

select count(*),
case 
    when population=0 then 'No population'
    when population between 8000 and 70000 then 'Med population'
    else 'Condtion is False'
end as 'status' from world.country group by status;

select continent, population 
from world.country;

-- kis continent m esi kitni country h jinki population 8000 - 70000 ke beech m
-- we can not write where bcz it will give full data and we can't categorize it
select continent,
sum(case 
    when population between 8000 and 70000 then 1 else 0
end )
from world.country group by continent;






