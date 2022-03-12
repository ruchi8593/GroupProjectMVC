--Create Stored Procedure for insert into dbo.Province--
USE MVCDatabase
GO

DROP PROCEDURE IF EXISTS dbo.SpInsertIntoProvince
GO
create procedure SpInsertIntoProvince
	@provincename varchar(25),
	@province varchar(25)
	as
	begin

		insert into dbo.Province(ProvinceName, ProvinceAbbreviation)
		values(@provincename, @province)

		select * from dbo.Province		
	end
--Execution of Stored Procedure--
--exec dbo.SpInsertIntoProvince 'Ontario', 'ON'

--Create Stored Procedure to get data from dbo.Province by ProvinceID--
DROP PROCEDURE IF EXISTS dbo.sp_GetProvinceByID
GO
create procedure sp_GetProvinceByID
	@provinceId int
	as
	begin

	select * from dbo.Province where ProvinceID = @provinceId

	end

--Execution of Stored Procedure--
--exec dbo.sp_GetProvinceByID 5

--Create Stored Procedure to count total number of Provinces from dbo.Province--

DROP PROCEDURE IF EXISTS dbo.sp_GetProvinceCount
GO
create procedure sp_GetProvinceCount
	@provinceCount int OUTPUT
	as
	begin

	select @provinceCount = COUNT(*) from dbo.Province
	select @provinceCount AS 'Number of Provinces';

	end

--Execution of Stored Procedure--
--declare @Count int
--exec dbo.sp_GetProvinceCount @Count

--Create Stored Procedure for update into dbo.Province by ProvinceID--
DROP PROCEDURE IF EXISTS dbo.sp_UpdateProvincebyID
GO
create procedure sp_UpdateProvincebyID
	@provinceId int,
	@provincename varchar(25),
	@provinceabbreviation varchar(25)
	as
	begin

	update dbo.Province 
	set
		ProvinceName = @provincename,
		ProvinceAbbreviation = @provinceabbreviation
	where
		ProvinceID = @provinceId
	end

--Execution of Stored Procedure--
--exec dbo.sp_UpdateProvincebyID 14,'Ontario','ONT'

--Create Stored Procedure for delete from dbo.Province by ProvinceID--
DROP PROCEDURE IF EXISTS dbo.sp_DeleteProvinceById
GO
create procedure sp_DeleteProvinceById
	@provinceId int
	as
	begin

		delete from dbo.Province where ProvinceID = @provinceId
	end

--Execution of Stored Procedure--
--exec dbo.sp_DeleteProvinceById 14;




