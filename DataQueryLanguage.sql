--Title: Data Query Language Checkpoint
--Creating a Customers' table
CREATE TABLE Customer(
	Customer_id INTEGER PRIMARY KEY,
	customer_Name VARCHAR (10) NOT NULL,
	customer_Tel VARCHAR (20) CHECK (customer_Tel LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'));
SELECT * FROM Customer

--Creating a Product's table
CREATE TABLE Product(
	Product_id INTEGER PRIMARY KEY,
	product_name VARCHAR (20)NOT NULL,
	price DECIMAL (20,01)CHECK(price>0) NOT NULL);
SELECT * FROM Product

--Creating Orders' table
CREATE TABLE Orders(
	Orders_id INTEGER PRIMARY KEY,
	Customer_id INTEGER FOREIGN KEY REFERENCES Customer(Customer_id) NOT NULL,
	Product_id INTEGER FOREIGN KEY REFERENCES Product(product_id) NOT NULL,
	OrderDate DATE NOT NULL,
	quantity INTEGER NOT NULL,
	total_amount INTEGER NOT NULL);
SELECT * FROM Orders
DROP TABLE Orders
--DELETING THE total_amount column
ALTER TABLE Orders
DROP COLUMN total_amount;

--2)Inserting data into the Customer's table
INSERT INTO Customer(Customer_id, customer_Name, customer_Tel)
VALUES (1, 'Ahmed', '128-653-7789'),
(2, 'Coulibaly', '543-436-7891'),
(3, 'Hasan', '089-756-4231');
SELECT * FROM  Customer
--RENAMING THE CUSTOMERS' NAME
UPDATE Customer
SET customer_Name = 'Alice'
WHERE customer_Name = 'Ahmed'
SELECT * FROM Customer
UPDATE Customer
SET customer_Name = 'Bob'
WHERE customer_Name = 'Coulibaly'
SELECT * FROM Customer
UPDATE Customer
SET customer_Name = 'Charlie'
WHERE customer_Name = 'Hasan'
SELECT * FROM Customer

--Inserting data into the Product's table
INSERT INTO Product(Product_id, product_name, price)
VALUES(1, 'Widget', 10),
(2, 'Gadget',  20),
(3, 'Doohickey', 15);
SELECT * FROM Product

--Inserting data into the Orders' table
INSERT INTO Orders(Orders_id, Customer_id, Product_id, OrderDate, quantity)
VALUES(1, 1, 1, '2021-01-01', 10),
(2, 1, 2, '2021-01-02', 5),
(3, 2, 1, '2021-01-03', 3),
(4, 2, 2, '2021-01-04', 7),
(5, 3, 1, '2021-01-05', 2),
(6, 3, 3, '2021-01-06', 3);
SELECT * FROM Orders

-----3)A query to retrieve the names of customers who have placed an order for at least one widget and one gadget
--along with the total cost of the wigets and gadgets ordered by each customer. The cost of each item should be calculated by multiplying the quantity by the price of the product
--Firstly,JOINING OF THE 3 TABLES

SELECT Orders.Orders_id, quantity,
Customer.customer_Name,
Product.product_name,price,
Orders.OrderDate
FROM Orders
INNER JOIN Customer ON
Orders.Customer_id = Customer.Customer_id
INNER JOIN Product ON
Orders.Product_id = Product.Product_id

--Multiplication of the quantity and product from 2 different tables using the result of the inner join
SELECT
Orders.Orders_id, quantity,
Customer.customer_Name,
Product.product_name,price,
Orders.OrderDate,
Orders.quantity * Product.price AS total_amount 
FROM Orders
INNER JOIN Customer ON
Orders.Customer_id = Customer.Customer_id
INNER JOIN Product ON
Orders.Product_id = Product.Product_id

--Customers that have at least one widget and one gadget along with the total cost of the products
SELECT
Orders.Orders_id, quantity,
Customer.customer_Name,
Product.product_name,price,
Orders.OrderDate,
Orders.quantity * Product.price AS total_amount
FROM Orders
INNER JOIN Customer ON
Orders.Customer_id = Customer.Customer_id
INNER JOIN Product ON
Orders.Product_id = Product.Product_id
WHERE product_name IN ('Widget','Gadget') AND quantity >=1

