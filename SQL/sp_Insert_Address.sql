ALTER procedure SpInsertinto_Address

@address varchar(25),
@city varchar(25),
@PostalCode varchar(25),
@ProvinceID int
as
begin
insert into Address( Address, City, PostalCode, ProvinceID)
Values
(@address, @city, @PostalCode, @ProvinceID)
end
go
exec SpInsertinto_Address '460 Wilson', 'surat', 'L7D4Z4', 7

select * from Address;