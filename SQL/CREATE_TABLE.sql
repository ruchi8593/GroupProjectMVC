--Create Database

CREATE DATABASE MVCDatabase 


---create person table

CREATE TABLE Person
(
	PersonID	INT PRIMARY KEY ,
	FirstName	VARCHAR(25) NOT NULL,
	LastName	VARCHAR(25) NOT NULL,
	Age			INT,
	EmailID		VARCHAR(25),
	Gender		VARCHAR(25),
	AddressID	INT FOREIGN KEY REFERENCES Address(AddressID)
	);

---create Address table

CREATE TABLE Address(
	AddressID		INT PRIMARY KEY ,
	Address			VARCHAR(25) NOT NULL,
	City			VARCHAR(25) NOT NULL,
	PostalCode		VARCHAR(25) NOT NULL,
	ProvinceID		INT FOREIGN KEY REFERENCES Province(ProvinceID) 
	);

---create Province table


CREATE TABLE Province(
	ProvinceID				INT	PRIMARY KEY,
	ProvinceName			VARCHAR(25),
	ProvinceAbbreviation	VARCHAR(25)
	);
	
	

---Person Table Value


INSERT INTO MVCDatabase.dbo.Person  ( PersonID, FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES (1, 'Niruxa', 'Padhiyar', 24, 'nilipadhiyar293@gmail.com', 'FeMale' , 1 );

INSERT INTO MVCDatabase.dbo.Person ( PersonID, FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES (2, 'Ruchi', 'Trivedi', 26, 'ruchitrivedi@gmail.com', 'FeMale' , 2);

INSERT INTO MVCDatabase.dbo.Person  ( PersonID, FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES (3, 'Vivek', 'Kathiriya', 24, 'vivekkathiriya@gmail.com', 'Male' , 3);

INSERT INTO MVCDatabase.dbo.Person  ( PersonID, FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES (4, 'Urvashi', 'Kapadiya', 26, 'urvashikapadiya@gmail.com', 'FeMale' , 4);

INSERT INTO MVCDatabase.dbo.Person  ( PersonID, FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES (5, 'Nirav', 'Patel', 28, 'niravpatel@gmail.com', 'Male' , 5 );

INSERT INTO MVCDatabase.dbo.Person  ( PersonID, FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES (6, 'Harsh', 'Patel', 25, 'harshpatel@gmail.com', 'Male' , 6 );

----Address Table Value

INSERT INTO MVCDatabase.dbo.Address( AddressID, Address, City, PostalCode, ProvinceID)
VALUES (1, '431 3rd Ave N', 'Saskatoon', 'S7K4Z3',  13);

INSERT INTO MVCDatabase.dbo.Address( AddressID, Address, City, PostalCode, ProvinceID)
VALUES (2, '350 Southill ', 'Kitchener', 'N2A2R1',  9);

INSERT INTO MVCDatabase.dbo.Address( AddressID, Address, City, PostalCode, ProvinceID)
VALUES (3, '435 4rd Ave S', 'Saskatoon', 'S9K4Z8',  13);

INSERT INTO MVCDatabase.dbo.Address( AddressID, Address, City, PostalCode, ProvinceID)
VALUES (4, '450 Wilson', 'Halifax', 'H6K4Z2',  7);

INSERT INTO MVCDatabase.dbo.Address( AddressID, Address, City, PostalCode, ProvinceID)
VALUES (5, '89 Evergreen', 'Guelph', 'N2R2N1',  9);

INSERT INTO MVCDatabase.dbo.Address( AddressID, Address, City, PostalCode, ProvinceID)
VALUES (6, '101 Knestigton', 'Labrador', 'L7D4Z3',  5);



---Province Table Value

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (1, 'Alberta', 'AB');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (2, 'British Columbia', 'BC');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (3, 'Manitoba', 'MB');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (4, 'New Brunswick', 'NB');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (5, 'Newfoundland and Labrador', 'NL');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (6, 'Northwest Territories', 'NT');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (7, 'Nova Scotia', 'NS');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (8, 'Nunavut', 'NU');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (9, 'Ontario', 'ON');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (10, 'Prince Edward Island', 'PEI');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (11, 'Québec', 'QC');

INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (12, 'Saskatchewan', 'SK');


INSERT INTO MVCDatabase.dbo.Province( ProvinceID, ProvinceName,ProvinceAbbreviation)
VALUES (13, 'Yukon Territory', 'YT');



----Execute the query

SELECT *
FROM MVCDatabase.dbo.Person;

SELECT *
FROM MVCDatabase.dbo.Address;

SELECT *
FROM MVCDatabase.dbo.Province;

SELECT FirstName, City, ProvinceName, ProvinceAbbreviation 
FROM MVCDatabase.dbo.Person 
JOIN MVCDatabase.dbo.Address
ON Address.AddressID= Person.AddressID
JOIN MVCDatabase.dbo.Province
ON Address.ProvinceID = Province.ProvinceID;










