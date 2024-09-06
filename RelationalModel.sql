CREATE DATABASE RelationalModel
USE RelationalModel
--1)Convert the given ERD into a relatinal model
--2)the Relational Models are Table 1: Wine(Wine_id,NumW, Category, Quantity,Year, Degree), Table 2: Producer(Producer_id,NumP, FirstName, LastName, Region) Table 3:Harvest(harvest_id,wine_id, producer_id and quantity)
--3)Inserting data into the database. Firstly, creating the tables(Wine table, Producer table and Harvest table), then, inserting data into the tables
CREATE TABLE Wine(
	Wine_id INTEGER PRIMARY KEY NOT NULL,
	NumW INT NOT NULL,
	Category VARCHAR(30) NOT NULL,
	Quantity DECIMAL (10,02)CHECK(quantity>0) NOT NULL,
	Wine_year DATE NOT NULL,
	Degree DECIMAL(20,02) NOT NULL,);
	
CREATE TABLE Producer(
	Producer_id INTEGER PRIMARY KEY NOT NULL,
	NumP INTEGER NOT NULL,
	FirstName VARCHAR(15) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Region VARCHAR (25) NOT NULL);
	

CREATE TABLE Harvest(
	Harvest_id INTEGER PRIMARY KEY NOT NULL,
	Wine_id INTEGER NOT NULL,
	Producer_id INTEGER NOT NULL,
	Quantity DECIMAL (10,02)CHECK(quantity>0) NOT NULL,
	FOREIGN KEY (Wine_id) REFERENCES Wine(Wine_id),
	FOREIGN KEY (Producer_id) REFERENCES Producer(Producer_id))
	SELECT * FROM Harvest;
	
	
INSERT INTO Wine(Wine_id, NumW, Category, Quantity, Wine_year, Degree)
VALUES(1,1,'Rosé', 115,'1995',10),
(2, 2, 'Cava', 120, '1996',11),
(3, 3, 'Riesling', 125, '1997', 12),
(4, 4, 'Red wines', 130, '1998',13),
(5,5,'White wine', 335, '1999',14),
(6, 6, 'Pinot Noir', 140, '2000',15),
(7, 7, 'Ice Wine',245,'2001', 16),
(8, 8,'Chardonnay', 150, '2002', 17),
(9, 9, 'Pinot Grigio', 355,'2003',18),
(10, 10, 'Native American Wines',360, '2004',19),
(11, 11, 'Dessert wine', 165, '2005', 20),
(12, 12, 'Sparkling wine', 270, '2006',25),
(13, 13, 'Red wines', 375,'2007', 30),
(14, 14,'Rosé',80,'2008',335),
(15, 15, 'Fortified Wines',185, '2009',50),
(16, 16,'Ice Wine', 290, '2010',45),
(17, 17, 'Native American Wines',295,'2011',50),
(18, 18, 'Ice Wine',100, '2012', 55),
(19, 19, 'Brandy', 305, '2013', 60),
(20, 20, 'Fruit Wines',110, '2014',65),
(21, 21, 'Sparkling wine', 215,'2015',70),
(22, 22, 'Cava',120, '2016',375),
(23, 23, 'Rosé',300, '2017',180),
(24,24, 'Red wines', 230, '2018',85),
(25, 25,'Muscat Varietals',235, '2019',90),
(26, 26, 'Spanish White',340, '2020',95),
(27,27,'Red wines', 145,'2021',100),
(28, 28, 'Riesling',147,'2022', 105),
(29, 29, 'Cava', 149,'2023',109),
(30,30, 'Red wines', 350,'2024',112);
SELECT * FROM WINE


