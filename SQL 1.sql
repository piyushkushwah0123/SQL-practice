
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

-- Correlated subquery example


create database regexcorr;
use regexcorr;

CREATE TABLE employee (
    eid INT PRIMARY KEY,
    ename VARCHAR(50),
    salary INT,
    department_name VARCHAR(50)
);

INSERT INTO employee (eid, ename, salary, department_name) VALUES
(1,  'Emp1',  30000, 'HR'),
(2,  'Emp2',  32000, 'HR'),
(3,  'Emp3',  34000, 'HR'),
(4,  'Emp4',  36000, 'HR'),
(5,  'Emp5',  38000, 'HR'),

(6,  'Emp6',  50000, 'IT'),
(7,  'Emp7',  52000, 'IT'),
(8,  'Emp8',  54000, 'IT'),
(9,  'Emp9',  56000, 'IT'),
(10, 'Emp10', 58000, 'IT'),

(11, 'Emp11', 60000, 'Finance'),
(12, 'Emp12', 62000, 'Finance'),
(13, 'Emp13', 64000, 'Finance'),
(14, 'Emp14', 66000, 'Finance'),
(15, 'Emp15', 68000, 'Finance'),

(16, 'Emp16', 40000, 'Sales'),
(17, 'Emp17', 42000, 'Sales'),
(18, 'Emp18', 44000, 'Sales'),
(19, 'Emp19', 46000, 'Sales'),
(20, 'Emp20', 48000, 'Sales');

select e.eid, e.ename, e.salary, e.department_name, d.location
from employee e
join department d
on e.department_name = d.department_name
where e.salary > 50000;

SHOW TABLES;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

TRUNCATE TABLE employee;

INSERT INTO employee (eid, ename, salary, department_name) VALUES
(1,  'Emp1',  30000, 'HR'),
(2,  'Emp2',  32000, 'HR'),
(3,  'Emp3',  34000, 'HR'),
(4,  'Emp4',  36000, 'HR'),
(5,  'Emp5',  38000, 'HR'),
(6,  'Emp6',  50000, 'IT'),
(7,  'Emp7',  52000, 'IT'),
(8,  'Emp8',  54000, 'IT'),
(9,  'Emp9',  56000, 'IT'),
(10, 'Emp10', 58000, 'IT'),
(11, 'Emp11', 60000, 'Finance'),
(12, 'Emp12', 62000, 'Finance'),
(13, 'Emp13', 64000, 'Finance'),
(14, 'Emp14', 66000, 'Finance'),
(15, 'Emp15', 68000, 'Finance'),
(16, 'Emp16', 40000, 'Sales'),
(17, 'Emp17', 42000, 'Sales'),
(18, 'Emp18', 44000, 'Sales'),
(19, 'Emp19', 46000, 'Sales'),
(20, 'Emp20', 48000, 'Sales');

select e.eid, e.ename, e.salary, e.department_name, d.location
from employee e
join department d
on e.department_name = d.department_name
where e.salary > 30000;

select * from employee;

select ename, salary, department_name from employee where eid=4 and salary>(select avg(salary) from employee as e
where e.department_name=employee.department_name);

select department_name, avg(salary) from employee group by department_name; 

-- employe name,department salry and salary  should be minium of that particular minimum salary ke equal ho

select ename, department_name, salary from employee
where salary = (select min(salary) from employee e2
where e2.department_name = employee.department_name);

select ename, department_name, salary from employee
where salary<=all(select min(salary) from employee e2
where e2.department_name = employee.department_name);

-- table
-- DDL statment 
-- create drop, alter , truncate
create database regex1;
use regex1;
create table test1( sno int); -- tables create (sno column name)

describe test1;
-- dml ( insert statement) 

-- dml ( insert , update , delete , merge)
insert into test1 value(10);
select * from test1;
insert into test1(sno) value(11);
insert into test1(sno) value(20),(null),(30); -- 3 rows insert

