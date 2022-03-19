--STORED PROCEDURES FOR PERSON TABLE--
USE MVCDatabase
GO
--INSERT
DROP PROCEDURE IF EXISTS dbo.SP_insert_person
GO
CREATE PROCEDURE SP_insert_person  
@FirstName varchar(25),  
@LastName varchar(25),
@Age int,
@EmailID varchar(25),  
@Gender varchar(25),
@AddressID int
AS  
BEGIN  
INSERT INTO Person (  
FirstName,  
LastName,  
Age,  
EmailID,
Gender,
AddressID)  
VALUES (  
@FirstName,  
@LastName,  
@Age,  
@EmailID,
@Gender,
@AddressID)  
END

--EXECUTE INSERT PROCEDURE
--EXEC SP_insert_person 'Neerav','Patel',29,'niravpatel4848@gmail.com',Male,3;


--UPDATE PROCEDURE

DROP PROCEDURE IF EXISTS dbo.SP_update_person
GO
CREATE PROCEDURE SP_update_person
@PersonID int,
@FirstName varchar(25),  
@LastName varchar(25),
@Age int,
@EmailID varchar(25),  
@Gender varchar(25),
@AddressID int  
AS  
BEGIN    
UPDATE Person  
SET FirstName= @FirstName,  
LastName = @LastName,  
Age= @Age,
EmailID = @EmailID,  
Gender = @Gender,
AddressID = @AddressID  
WHERE PersonID= @PersonID  
END  

--EXECUTE UPDATE PERSON
--EXEC SP_update_person 7,'test','test',30,'test','test',4;

--READ
DROP PROCEDURE IF EXISTS dbo.SP_get_person
GO
CREATE PROCEDURE SP_get_person  
@PersonID int
AS  
BEGIN  
  
SELECT *  
FROM Person   
WHERE (PersonID = @PersonID);
END  

-------------
--EXEC SP_get_person 6;

DROP PROCEDURE IF EXISTS dbo.SP_get_all_persons
GO

CREATE PROCEDURE SP_get_all_persons  
@PersonCount int OUTPUT
AS  
BEGIN  
  
SELECT *  
FROM Person;   
SELECT @PersonCount = @@ROWCOUNT;
END  

--EXECUTE READ PERSON 
/*DECLARE @count int;
EXEC SP_get_all_persons @count OUTPUT;
SELECT @count as 'Total number of persons';*/


--DELETE--
DROP PROCEDURE IF EXISTS dbo.SP_delete_person
GO
CREATE PROCEDURE SP_delete_person  
@PersonID int  
AS  
BEGIN  
DELETE  
FROM Person  
WHERE PersonID= @PersonID  
  
END  

--EXECUTE DELETE PERSON
--EXEC SP_delete_person 7;




