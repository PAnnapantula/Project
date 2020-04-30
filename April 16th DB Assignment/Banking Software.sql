use BankingSoftware

--Banking Software--

CREATE TABLE Bank_Officer(
	Emp_ID int PRIMARY KEY,
	Emp_First_Name varchar(50),
	Emp_Last_Name varchar(50),
	DOB date,
	Gender varchar(10),
	Emp_Username varchar(30),
	Emp_Password varchar(20),
	Phone int,
	Email varchar(50),
	Nationality varchar(30),
	Add_Street varchar(50),
	Add_City varchar(50),
	Add_State varchar(50),
	Add_Zipcode varchar(50),
	Designation varchar(30)
);

select * from Bank_Officer;

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
	SSN varchar(20)
);

select * from Customer;

CREATE TABLE Account(
	Account_No int PRIMARY KEY,
	Acc_Type varchar(30),
	Customer_ID int FOREIGN KEY REFERENCES Customer(Customer_ID),
	Balance int,
	Interest_Rate int,
	Open_Date date,
	Acc_Status varchar(10),
	Interest_Amount int
);

select * from Account;

CREATE TABLE Money_Transaction(
	Transaction_ID int PRIMARY KEY,
	Account_No int FOREIGN KEY REFERENCES Account(Account_No),
	Trans_Type varchar(50),
	Amount int,
	Total_Balance int,
	Date_of_Trans date
);

select * from Money_Transaction;

CREATE TABLE Loan(
	Loan_No int PRIMARY KEY,
	Loan_Type varchar(30),
	Loan_Amount int,
	Loan_CustomerID int FOREIGN KEY REFERENCES Customer(Customer_ID),
	Loan_Duration int,
	Date_of_Loan date,
	Interest int
);

select * from Loan;

CREATE TABLE Loan_Payment(
	Payment_No int PRIMARY KEY,
	Payment_Date date,
	Payment_Amount int,
	Loan_No int FOREIGN KEY REFERENCES Loan(Loan_No)
);

select * from Loan_Payment;