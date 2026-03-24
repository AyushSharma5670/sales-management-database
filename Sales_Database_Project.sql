CREATE DATABASE SalesDB;

USE SalesDB;

CREATE TABLE Products
(
Product_ID INT PRIMARY KEY,
Product_Name VARCHAR(50) NOT NULL,
Category VARCHAR(50) NOT NULL,
Price INT 
);

INSERT INTO Products VALUES
(1,'Laptop','Electronics',60000),
(2,'Mobile','Electronics',20000),
(3,'Tablet','Electronics',30000),
(4,'Headphones','Accessories',3000),
(5,'Keyboard','Accessories',1500),
(6,'Mouse','Accessories',800),
(7,'Monitor','Electronics',15000),
(8,'Printer','Electronics',12000),
(9,'Smartwatch','Electronics',10000),
(10,'Speaker','Accessories',2500);

CREATE TABLE Customers
(
Customer_ID INT PRIMARY KEY,
Customer_Name VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
(101,'Rahul','Delhi'),
(102,'Amit','Mumbai'),
(103,'Priya','Indore'),
(104,'Sneha','Bhopal'),
(105,'Arjun','Pune'),
(106,'Neha','Jaipur'),
(107,'Rohan','Lucknow'),
(108,'Kavita','Ahmedabad'),
(109,'Vikas','Chennai'),
(110,'Anjali','Kolkata');

CREATE TABLE Sales
(
Sales_ID INT PRIMARY KEY,
Product_ID INT,
Customer_ID INT,
Quantity INT,
Sales_Data DATE
);

INSERT INTO Sales VALUES
(1,1,101,2,'2024-02-10'),
(2,2,102,1,'2024-02-11'),
(3,3,103,3,'2024-02-12'),
(4,4,104,2,'2024-02-13'),
(5,5,105,4,'2024-02-14'),
(6,6,106,5,'2024-02-15'),
(7,7,107,1,'2024-02-16'),
(8,8,108,2,'2024-02-17'),
(9,9,109,1,'2024-02-18'),
(10,10,110,3,'2024-02-19'),
(11,1,102,1,'2024-02-20'),
(12,2,103,2,'2024-02-21'),
(13,3,104,1,'2024-02-22'),
(14,4,105,3,'2024-02-23'),
(15,5,106,2,'2024-02-24'),
(16,6,107,4,'2024-02-25'),
(17,7,108,2,'2024-02-26'),
(18,8,109,1,'2024-02-27'),
(19,9,110,2,'2024-02-28'),
(20,10,101,1,'2024-03-01');

CREATE TABLE Inventory
(
Product_ID INT, 
Stock INT
);

INSERT INTO Inventory VALUES
(1,10),
(2,15),
(3,7),
(4,20),
(5,25),
(6,30),
(7,12),
(8,8),
(9,14),
(10,18);

ALTER TABLE Sales
ADD FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID);

ALTER TABLE Sales
ADD FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);


SELECT Product_Name, Price
FROM Products;

SELECT *
FROM Products
WHERE Price > 25000;

SELECT SUM(Quantity) AS Total_Sales
FROM Sales;

SELECT AVG(Price) AS Average_Price
FROM Products;

SELECT COUNT(Customer_ID) AS Total_Customers
FROM Customers;

SELECT Product_ID, SUM(Quantity) AS Total_Quantity
FROM Sales
GROUP BY Product_ID;

SELECT Customer_ID, SUM(Quantity) AS Total_Purchases
FROM Sales
GROUP BY Customer_ID;

SELECT P.Product_Name, S.Quantity
FROM Products P
JOIN Sales S
ON P.Product_ID = S.Product_ID;

SELECT C.Customer_Name, P.Product_Name, S.Quantity
FROM Sales S
JOIN Customers C
ON S.Customer_ID = C.Customer_ID
JOIN Products P
ON S.Product_ID = P.Product_ID;

SELECT *
FROM Inventory
WHERE Stock < 10;

SELECT P.Product_Name, I.Stock
FROM Products P
JOIN Inventory I
ON P.Product_ID = I.Product_ID;

select Product_ID, SUM(Quantity) AS Total_Sales from Sales group by Product_ID;


SELECT c.Customer_Name, p.Product_Name, s.Quantity
FROM Sales s
JOIN Customers c ON s.Customer_ID = c.Customer_ID
JOIN Products p ON s.Product_ID = p.Product_ID;

SELECT Product_ID, SUM(Quantity) AS Total
FROM Sales
GROUP BY Product_ID
ORDER BY Total DESC
LIMIT 1;