--4.Customers that have placed an order for at least one widget, along with the total cost of the widgets ordered by each customer
SELECT
Orders.Orders_id, quantity,
Customer.customer_Name,
Product.product_name,price,
Orders.OrderDate,
Orders.quantity * Product.price AS total_amount
FROM Orders
INNER JOIN Customer ON
Orders.Customer_id = Customer.Customer_id
INNER JOIN Product ON
Orders.Product_id = Product.Product_id
WHERE product_name = 'Widget' AND quantity >=1
ORDER BY customer_Name

--5) Customers that have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer
SELECT
Orders.Orders_id, quantity,
Customer.customer_Name,
Product.product_name,price,
Orders.OrderDate,
Orders.quantity * Product.price AS total_amount
FROM Orders
INNER JOIN Customer ON
Orders.Customer_id = Customer.Customer_id
INNER JOIN Product ON
Orders.Product_id = Product.Product_id
WHERE product_name = 'Gadget' AND quantity >=1
ORDER BY customer_Name

--6)Customers that have placed an order for at least one Doohickey with the total cost of the Doohickey ordered by each customer
SELECT
Orders.Orders_id, quantity,
Customer.customer_Name,
Product.product_name,price,
Orders.OrderDate,
Orders.quantity * Product.price AS total_amount
FROM Orders
INNER JOIN Customer ON
Orders.Customer_id = Customer.Customer_id
INNER JOIN Product ON
Orders.Product_id = Product.Product_id
WHERE product_name = 'Doohickey' AND quantity >=1
ORDER BY customer_Name
--- 7)A query to retrieve the total number of widget and gadget by each customer along with the total cost of the orderSELECT * FROM Customer AS CINNER JOIN Orders AS OON C.Customer_id = O.Customer_idINNER JOIN Product AS PON O.Product_id = P.Product_idSELECT *, O.quantity * P.price As total_cost FROM Customer AS CINNER JOIN Orders AS OON C.Customer_id = O.Customer_idINNER JOIN Product AS PON O.Product_id = P.Product_idSELECT C.customer_Name, COUNT(*) AS Total_count, O.quantity * P.price As total_cost FROM Customer AS CINNER JOIN Orders AS OON C.Customer_id = O.Customer_idINNER JOIN Product AS PON O.Product_id = P.Product_idWHERE P.product_name IN('Widget', 'Gadget')GROUP BY C.customer_Name, P.price, O.quantity
--8) A query to retrieve the names of the products that have been ordered 
--by at least one customer, along with the total quantity of each products ordered
SELECT Product.product_name,
SUM (Orders.quantity) AS total_quantity
FROM Product
JOIN Orders
ON Orders.Product_id = Product.Product_id
GROUP BY Product.product_name
HAVING SUM (Orders.quantity)>=1;

--9)A query to retrieve the names of the customers who have placed the most orders,
--along with the total number of orders placed by each customer
SELECT Customer.customer_Name, COUNT (Orders_id) AS Total_orders
FROM Customer
JOIN Orders 
ON Customer.Customer_id =Orders.Customer_id
GROUP BY Customer.customer_Name
ORDER BY Total_orders DESC;
--according  to the result in number 9. All customers placed the same number of orders, so, there is no customer that placed the most orders.

--10) A query to retrieve the names of the products that have been ordered the most, 
--along with the total quantity of each product ordered
SELECT Product.product_name,
SUM(Orders.quantity) AS Total_quantity
FROM Product
JOIN Orders
ON Product.Product_id =Orders.Product_id
GROUP BY Product.product_name
ORDER BY Total_quantity DESC;

--11) A query to retrieve the names of the customers who have placed an order on everyday of the week,
--along with the total number of orders placed by each customer
SELECT Customer.customer_Name, 
COUNT (DISTINCT Orders.Orders_id) AS TotalDayOrders
FROM Customer
JOIN Orders 
ON Customer.Customer_id = Orders.Customer_id
GROUP BY Customer.customer_Name
HAVING COUNT (DISTINCT DATEPART(weekday, Orders.OrderDate))=7
--the result below shows that there are no customer(s) that placed an order on everyday of the week