--Create Stored Procedure for inserting data in new row of dbo.Address--

CREATE PROCEDURE spInsertIntoAddress	

	@Address VARCHAR(25),
	@City VARCHAR(25),
	@PostalCode VARCHAR(25),
	@ProvinceID INT

	AS
	BEGIN

		INSERT INTO dbo.Address(Address, City, PostalCode, ProvinceID)
		VALUES (@Address, @City, @PostalCode, @ProvinceID)

	SELECT*FROM dbo.Address

	END

	--Execution of Stored Procedure--
EXEC dbo.spInsertIntoAddress '321 Albert St', 'Waterloo', 'N2L 5V1', 5


--Create Stored Procedure to get data from dbo.Address by addressID--

CREATE PROCEDURE sp_GetAddressByID

	@AddressId INT

	AS
	BEGIN

	SELECT * FROM dbo.Address
	WHERE
	AddressID =@AddressId

	END

	--Execution of Stored Procedure--

EXECUTE sp_GetAddressByID 6


--Create Stored Procedure to count total number of addresses from dbo.Address--

CREATE PROCEDURE sp_GetAddressCount

	@AddressCount INT OUTPUT

	AS
	BEGIN

	SELECT @AddressCount = COUNT(*) FROM dbo.Address
	SELECT @AddressCount AS 'Total Number of Addresses';

	END

	--Execution of Stored Procedure--
DECLARE @Count INT
EXECUTE sp_GetAddressCount @Count


--Create Stored Procedure for updating data in dbo.Address by AddressID--

CREATE PROCEDURE sp_UpdateAddressByAddressID

	@AddressId INT,
	@Address VARCHAR(25),
	@City VARCHAR(25),
	@PostalCode VARCHAR(25),
	@ProvinceID INT

	AS
	BEGIN

		UPDATE Address
		SET
			Address = @Address,
			City = @City,
			PostalCode = @PostalCode,
			ProvinceID = @ProvinceID
		WHERE
			AddressID = @AddressId
	END
