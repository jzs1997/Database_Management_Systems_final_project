-- DROP DATABASE project;

CREATE DATABASE project;
USE project;

-- CREATE SCHEMA project_schema;
-- DROP TABLE orders;
-- DROP TABLE staffs;
-- DROP TABLE items;
-- DROP TABLE payments;
-- DROP TABLE customers;
-- DROP TABLE feedbacks;

CREATE TABLE categories(
category_id INTEGER NOT NULL,
category_name VARCHAR(255),
PRIMARY KEY(category_id)
);


CREATE TABLE items(
item_id INTEGER,
item_price DOUBLE,
item_name VARCHAR(255),
item_remains INTEGER,
category_id INTEGER,
PRIMARY KEY(item_id),
FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers(
customer_id INTEGER,
customer_last_name VARCHAR(255),
customer_first_name VARCHAR(255),
PRIMARY KEY(customer_id)
);


CREATE TABLE staffs(
staff_id INTEGER NOT NULL,
staff_name VARCHAR(255),
PRIMARY KEY(staff_id)
);


CREATE TABLE orders(
id INTEGER NOT NULL,
order_id INTEGER NOT NULL,
item_id INTEGER,
customer_id INTEGER,
units INTEGER,
payment_id INTEGER,
order_type VARCHAR(255),
ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
staff_id INTEGER,
PRIMARY KEY(id),
FOREIGN KEY(staff_id) REFERENCES staffs(staff_id),
FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
FOREIGN KEY(item_id) REFERENCES items(item_id)
);

-- ALTER TABLE orders ADD COLUMN id INTEGER FIRST;
-- ALTER TABLE orders MODIFY order_id INTEGER NOT NULL;
-- ALTER TABLE orders DROP PRIMARY KEY;
-- ALTER TABLE orders ADD PRIMARY KEY(id);

CREATE TABLE payments(
payment_id INTEGER,
payment_amount DOUBLE,
customer_id INTEGER,
PRIMARY KEY(payment_id),
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE feedbacks(
feedback_id INTEGER,
rating INTEGER,
staff_id INTEGER NOT NULL,
order_id INTEGER,
PRIMARY KEY(feedback_id),
FOREIGN KEY(staff_id) REFERENCES staffs(staff_id)
);

INSERT INTO categories(category_id, category_name)
VALUES
(1, 'Beverage'),
(2, 'Bread & Bakery'),
(3, 'Dairy, Eggs & Cheese'),
(4, 'Cookies, Snacks & Candy'),
(5, 'Frozen Foods'),
(6, 'Fruits & Vegetables'),
(7, 'Meat & Seafood');

INSERT INTO staffs(staff_id, staff_name)
VALUES
(1, 'Oliver Smith'),
(2, 'Lucas Miller'),
(3, 'William Garcia'),
(4, 'Jackson Davis'),
(5, 'Levi Martinez'),
(6, 'Brown Mateo');

-- ALTER TABLE customers RENAME COLUMN costomer_last_name TO customer_last_name;

INSERT INTO customers(customer_id, customer_last_name, customer_first_name)
VALUES
(1, 'Baker', 'Emma'),
(2, 'Clark', 'Charlotte'),
(3, 'Kelly', 'Amelia'),
(4, 'Taylor', 'Luna'),
(5, 'Walker', 'Emily'),
(6, 'Smith', 'Leo'),
(7, 'Davis', 'Dylan'),
(8, 'Miller', 'Lincoln'),
(9, 'Martinez', 'Jayden'),
(10, 'Jones', 'Julia'),
(11, 'Begay', 'Maverick'),
(12, 'Chatto', 'Thomas');

INSERT INTO items(item_id, item_price, item_name, item_remains, category_id)
VALUES
(1, 1.39, 'CRYSTAL GEYSER ALPINE SPRING WATER', 100, 1),
(2, 2.00, 'Coca Cola', 200, 1),
(3, 3.99, 'Starbucks Coffee', 200, 1),
(4, 3.49, 'OROWEAT COUNTRY STYLE WHITE BREAD', 1000, 2),
(5, 6.99, 'GRADE AA extra large eggs 12', 500, 3),
(6, 0.99, 'PEACH WHITE', 300, 6),
(7, 4.99, 'THAI STYLE FRED RICE', 1000, 5),
(8, 3.99, 'HUNGER MAN TURKEY MEAL', 600, 5),
(9, 5.99, 'CURRY RICE', 20, 5),
(10, 11.49, 'FROZEN TENDER CHIKEN BREASTS', 500, 5),
(11, 5.00, 'KASHI CHOCOLATE ALMOND BUTTER', 800, 4),
(12, 25.13, 'USDA CHOICE STEAK VALUE PACK', 1000, 7),
(13, 5.99, 'GOLDEN POTATOS', 500, 6),
(14, 5.00, 'SHRIMP COOKED', 700, 7),
(15, 6.49, 'OREO DOUBLE STUF', 1000, 4),
(16, 2.00, 'PEPSI', 400, 1),
(17, 1.29, 'BLACK TEA', 600, 1),
(18, 3.49, 'GARLIC BREAD', 700, 2),
(19, 2.00, 'COUNTYSIDE CHEESE', 600, 3),
(20, 1.19, 'SODA WAHTER', 500, 1);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv' 
INTO TABLE orders 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/feedback.csv' 
INTO TABLE feedbacks 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM feedbacks;
SELECT * FROM orders;

ALTER TABLE orders ADD FOREIGN KEY(item_id) REFERENCES items(item_id);
ALTER TABLE payments ADD COLUMN customer_id INTEGER;
ALTER TABLE payments ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);
ALTER TABLE orders ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

-- Analysis

-- Compute payment and insert them into table payment
-- select item price from item and compute total price for each order
INSERT INTO payments
SELECT payment_id, price, customer_id
FROM 
(SELECT SUM(item_price * units) AS price, payment_id, customer_id
FROM
	(SELECT 
	items.item_price, orders.units, orders.payment_id, orders.customer_id
	FROM orders
	LEFT JOIN items
	ON orders.item_id = items.item_id) AS tmp
GROUP BY payment_id) AS total_payment;

SELECT * FROM payments;

-- Payments on a daily basis
SELECT date, ROUND(SUM(payment_amount), 2) AS daily_sales
FROM
(SELECT DISTINCT(payments.payment_amount), DATE_FORMAT(orders.ts, '%m-%d') as date
FROM orders
RIGHT JOIN payments
ON orders.payment_id = payments.payment_id) AS tmp
GROUP BY date
ORDER BY date;

--  Popular items
SELECT items.item_name, COUNT(items.item_name) as monthly_sales 
FROM orders
LEFT JOIN items
ON orders.item_id = items.item_id
GROUP BY orders.item_id
ORDER BY monthly_sales
DESC;

--  customers who consume most in this store
SELECT customer_name, ROUND(SUM(units * item_price), 2) AS total_amount
FROM
(SELECT orders.*, 
concat_ws(' ', customers.customer_first_name, customers.customer_last_name) 
as customer_name, items.item_price 
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN items ON orders.item_id = items.item_id) AS tmp
GROUP BY customer_name
ORDER BY total_amount DESC;


--  staffs' ranking according to the ratings from feedback
SELECT staffs.staff_name, AVG(feedbacks.rating) AS average_ratings
FROM feedbacks
LEFT JOIN staffs
ON feedbacks.staff_id = staffs.staff_id
GROUP BY staffs.staff_name
ORDER BY average_ratings DESC;

-- Which order type are preferred? Pick up or Delivery? -> without join in
SELECT order_type, COUNT(order_type) AS counts
FROM (
SELECT order_type, order_id
FROM orders
GROUP BY order_id
) as tmp
GROUP BY order_type;

-- which categories are welcomed
SELECT categories.category_name, COUNT(categories.category_name) AS counts
FROM categories
RIGHT JOIN items ON categories.category_id = items.category_id
RIGHT JOIN orders ON orders.item_id = items.item_id
GROUP BY categories.category_name
ORDER BY counts DESC;

-- sum of payments on different types of orders
SELECT tmp1.order_type, ROUND(SUM(payments.payment_amount), 2) AS sales_amount
FROM payments
INNER JOIN 
(SELECT payment_id, order_type
FROM orders
GROUP BY order_id) AS tmp1
ON payments.payment_id = tmp1.payment_id
GROUP BY tmp1.order_type;

-- Trigger

-- Trigger, when new order inserted, will reduce the conressponding items' inventory 
CREATE TRIGGER inventory_calculation
BEFORE INSERT ON orders
FOR EACH ROW
UPDATE items SET item_remains = item_remains - NEW.units WHERE item_id = NEW.item_id;

INSERT INTO orders(id, order_id, item_id, customer_id, units, payment_id, order_type, ts, staff_id)
VALUES
(207, 111, 3, 1, 1, 123, 'Pickup', NOW(), 4);

SELECT * FROM items;
-- Procedure: staff monthly service frequency counts

DELIMITER //
CREATE PROCEDURE staffServiceFreqDaily(staff VARCHAR(255))    
BEGIN
	SELECT staff_name, COUNT(order_type) AS counts, order_type
	FROM
		(SELECT orders.order_type, orders.order_id, orders.staff_id, orders.ts, staffs.staff_name
		FROM orders
		LEFT JOIN staffs ON orders.staff_id = staffs.staff_id
		GROUP BY orders.order_id) AS tmp1
	GROUP BY staff_id, order_type
    HAVING tmp1.staff_name = staff;
END//

CALL staffServiceFreqDaily('Oliver Smith');

SHOW TRIGGERS;
-- DROP TRIGGER inventory_calculation;

select * from orders;
SELECT * FROM payments;
SELECT * FROM staffs;



SELECT * FROM items;
