--1
CREATE DATABASE lab5;

--2
CREATE TABLE salesmans(
    salesman_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission REAL
);


CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INTEGER,
    salesman_id INTEGER,
    FOREIGN KEY (salesman_id) REFERENCES salesmans(salesman_id)
);


CREATE TABLE orders(
    ord_no INTEGER PRIMARY KEY,
    purch_amt REAL,
    ord_date DATE,
    customer_id INTEGER ,
    salesman_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesmans(salesman_id)
);

INSERT INTO salesmans
VALUES (5001, 'James Hoog', 'New York', 0.15),
       (5002, 'Nail Knite', 'Paris', 0.13),
       (5005, 'Pit Alex', 'London', 0.11),
       (5006, 'Mc Lyon', 'Paris', 0.14),
       (5003, 'Lauson Hen', default, 0.12),
       (5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
       (3005, 'Graham Zusi', 'California', 200, 5002),
       (3001, 'Brad Guzan', 'London', default, 5005),
       (3004, 'Fabian Johns', 'Paris', 300, 5006),
       (3007, 'Brad Davis', 'New York', 200, 5001),
       (3009, 'Geoff Camero', 'Berlin', 100, 5003),
       (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders
VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
       (70009, 270.65, '2012-09-10', 3001, 5005),
       (70002, 65.26, '2012-10-05', 3002, 5001),
       (70004, 110.5, '2012-08-17', 3009, 5003),
       (70007, 948.5, '2012-09-10', 3005, 5002),
       (70005, 2400.6, '2012-07-27', 3007, 5001),
       (70008, 5760, '2012-09-10', 3002, 5001);

select * from salesmans;
select * from customers;
select * from orders;

-- 3
select sum(purch_amt) from orders;

-- 4
select avg(purch_amt) from orders;

-- 5
select count(cust_name) from customers
where cust_name is not null;

-- 6
select min(purch_amt) from orders;

-- 7
select cust_name from customers
where cust_name like 'q%';

-- 8
select ord_no from orders
where customer_id in (select customer_id from customers where city = 'New York');

-- 9
select * from customers
where customer_id in (select customer_id from orders where purch_amt > 10);

-- 10
select sum(grade) from customers;

-- 11
select * from customers
where cust_name is not null;

-- 12
select max(grade) from customers;



