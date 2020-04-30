use TelecomDomain

--Telecom Domain--

CREATE TABLE Customer(
	Customer_ID int PRIMARY KEY,
	First_Name varchar(50),
	Last_Name varchar(50),
	DOB date,
	Gender varchar(10),
	Zipcode varchar(10),
	Phone int,
	Email varchar(50),
	Nationality varchar(30),
	Add_Street varchar(50),
	Add_City varchar(50),
	Add_State varchar(50),
	Add_Zipcode varchar(50),
	SSN varchar(20),
	Cus_Username varchar(30),
	Cus_Password varchar(30)
);

select * from Customer;

CREATE TABLE Tariff(
	Tariff_ID int PRIMARY KEY,
	Tariff_Name varchar(50),
	Tariff_Type varchar(30),
	Tariff_Desc varchar(200)
);

select * from Tariff;

CREATE TABLE Connection(
	Connection_ID int PRIMARY KEY,
	Con_Telephone_ID int,
	Con_Customer_ID int,
	Con_Name varchar(30),
	Con_Type int,
	Con_Description varchar(100),
	Tariff_ID int FOREIGN KEY REFERENCES Tariff(Tariff_ID)
);

select * from Connection;

CREATE TABLE Bill(
	Bill_ID int PRIMARY KEY,
	Bill_Cust_ID int FOREIGN KEY REFERENCES Customer(Customer_ID),
	Bill_Type varchar(30),
	Bill_Amount int,
	Bill_Date date,
	Bill_Details varchar(200),
	Tariff_ID int FOREIGN KEY REFERENCES Tariff(Tariff_ID)
);

select * from Bill;

CREATE TABLE Payment(
	Payment_ID int PRIMARY KEY,
	Payment_Date date,
	Payment_Amount int,
	Pay_Cust_ID int FOREIGN KEY REFERENCES Customer(Customer_ID),
	Bill_ID int FOREIGN KEY REFERENCES Bill(Bill_ID)
);
 select * from Payment;