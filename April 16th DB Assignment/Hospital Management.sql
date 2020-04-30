use HospitalManagement

--Hospital Management System--

CREATE TABLE Hospital (
	Hospital_ID int PRIMARY KEY,
	Hospital_Name varchar(100),
	Hospital_Address varchar(100),
	Hospital_City varchar(100),
	Hospital_State varchar(200),
	Hospital_Zipcode int
);

select * from Hospital;

CREATE TABLE Doctor (
	Doctor_ID int PRIMARY KEY,
	Doc_First_Name varchar(50),
	Doc_Last_Name varchar(50),
	Doc_Specialization varchar(50),
	Hospital_ID int FOREIGN KEY REFERENCES Hospital(Hospital_ID)
);

select * from Doctor;

CREATE TABLE Patient (
	Patient_ID int PRIMARY KEY,
	Pat_First_Name varchar(50),
	Pat_Last_Name varchar (50),
	Pat_Address varchar(50),
	Pat_City varchar(50),
	Pat_Zipcode int,
	Pat_Phone int,
	Pat_Email varchar(50),
	Insurance_ID varchar(50)
);

select * from Patient;

CREATE TABLE Appointment(
	App_ID int PRIMARY KEY,
	App_Date date,
	App_Time time,
	App_Duration int,
	App_Reason varchar(200),
	Patient_ID int FOREIGN KEY REFERENCES Patient(Patient_ID),
	Doctor_ID int FOREIGN KEY REFERENCES Doctor(Doctor_ID),
	Hospital_ID int FOREIGN KEY REFERENCES Hospital(Hospital_ID)
);

select * from Appointment;

CREATE TABLE Bill(
	Bill_Number int PRIMARY KEY,
	Bill_Date date,
	Bill_Status varchar(30),
	Card_Expires_On varchar(10),
	Billing_Address varchar(80),
	Patient_ID int FOREIGN KEY REFERENCES Patient(Patient_ID),
	App_ID int FOREIGN KEY REFERENCES Appointment(App_ID),
	Bill_Amount int
);

select * from Bill;

CREATE TABLE Payment(
	Pay_RecieptNo int PRIMARY KEY,
	Pay_Date date,
	Pay_Method varchar(30),
	Pay_Amount int,
	Bill_Number int FOREIGN KEY REFERENCES Bill(Bill_Number)
);

select * from Payment;