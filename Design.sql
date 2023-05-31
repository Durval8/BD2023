--create table Design_Company(
--	[NIF] [int] not null primary key,
--	[Address] [varchar](128) not null,
--	[Phone] [int] not null,
--	[Name] [varchar](128) not null
--)
--go

--create table Design_DesignersFirm(
--	[CompanyNIF] [int] not null primary key references Design_Company ([NIF]),
--	[Reviews] [varchar](128) not null
--)
--go

--create table Design_Manufacturer(
--	[CompanyNIF] [int] not null primary key references Design_Company ([NIF]),
--	[Quality] [varchar](64) not null
--)
--go

--create table Design_Person(
--	[CCNumber] [int] not null primary key,
--	[CellPhone] [int] not null,
--	[Name] [varchar](128) not null,
--	[NIF] [int] not null
--)
--go

--create table Design_Client(
--	[Person_CCNumber] [int] primary key references Design_Person ([CCNumber]),
--	[Budget] [int] not null,
--	[Style_code] [int] not null references Design_Style ([Code])
--)
--go

--create table Design_Designer(
--	[EmployeeCode] [int] not null primary key,
--	[Person_CCNumber] [int] references Design_Person ([CCNumber]),
--	[Firm_NIF] [int] not null references Design_DesignersFirm ([CompanyNIF]),
--	[NumberOfClients] [int] not null
--)
--go

--create table Design_TypeOfProducts(
--	[CodeType] [int] not null primary key,
--	[TypeName] [varchar](64) not null
--)
--go

--create table Design_Products(
--	[CodeProduct] [int] not null primary key,
--	[Manufacturer_NIF] [int] not null references Design_Manufacturer ([CompanyNIF]),
--	[Quantity] [int] not null,
--	[Name] [varchar](128) not null,
--	[Price] [int] not null,
--	[Type_Code] [int] not null references Design_TypeOfProducts ([CodeType])
--)
--go

--create table Design_Style(
--	[Code] [int] not null primary key,
--	[Firm_NIF] [int] not null references Design_DesignersFirm ([CompanyNIF])
--)
--go

-- create table Design_TypeStyle(
--	[Code] [int] not null primary key,
--	[Style_Code] [int] not null references Design_Style ([Code]),
--	[Description] [varchar](256) not null,
--	[Name] [varchar](64) not null
-- )
-- go

-- create table Design_Pieces(
--	[Code] [int] not null primary key,
--	[Description] [varchar](256) not null,
--	[TypeProduct_Code] [int] not null references Design_TypeOfProducts ([CodeType])
-- )
-- go

--create table Design_MadeOf(
--	[Pieces_Code] [int] not null references Design_Pieces ([Code]),
--	[Products_Code]	[int] not null references Design_Products ([CodeProduct]),
--	primary key ([Pieces_Code],[Products_Code])
--)
-- go

--create table Design_Rooms(
--	[Location] [int] not null primary key,
--	[Area] [int] not null,
--	[Height] [int] not null,
--	[Style_code] [int] not null references Design_Style ([Code]),
--	[Client_CCNumber] [int] not null references Design_Client ([Person_CCNumber]),
--	[Designer_Code] [int] not null references Design_Designer ([EmployeeCode])
--)
--go

--create table Design_Has(
--	[Room_Location] [int] not null references Design_Rooms ([Location]),
--	[Product_Code] [int] not null references Design_Products ([CodeProduct]),
--	primary key ([Room_Location],[Product_Code])
--)
--go

--create table Design_Sales(
--	[Product_code] [int] not null references Design_Products ([CodeProduct]),
--	[Designer_code] [int] not null references Design_Designer ([EmployeeCode]),
--	[Amount] [int] not null,
--	[Date] [Date] not null,
--	[Discount] [int] not null,
--	primary key ([Product_code], [Designer_code])
--)
--go