INSERT INTO Producer(Producer_id, NumP, FirstName, LastName,Region)
VALUES(1, 1, 'Mayor', 'Omo','Gabes'),
(2,2, 'Anu','Bambs', 'Kairouan'),
(3, 3, 'Gloria','Okez','Tunis'),
(4, 4 ,'Faith', 'Jaye', 'Bizerte'),
(5, 5, 'Topsy','Adex', 'Sousse'),
(6,6,'Star','Arya', 'Zarzis'),
(7, 7,'Simi','Ajisx', 'Ariana'),
(8, 8, 'Ope','Ajif', 'Gafsa'),
(9, 9, 'Ty', 'Owoz','Zarzis'),
(10, 10, 'Love', 'Banz', 'Korba'),
(11, 11, 'Kayode', 'Tobi', 'Douz'),
(12, 12, 'Waiz', 'Labi','Tozeur'),
(13, 13, 'Benson','Chad',  'Qibilī'),
(14, 14, 'Wasabi','Layi','Mnihla'),
(15,15, 'Jason', 'Lake', 'Hammamet'),
(16, 16, 'Ay','Tega','Beja'),
(17, 17, 'Zech', 'Psalm', 'Sousse'),
(18, 18, 'Genice', 'Olowo', 'Houmt Souk'),
(19, 19, 'Marvel','JT', 'Korba'),
(20, 20, 'Eni','Amor', 'Medenine'),
(21, 21, 'Eri', 'Mend', 'Carthage'),
(22, 22, 'Lydia', 'Sam', 'Houmt Souk'),
(23, 23, 'Angel', 'Tea',  'Sousse'),
(24, 24, 'Joy', 'Palmz', 'Sabibah'),
(25, 25, 'Liberty', 'Princess', 'Jemmal'),
(26, 26, 'Prince', 'Oye','La Marsa'),
(27, 27, 'Praise', 'Femi', 'Sidi Bouzid'),
(28, 28, 'Mike', 'Ades',  'Al-Rudayyif'),
(29, 29, 'Khalifa', 'Muheez', 'Kasserine'),
(30, 30, 'Papidee', 'Olowos', 'Hammam-Lif');
SELECT * FROM Producer

INSERT INTO Harvest(Harvest_id, Wine_id, Producer_id,Quantity)
VALUES (1, 1,1,115),
(2,2,2,120),
(3,3,3,125),
(4,4,4,130),
(5,5,5,335),
(6,6,6,140),
(7,7,7,245),
(8,8,8,150),
(9,9,9,355),
(10,10,10, 360),
(11,11,11,165),
(12, 12,12, 270),
(13,13,13, 375),
(14,14,14, 80),
(15,15,15,185),
(16,16,16,290),
(17,17,17, 295),
(18,18,18, 100),
(19,19,19, 305),
(20,20,20, 110),
(21,21,21,215),
(22,22,22,120),
(23,23,23,300),
(24,24,24, 230),
(25,25,25, 235),
(26,26,26, 340),
(27,27,27, 145),
(28,28,28, 147),
(29,29,29, 149),
(30,30,30, 350);
SELECT * FROM Harvest

--4) The list of the producer
SELECT * FROM Producer

--5) The list of producers sorted by names
SELECT * FROM Producer
ORDER BY (FirstName),(LastName);

--6)the list the producers of Sousse
SELECT * FROM Producer
WHERE Region= 'Sousse'

--7) the total quantity of wine produced having the number 12
---firstly, i will calculate the total number of wines produced
--Secondly, i will get the total quantity of wine produced in row 12
SELECT 
SUM(WINE.quantity) AS total_quantity_produced
FROM WINE
WHERE Wine_id=12
GROUP BY Wine_id;

--8)calculate the quantity of wine produced by category
SELECT Category, SUM(WINE.quantity) AS total_quantity_produced
FROM
WINE
GROUP BY WINE.Category;

--9)Producers in Sousse region that have harvested at least 1 wine in quantities greater than 300 liters.
--The producers name will also be in alphabetial order.
SELECT FirstName,LastName
FROM producer
INNER JOIN harvest ON Producer.Producer_id=Harvest.Producer_id
WHERE Producer.Region= 'Sousse' AND Harvest.Quantity>=300
ORDER BY FirstName,LastName DESC;

--10) The wine numbers that have a degree greater than 12
--and that have been produced by producer number 24
--Firstly, join all the tables that are related
SELECT Harvest.Harvest_id,
Wine.NumW, Wine.Degree,
Producer.Producer_id, Producer.FirstName, Producer.LastName,
Harvest.Quantity
FROM Harvest
INNER JOIN Wine ON
Harvest.Wine_id=Wine.Wine_id
INNER JOIN Producer ON
Harvest.Producer_id=Producer.Producer_id
--after joining the tables, i will use the result to get the wine numbers that have a degree greater than 12 and that have been produced by producer number 24
SELECT Harvest.Harvest_id,
Wine.NumW, Wine.Degree,
Producer.Producer_id, Producer.FirstName, Producer.LastName,
Harvest.Quantity
FROM Harvest
INNER JOIN Wine ON
Harvest.Wine_id=Wine.Wine_id
INNER JOIN Producer ON
Harvest.Producer_id=Producer.Producer_id
WHERE WINE.Degree >12 AND Producer.Producer_id=24
