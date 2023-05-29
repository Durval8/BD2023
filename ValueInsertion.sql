--INSERT INTO Design_Company ([NIF], [Address], [Phone], [Name])
--VALUES (123456, '123 Main St', 913456789, 'Interiors Incorporated');

--INSERT INTO Design_Company ([NIF], [Address], [Phone], [Name])
--VALUES (234567, '456 Elm St', 919876543, 'WorldWide Designs');

--INSERT INTO Design_Company ([NIF], [Address], [Phone], [Name])
--VALUES (345678, '789 Oak St', 927654321, 'Balmain Woods and Metals');

--INSERT INTO Design_Company ([NIF], [Address], [Phone], [Name])
--VALUES (456789, '321 Maple St', 919876543, 'Ikea');

--INSERT INTO Design_Company ([NIF], [Address], [Phone], [Name])
--VALUES (567890, '654 Pine St', 935432109, 'Home and yards pieces');

--INSERT INTO Design_Company ([NIF], [Address], [Phone], [Name])
--VALUES (678901, '987 Cedar St', 934321098, 'Fancy mobilia');

--------------------------- 
--select * from Design_Company
---------------------------

--INSERT INTO Design_Manufacturer ([CompanyNIF], [Quality])
--SELECT [NIF], 'Good' FROM Design_Company WHERE [NIF] = 345678;

--INSERT INTO Design_Manufacturer ([CompanyNIF], [Quality])
--SELECT [NIF], 'Excellent' FROM Design_Company WHERE [NIF] = 456789;

--INSERT INTO Design_Manufacturer ([CompanyNIF], [Quality])
--SELECT [NIF], 'Average' FROM Design_Company WHERE [NIF] = 567890;

--INSERT INTO Design_Manufacturer ([CompanyNIF], [Quality])
--SELECT [NIF], 'Poor' FROM Design_Company WHERE [NIF] = 678901;

--select * from Design_Manufacturer
---------------------

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (1, 'Furniture');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (2, 'Lighting');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (3, 'Textiles');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (4, 'Kitchenware');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (5, 'Home Decor');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (6, 'Appliances');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (7, 'Flooring');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (8, 'Bathroom Fixtures');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (9, 'Wall Art');

--INSERT INTO Design_TypeOfProducts ([CodeType], [TypeName])
--VALUES (10, 'Outdoor Furniture');

--select * from Design_TypeOfProducts 

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (1, 345678, 10, 'Product 1', 100, 1);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (2, 456789, 5, 'Product 2', 200, 2);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (3, 567890, 8, 'Product 3', 150, 3);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (4, 678901, 12, 'Product 4', 120, 4);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (5, 345678, 6, 'Product 5', 180, 5);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (6, 456789, 9, 'Product 6', 250, 6);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (7, 567890, 3, 'Product 7', 90, 7);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (8, 678901, 7, 'Product 8', 130, 8);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (9, 345678, 11, 'Product 9', 160, 9);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (10, 456789, 4, 'Product 10', 220, 10);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (11, 567890, 2, 'Product 11', 80, 1);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (12, 678901, 14, 'Product 12', 170, 2);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (13, 345678, 8, 'Product 13', 190, 3);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (14, 456789, 6, 'Product 14', 230, 4);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (15, 567890, 10, 'Product 15', 140, 5);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (16, 678901, 5, 'Product 16', 110, 6);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (17, 345678, 12, 'Product 17', 200, 7);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (18, 456789, 7, 'Product 18', 170, 8);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (19, 567890, 9, 'Product 19', 210, 9);

--INSERT INTO Design_Products ([CodeProduct], [Manufacturer_NIF], [Quantity], [Name], [Price], [Type_Code])
--VALUES (20, 678901, 3, 'Product 20', 120, 10);
--select * from Design_Products