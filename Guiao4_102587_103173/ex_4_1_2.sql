CREATE TABLE VOO_Airport (
	[Code] [int] NOT NULL PRIMARY KEY,
	[City] [varchar](128) NOT NULL,
	[State] [varchar](128) NOT NULL,
	[Name] [varchar](256) NOT NULL,
)
GO

CREATE TABLE VOO_Airplane_Type (
	[Name_Type] [varchar](128) NOT NULL PRIMARY KEY,
	[Company] [varchar](128) NOT NULL,
	[Max_Seats] [int] NOT NULL,
)
GO

CREATE TABLE VOO_Flight (
	[Number] [int] NOT NULL PRIMARY KEY,
	[Airline] [varchar](128) NOT NULL,
	[Weekdays] [varchar](128) NOT NULL,
)
GO

CREATE TABLE VOO_Flight_Leg (
	[Leg_No] [int] NOT NULL PRIMARY KEY,
	[Flight_Number] [int] NOT NULL REFERENCES VOO_Flight ([Number]),
	[Airport_Code] [int] NOT NULL REFERENCES VOO_Airport ([Code]),
	[Dep_Time] [varchar](128) NOT NULL,
	[Arr_Time] [varchar](128) NOT NULL,
)
GO

CREATE TABLE VOO_Airplane (
	[Airplane_ID] [int] NOT NULL PRIMARY KEY,
	[Airplane_Type_Name] [varchar](128) NOT NULL REFERENCES VOO_Airplane_Type ([Name_Type]),
	[Total_Seats] [int] NOT NULL,
)
GO

CREATE TABLE VOO_Leg_Instance (
	[Date] [varchar](128) NOT NULL PRIMARY KEY,
	[Flight_Leg_Leg_No] [int] NOT NULL REFERENCES VOO_Flight_Leg ([Leg_No]),
	[Airport_Code] [int] NOT NULL REFERENCES VOO_Airport ([Code]),
	[No_of_Seats] [int] NOT NULL,
	[Airplane_ID] [int] NOT NULL REFERENCES VOO_Airplane ([Airplane_ID]),
	[Dep_Time] [varchar](128) NOT NULL,
	[Arr_Time] [varchar](128) NOT NULL,
)
GO

CREATE TABLE VOO_Can_Land (
	[Airplane_Type_Name] [varchar](128) NOT NULL REFERENCES VOO_Airplane_Type ([Name_Type]),
	[Airport_Code] [int] NOT NULL REFERENCES VOO_Airport ([Code]),
	PRIMARY KEY ([Airplane_Type_Name], [Airport_Code]),
)
GO

CREATE TABLE VOO_Fare (
	[Flight_Number] [int] NOT NULL REFERENCES VOO_Flight ([Number]),
	[Code] [int] NOT NULL,
	[Amount] [varchar](128) NOT NULL,
	[Restrictions] [varchar](128) NOT NULL,
	PRIMARY KEY ([Flight_Number])
)
GO

CREATE TABLE VOO_Seat (
	[Seat_No] [int] NOT NULL PRIMARY KEY,
	[Leg_Instance_Date] [varchar](128) NOT NULL REFERENCES VOO_Leg_Instance ([Date]),
	[Costumer_Name] [varchar](256) NOT NULL,
	[Cell_Phone] [varchar](32) NOT NULL,
)
GO

