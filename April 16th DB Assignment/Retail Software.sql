use RetailSoftware

--Retail Software [Ex. Amazon]--

CREATE TABLE Customer (
	Customer_ID int PRIMARY KEY,
	First_Name varchar(50),
	Last_Name varchar(50),
	Street varchar(50),
	City varchar(50),
	Zipcode varchar(50),
	Phone int,
	Email varchar(50)
);


CREATE TABLE Product (
	Product_ID int PRIMARY KEY,
	Product_Name varchar(50),
	Quantity_in_stock int,
	Unit_Price int,
	Product_Type varchar(50)
);


CREATE TABLE Payment (
	Payment_ID int PRIMARY KEY,
	Credit_Card int,
	Name_on_Card varchar(30),
	Card_Expires_On varchar(30),
	Billing_Address varchar(80)
);

CREATE TABLE Orders (
	Order_Number int PRIMARY KEY,
	Customer_ID int FOREIGN KEY REFERENCES Customer(Customer_ID),
	Customer_Name varchar(50),
	To_Street varchar(50),
	To_City varchar(50),
	To_Zipcode varchar(50),
	Ship_Date date,
	Product_ID int FOREIGN KEY REFERENCES Product(Product_ID),
	Ordered_Qty int,
	Payment_ID int FOREIGN KEY REFERENCES Payment(Payment_ID),
	Total_Price int
);


INSERT INTO Customer VALUES
	(1, 'Prerana', 'Annapantula', 'Street', 'City', 'ZipCode', 5555603, 'Email@gmail.com'),
	(2, 'Donato', 'Manzione', 'Street1', 'City1', 'ZipCode1', 5555604, 'Email1@gmail.com'),
	(3, 'Pooja', 'Shukla', 'Street2', 'City2', 'ZipCode2', 5555605, 'Email2@gmail.com'),
	(4, 'Erik', 'Johnson', 'Street3', 'City3', 'ZipCode3', 5555606, 'Email3@gmail.com'),
	(5, 'Dan', 'Mont-Eton', 'Street4', 'City4', 'ZipCode4', 5555607, 'Email4@gmail.com');

	
INSERT INTO Product VALUES
	(171, 'Product1', 50, 130, 'Some Product Type'),
	(172, 'Product2', 55, 126, 'Some Product Type'),
	(173, 'Product3', 53, 179, 'Some Product Type'),
	(174, 'Product4', 35, 256, 'Some Product Type'),
	(175, 'Product5', 46, 855, 'Some Product Type');

INSERT INTO Payment VALUES
	(141, 555711, 'Prerana Annapantula', '06/22', 'Address1'),
	(142, 555811, 'Donato Manzione', '06/21', 'Address2'),
	(143, 555911, 'Pooja Shukla', '06/23', 'Address3'),
	(144, 555011, 'Erik Johnson', '06/24', 'Address4'),
	(145, 555111, 'Dan Mont-Eton', '06/27', 'Address5');

INSERT INTO Orders VALUES
	(1, 1, 'Prerana Annapantula', 'Street', 'City', 'ZipCode', CURRENT_TIMESTAMP + 50, 171, 1, 141, (
	select Unit_Price * 1 AS Price from Product WHERE Product.Product_ID = 171)),
	(2, 2, 'Donato Manzione', 'Street1', 'City1', 'ZipCode1', CURRENT_TIMESTAMP + 20, 172, 1, 142, (
	select Unit_Price * 1 AS Price from Product WHERE Product.Product_ID = 172)),
	(3, 3, 'Pooja Shukla', 'Street2', 'City2', 'ZipCode2', CURRENT_TIMESTAMP + 40, 173, 2, 143, (
	select Unit_Price * 2 AS Price from Product WHERE Product.Product_ID = 173)),
	(4, 4, 'Erik Johnson', 'Street3', 'City3', 'ZipCode3', CURRENT_TIMESTAMP + 30, 174, 1, 144, (
	select Unit_Price * 1 AS Price from Product WHERE Product.Product_ID = 174)),
	(5, 5, 'Dan Mont-Eton', 'Street4', 'City4', 'ZipCode4', CURRENT_TIMESTAMP + 10, 175, 1, 145, (
	select Unit_Price * 1 AS Price from Product WHERE Product.Product_ID = 175)); 

select * from Customer;
select * from Product;
select * from Payment;
select * from Orders;

--drop table Orders, Payment, Product, Customer;