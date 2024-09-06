--Title: Data Manipulation Language
--Inserting data into the Products' table
INSERT INTO Products(Product_Id, ProductName, ProductPrice)
VALUES(1, 'Cookies', 10),
(2, 'Candy',5.2);
SELECT *FROM Products

--Inserting data into the Customers' table
INSERT INTO Customers(Customer_Id,CustomerName, CustomerAddress)
VALUES(1, 'Ahmed', 'Tunisia'),
(2, 'Coulibaly', 'Senegal'),
(3, 'Hasen', 'Egypt');
SELECT * FROM Customers
--because of the mistake in one of the customer's name, I will have to update it by renaming the name here
UPDATE Customers
SET CustomerName = 'Hasan'
WHERE CustomerName= 'Hasen'
SELECT * FROM Customers

--Inserting data into the orders' table
INSERT INTO Orders(Order_Id, Customer_Id, Product_Id, Quantity, Order_date)
VALUES(1, 1, 2, 3, '2023-01-22'),
(2, 2, 1, 10, '2023-04-14');
SELECT * FROM Orders

--Updating the quantity of the 2nd order, the new value will be 6
UPDATE Orders
SET Quantity = 6
WHERE Order_Id = 2;
SELECT * FROM Orders

--Deleting the 3rd customer from the customers' table
DELETE FROM Customers
WHERE Customer_Id =3
SELECT * FROM Customers

--Deleting the orders' table content then dropping the table
--To delete orders' table content, I am going to delete it one by one. But to drop the order table means I will delete the table at once.
--To delete the order table content
DELETE Orders
WHERE Order_Id = 1
--To drop the table
DROP TABLE Orders
