--TITLE: DATA DEFINITION LANGUAGE CHECKPOINT
--Creating a new database called Check_Point

CREATE DATABASE Check_Point

--Creating a table called Customers' table
CREATE TABLE Customers(
	Customer_Id INT PRIMARY KEY,
	CustomerName VARCHAR (50) NOT NULL,
	CustomerAddress VARCHAR (60) NOT NULL,);
SELECT * FROM Customers

--Creating a table called Products' table
CREATE TABLE Products(
	Product_Id INTEGER PRIMARY KEY,
	ProductName VARCHAR (50) NOT NULL,
	ProductPrice DECIMAL(20,01) CHECK (ProductPrice>0) NOT NULL);
SELECT * FROM Products

--Creating a table called Orders' table
CREATE TABLE Orders(
	Order_Id INTEGER PRIMARY KEY,
	Customer_Id INTEGER FOREIGN KEY REFERENCES Customers (Customer_Id) NOT NULL,
	Product_Id INTEGER FOREIGN KEY REFERENCES Products (Product_Id) NOT NULL,
	Quantity INTEGER NOT NULL,
	Order_date DATE NOT NULL);
SELECT * FROM Orders




