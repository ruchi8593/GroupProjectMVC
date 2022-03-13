USE MVCDatabase
GO

IF OBJECT_ID(N'dbo.UserInfo', N'U') IS NOT NULL  
   DROP TABLE [dbo].[UserInfo]
GO
CREATE TABLE UserInfo
(
	Id	  INT PRIMARY KEY IDENTITY(1,1),
	Username	VARCHAR(25) NOT NULL,
	Password	VARCHAR(25) NOT NULL,
	Role	    VARCHAR(25) NOT NULL
);
GO

DROP PROCEDURE IF EXISTS SP_get_User
GO
CREATE PROCEDURE SP_get_User  
@Username VARCHAR(25),
@Password	VARCHAR(25)
AS  
BEGIN  
SELECT Username, Password, Role  
FROM UserInfo   
WHERE (Username = @Username AND Password = @Password);
END  
GO

DROP PROCEDURE IF EXISTS SP_Create_User
GO
CREATE PROCEDURE SP_Create_User  
@Username VARCHAR(25),
@Password	VARCHAR(25),
@Role VARCHAR(25) = "User"
AS  
BEGIN  
INSERT INTO UserInfo(  
Username,  
Password, 
Role )
VALUES (  
@Username,  
@Password, @Role )
END