select count(sno) from test1;  -- column name dete h tab null count nhi karega 
select count(sno), count(*) from test1;  -- idhar column name dene pr null count nhi kr rha but (*) dene pr null count karega

create table test2 (sno int not null ,salary int);

insert into test2(sno,salary) values (20,1000);
insert into test2(sno,salary) values (20,null);
insert into test2(sno,salary) values (null,1000);  -- we have set constraint (error)
insert into test2(sno) values (1000);
insert into test2(salary) values (500000);  -- error ( bcz no null and no default set

select * from test2;

-- default constraint 

create table test3(sno int not null default 80, salary int);
insert into test3(salary) values(1000);
insert into test3(sno) values(5000);

select * from test3;

-- unique Constraints

create table test4(sno int not null, salary int unique default 100);
select * from test4;

insert into test4 (sno , salary ) values (1000,20000);
insert into test4 (sno , salary ) values (1001,20000);  -- error dublicate values 

insert into test4(sno) values(600);
select * from test4;
insert into test4(sno) values(700); -- error 100 is a value already in table

insert into test4(sno,salary) values(1001,null);   -- multiple null values can be inserted 
insert into test4(sno,salary) values(1001224,null);  -- error dublicate values

-- Check Constraints ( condition dena like if else)
-- check condition 

create table test8(sno int check (sno between 1 and 100),
check (salary in (1000,2000) ));

drop table test7;
create table test7(sno int, salary int,
constraint regex_test7_sno_chk check (sno between 1 and 100),
constraint regex_test7_salary_chk check (salary in (1000,2000) ));
 
 insert into test7(sno,salary) values (4,1000);
select * from test7;
 insert into test7(sno,salary) values (150,1000);  -- error 
 insert into test7(sno,salary) values (90,1500);   -- error

-- create table name as employee,id with primary key use varchar, email column with unique constraint , college with a default value 
-- age with a condition greater than 18 and the guardian should be a pallindrome -> ( use check constraint bcz constraint)

create table test9(name varchar(20) , check (name=reverse (name)));
insert into test9 values('madam');
select * from test9;

create table employee (id varchar(20) primary key,email varchar(100) unique,
college varchar(100) default 'ABC College',
age int check  (age > 18),guardian varchar(50),check (guardian = reverse(guardian)));

insert into employee (id, email, age, guardian)
values ('01', 'test@gmail.com', 22, 'naman');

create database regex1;
use regex1;

drop table customer9;
drop table orders9;

create table customer9(cid int primary key,cname varchar(20));
insert into customer9 values(10,'aman'),(11,'shubham');

drop table orders9;
create table orders9(old int primary key,city varchar(20),cid int,foreign key(cid) references customer9(cid));
insert into orders9 values(1009,'jaipur',10),(1000,'goa',11),(1011,'J K',10);
insert into orders9 values(1012,'Japan',90);  -- Cannot update or add ( Error)

select * from customer9;
select * from orders9;

use regex;
create table actor_cp as select first_name as fname, last_name as last from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;
update actor_cp set last="goyal" where fname="zero";

-- delete from actor_cp;

truncate actor_cp;

-- truncate is a ddl statement which is use to delete tha data without modification
-- in truncate we don't apply any condition 
-- if we use ddl statement we cant't rollback
-- objects are subjects that can be used to store , manage and refer the data

-- Table me har record ko uniquely identify karti hai
-- link between 2 tables 
-- Multiple tables ke data ko common column ke base par jodta hai

select * from sakila.actor;
select * from sakila.payment;

-- Windows function => window funtion is used to perform the calculation on the set of rows with reference to current rows 
-- 3 parts => 1.Over == to apply the functin over a window(a set of rows)

use world;
select * from country;
select code,name,continent,
population,(select sum(population) from country) from country;  

select code,name,continent,
population,sum(population) over() from country; 

-- subqueries m over() use nhi kr sakte

-- Partition By => it is same as group by, which is used to apply the logic into group  // similar values pr lagate h 

--  3705025700 , north america => 482993000
select continent , sum(population) from country group by continent;

-- 3705025700
select code, name, continent,
 population , sum(population) over(partition by continent)from country;

-- Q. what is the running sum , cumulative sum ?
-- in this we use " order by "

select code, name, continent,
 population , sum(population) over(order by population)from country;

use world;
select * from country;

select code, name, continent, population from country;

select population, avg(population) from country;    -- error

select code, name, continent, population, avg(population) over(), sum(population) over() from country;

select continent, sum(population) from country group by continent;

-- over => its is used to perform set of rows calculate ( partion by => based on continent )

select code, name, continent, population,
sum(population) over(),
sum(population) over(partition by continent) from country;

select code, name, continent, population,
sum(population) over(partition by code) from country;

select code, name, continent, region, population,
sum(population) over(partition by continent),
sum(population) over(partition by continent,region) from country;



CREATE DATABASE IF NOT EXISTS window_fn_practice;
USE window_fn_practice;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
salary INT NOT NULL,
hire_date DATE NOT NULL
);
CREATE TABLE sales (
sale_id INT PRIMARY KEY,
emp_id INT NOT NULL,
sale_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, full_name, department, city, salary, hire_date) VALUES
(101, 'Asha Nair', 'Sales', 'Mumbai', 65000, '2022-04-10'),
(102, 'Rohan Mehta', 'Sales', 'Pune', 72000, '2021-07-05'),
(103, 'Neha Singh', 'Sales', 'Delhi', 68000, '2023-01-15'),
(104, 'Kabir Rao', 'Engineering', 'Bengaluru', 120000, '2020-09-20'),
(105, 'Isha Verma', 'Engineering', 'Hyderabad', 110000, '2021-11-12'),
(106, 'Vikram Das', 'Engineering', 'Bengaluru', 125000, '2019-03-08'),
(107, 'Pooja Shah', 'HR', 'Mumbai', 60000, '2020-02-01'),
(108, 'Arjun Iyer', 'HR', 'Chennai', 58000, '2022-06-18');

