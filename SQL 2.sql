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

-- Find events that have at least one VIP sale.
select e.event_id, e.event_name
from events e join ticket_sales ts
on e.event_id = ts.event_id where ts.ticket_type = 'VIP'
group by e.event_name,e.event_id;