USE project;

SELECT * FROM orders;


-- item_id 1~6
-- 


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

-- 2
INSERT INTO categories(category_id, category_name)
VALUES
(1, 'Beverage'),
(2, 'Bread & Bakery'),
(3, 'Dairy, Eggs & Cheese'),
(4, 'Cookies, Snacks & Candy'),
(5, 'Frozen Foods'),
(6, 'Fruits & Vegetables'),
(7, 'Meat & Seafood');

-- 1
INSERT INTO staffs(staff_id, staff_name)
VALUES
(1, 'Oliver Smith'),
(2, 'Lucas Miller'),
(3, 'William Garcia'),
(4, 'Jackson Davis'),
(5, 'Levi Martinez'),
(6, 'Brown Mateo');


-- 3
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


-- 4
INSERT INTO payments(payment_id, payment_amount)
VALUES
(1, ),
(2, ),
(3, ),
(4, ),
(5, ),
(6, ),
(7, ),
(8, ),
(9, ),
(10, ),
(11, ),
(12, ),
(13, ),
(14, ),
(15, ),
(16, ),
(17, ),
(18, ),
(19, ),
(20, );


INSERT INTO oreders(id, order_id, item_id, customer_id, units, payment_id, order_type, ts, staff_id)
VALUES
(133, 1, ),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
();