INSERT INTO sales (sale_id, emp_id, sale_date, amount) VALUES
(1, 101, '2026-01-02', 12000),
(2, 101, '2026-01-05', 8000),
(3, 102, '2026-01-03', 15000),
(4, 102, '2026-01-09', 5000),
(5, 103, '2026-01-04', 7000),
(6, 103, '2026-01-10', 11000),
(7, 101, '2026-02-02', 14000),
(8, 102, '2026-02-03', 9000),
(9, 103, '2026-02-05', 13000),
(10, 101, '2026-02-08', 6000),
(11, 102, '2026-02-10', 16000),
(12, 103, '2026-02-12', 4000);

-- over() => ascending order main arrange krke dena;
-- running sum/cumulative sum of salary

select *,
sum(salary) over(order by emp_id) from employees;

select *,
sum(salary) over(order by full_name) from employees;

select *,
sum(salary) over(order by month(hire_date)) from employees;

select *,
sum(salary) over(partition by department order by salary) from employees;

-- windows fuction :- 1. row => give Unique number

select *,
row_number() over(partition by department)
from employees;

select *,
row_number() over(partition by department order by hire_date)
from employees;

-- 2. rank => comparison hoga tab ranking dega ( if the value is same, the ranking will by shared same and skip next rank) 

select *,
rank() over(order by salary)
from employees;

select *,
rank() over(order by hire_date)
from employees;

select *,
rank() over(order by city)
from employees;

-- dense rank , row number , rank; 
-- dense rank => isme rank skip nhi hoti h agr rank same h toh

select *,
dense_rank() over(partition  by department order by salary) from employees;


CREATE DATABASE workshop_db;

USE workshop_db;

CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

INSERT INTO ticket_sales
(sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);


SELECT * FROM events ORDER BY event_id;

SELECT * FROM ticket_sales ORDER BY sale_id;

SHOW TABLES;

-- Find the total quantity sold per event_id.
select event_id,sum(qty)
FROM ticket_sales
GROUP BY event_id;

-- Find the total revenue per event_id.
select event_id,sum(qty*price_per_ticket)
from ticket_sales
group by event_id;

