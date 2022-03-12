--Create Database

CREATE DATABASE MVCDatabase 

USE MVCDatabase


---create Province table

CREATE TABLE Province(
	ProvinceID				INT	PRIMARY KEY IDENTITY(1,1),
	ProvinceName			VARCHAR(25),
	ProvinceAbbreviation	VARCHAR(25)
	);

	
---create Address table
	
CREATE TABLE Address(
	AddressID		INT PRIMARY KEY IDENTITY(1,1) ,
	Address			VARCHAR(25) NOT NULL,
	City			VARCHAR(25) NOT NULL,
	PostalCode		VARCHAR(25) NOT NULL,
	ProvinceID		INT FOREIGN KEY REFERENCES Province(ProvinceID) 
	);

	

---create person table

CREATE TABLE Person
(
	PersonID	INT PRIMARY KEY IDENTITY(1,1) ,
	FirstName	VARCHAR(25) NOT NULL,
	LastName	VARCHAR(25) NOT NULL,
	Age			INT,
	EmailID		VARCHAR(25),
	Gender		VARCHAR(25),
	AddressID	INT FOREIGN KEY REFERENCES Address(AddressID)
	);


---Province Table Value

INSERT INTO MVCDatabase.dbo.Province( ProvinceName,ProvinceAbbreviation)
VALUES ( 'Alberta', 'AB');

INSERT INTO MVCDatabase.dbo.Province( ProvinceName,ProvinceAbbreviation)
VALUES ( 'British Columbia', 'BC');

INSERT INTO MVCDatabase.dbo.Province( ProvinceName,ProvinceAbbreviation)
VALUES ( 'Manitoba', 'MB');

INSERT INTO MVCDatabase.dbo.Province( ProvinceName,ProvinceAbbreviation)
VALUES ( 'New Brunswick', 'NB');

INSERT INTO MVCDatabase.dbo.Province(  ProvinceName,ProvinceAbbreviation)
VALUES ( 'Newfoundland and Labrador', 'NL');

INSERT INTO MVCDatabase.dbo.Province( ProvinceName,ProvinceAbbreviation)
VALUES ( 'Northwest Territories', 'NT');

INSERT INTO MVCDatabase.dbo.Province( ProvinceName,ProvinceAbbreviation)
VALUES ('Nova Scotia', 'NS');

INSERT INTO MVCDatabase.dbo.Province( ProvinceName,ProvinceAbbreviation)
VALUES ( 'Nunavut', 'NU');

INSERT INTO MVCDatabase.dbo.Province(  ProvinceName,ProvinceAbbreviation)
VALUES ( 'Ontario', 'ON');

INSERT INTO MVCDatabase.dbo.Province(  ProvinceName,ProvinceAbbreviation)
VALUES ( 'Prince Edward Island', 'PEI');

INSERT INTO MVCDatabase.dbo.Province( ProvinceName,ProvinceAbbreviation)
VALUES ( 'Québec', 'QC');

INSERT INTO MVCDatabase.dbo.Province(  ProvinceName,ProvinceAbbreviation)
VALUES ( 'Saskatchewan', 'SK');


INSERT INTO MVCDatabase.dbo.Province(  ProvinceName,ProvinceAbbreviation)
VALUES ( 'Yukon Territory', 'YT');

----Address Table Value

INSERT INTO MVCDatabase.dbo.Address(  Address, City, PostalCode, ProvinceID)
VALUES ( '431 3rd Ave N', 'Saskatoon', 'S7K4Z3',  13);

INSERT INTO MVCDatabase.dbo.Address(  Address, City, PostalCode, ProvinceID)
VALUES ( '350 Southill ', 'Kitchener', 'N2A2R1',  9);

INSERT INTO MVCDatabase.dbo.Address( Address, City, PostalCode, ProvinceID)
VALUES ( '435 4rd Ave S', 'Saskatoon', 'S9K4Z8',  13);

INSERT INTO MVCDatabase.dbo.Address(  Address, City, PostalCode, ProvinceID)
VALUES ( '450 Wilson', 'Halifax', 'H6K4Z2',  7);

INSERT INTO MVCDatabase.dbo.Address(  Address, City, PostalCode, ProvinceID)
VALUES ( '89 Evergreen', 'Guelph', 'N2R2N1',  9);

INSERT INTO MVCDatabase.dbo.Address(  Address, City, PostalCode, ProvinceID)
VALUES ( '101 Knestigton', 'Labrador', 'L7D4Z3',  5);

---Person Table Value


INSERT INTO MVCDatabase.dbo.Person  ( FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES ( 'Niruxa', 'Padhiyar', 24, 'nilipadhiyar293@gmail.com', 'FeMale' , 1 );

INSERT INTO MVCDatabase.dbo.Person ( FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES ( 'Ruchi', 'Trivedi', 26, 'ruchitrivedi@gmail.com', 'FeMale' , 2);

INSERT INTO MVCDatabase.dbo.Person  ( FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES ( 'Vivek', 'Kathiriya', 24, 'vivekkathiriya@gmail.com', 'Male' , 3);

INSERT INTO MVCDatabase.dbo.Person  ( FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES ( 'Urvashi', 'Kapadiya', 26, 'urvashikapadiya@gmail.com', 'FeMale' , 4);

INSERT INTO MVCDatabase.dbo.Person  (  FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES ( 'Nirav', 'Patel', 28, 'niravpatel@gmail.com', 'Male' , 5 );

INSERT INTO MVCDatabase.dbo.Person  (  FirstName, LastName, Age, EmailID, Gender, AddressID)
VALUES ( 'Harsh', 'Patel', 25, 'harshpatel@gmail.com', 'Male' , 6 );


/*DROP TABLE dbo.Address
DROP TABLE dbo.Person
DROP TABLE dbo.Province*/