-- Find monthly total revenue (group by month of sale_date).
select month(sale_date) as sale_month, sum(qty * price_per_ticket)
from ticket_sales group by month(sale_date)
order by sale_month;

-- Find the maximum price_per_ticket per event_id.
select event_id,max(price_per_ticket) from ticket_sales
group by event_id order by event_id;

-- Find total revenue per month and ticket_type.   

select month(sale_date) as sale_month,ticket_type,
sum(qty * price_per_ticket) from ticket_sales
group by(sale_date), ticket_type
order by sale_month, ticket_type;

-- List all sales with event_name and sale_date.
select ts.sale_id,e.event_name,ts.sale_date
from ticket_sales ts
join events e on ts.event_id = e.event_id;

-- Show event_name, ticket_type, qty for each sale.
select e.event_name, ts.ticket_type,qty 
from ticket_sales ts
join events e on ts.event_id = e.event_id;

-- Show sales where the event city is Mumbai.
select ts.sale_id,e.event_name,e.city,ts.sale_date
from ticket_sales ts
join events e on ts.event_id = e.event_id
where e.city = "mumbai";

-- Show all events and matching sales.
select e.event_name,ts.sale_id,ts.sale_date
from ticket_sales ts
join events e on ts.event_id = e.event_id;

-- Show distinct event names that have at least one sale.
select distinct e.event_name from events e
join ticket_sales ts
on e.event_id = ts.event_id;

-- Show each sale’s computed revenue with event name.
select ts.sale_id,e.event_name,ts.qty * ts.price_per_ticket
from ticket_sales ts
join events e on ts.event_id = e.event_id;

-- Find total quantity per event_name.
select e.event_name,sum(ts.qty) from events e
join ticket_sales ts
on e.event_id = ts.event_id 
group by e.event_name;

-- Find total VIP revenue per event_name.
select e.event_name,sum(ts.qty * ts.price_per_ticket)
from events e join ticket_sales ts
on e.event_id = ts.event_id where ts.ticket_type = 'VIP'
group by e.event_name;

-- Find monthly revenue per city.
select e.city,month(ts.sale_date) as sale_month,sum(ts.qty *ts.price_per_ticket)
from events e join ticket_sales ts on e.event_id = ts.event_id
group by e.city, month(ts.sale_date)
order by e.city,sale_month;

-- Find total quantity per city and ticket_type.
-- select e.city,ts.ticket_type,sum(ts.qty *ts.price_per_ticket) from events e join ticket_sales ts on e.event_id = ts.event_id;

-- Find sales that happened on the latest sale_date in the table.

-- Find sales where revenue is greater than the overall average sale revenue.
select ts.sale_id, e.event_id,ts.qty * ts.price_per_ticket
from events e join ticket_sales ts
on e.event_id = ts.event_id 
group by ts.sale_id,e.event_id;

-- Find events that have at least one VIP sale.
select e.event_id, e.event_name
from events e join ticket_sales ts
on e.event_id = ts.event_id where ts.ticket_type = 'VIP'
group by e.event_name,e.event_id;

-- TCL :- Transaction control language 
-- Transaction => Set of logical statement ( permanent nhi hai )
-- update 

use regex1;
create table actor_cp2 as select actor_id,first_name from sakila.actor
where actor_id between 1 and 5; 

select * from actor_cp2;
insert into actor_cp2 values(6,'piyush');

-- autocommit => enable
set @@autocommit=1;
select @@autocommit;
insert into actor_cp2 values(9,'testoo');
commit;
rollback;
select * from actor_cp2;

-- Transaction ==> In case , if you run any DML operation or you write down any start transaction word then the transcation will be started. 
-- when my transation automatic stop => when i use command of transaction of " commit " and " rollback " then it will be closed
-- In case we use any DDL , TCL operation then transaction will close.
-- we cam save permanent by puting "commit" statement.

start transaction;
insert into actor_cp2 values(11,'Amazon'); 
select * from actor_cp2;


