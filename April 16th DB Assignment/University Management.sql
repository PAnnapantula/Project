use UniversitySoftware

--University Software--


CREATE TABLE Department(
	Department_ID int PRIMARY KEY,
	Department_Name varchar(50)
);


CREATE TABLE Faculty(
	Faculty_ID int PRIMARY KEY IDENTITY,
	Faculty_Name varchar(100),
	Gender varchar(10),
	Designation varchar(50),
	Age int
);



CREATE TABLE Course(
	Course_ID int PRIMARY KEY IDENTITY,
	Course_Name varchar(50),
	Code varchar(30),
	Department_ID int FOREIGN KEY REFERENCES Department(Department_ID),
	Faculty_ID int FOREIGN KEY REFERENCES Faculty(Faculty_ID)
);


CREATE TABLE Research_Project(
	Project_ID int PRIMARY KEY IDENTITY,
	Project_Name varchar(50),
	Faculty_ID int FOREIGN KEY REFERENCES Faculty(Faculty_ID),
	Area varchar(50),
	Duration int,
	Completion_Date date
);


CREATE TABLE Student(
	Sudent_ID int PRIMARY KEY IDENTITY,
	First_Name varchar(50),
	Last_Name varchar(50),
	DOB date,
	Gender varchar(10),
	Phone int,
	Email varchar(50),
	Nationality varchar(30),
	Stud_Street varchar(50),
	Stud_City varchar(50),
	Stud_State varchar(50),
	Stud_Zipcode varchar(50),
	Department_ID int FOREIGN KEY REFERENCES Department(Department_ID),
	Project_ID int FOREIGN KEY REFERENCES Research_Project(Project_ID)
);


INSERT INTO Department VALUES
	(1, 'Biology'),
	(2, 'Computer Science'),
	(3, 'Chemistry'),
	(4, 'Electrical Engineering'),
	(5, 'Cyber Security');

INSERT INTO Faculty VALUES
	('Satish', 'Male', 'Some Designation1', 30),
	('Nikhil', 'Male', 'Some Designation2', 31),
	('Manjunath', 'Male', 'Some Designation3', 32),
	('Mahantha', 'Male', 'Some Designation4', 33),
	('Bhaskar', 'Male', 'Some Designation5', 34);

INSERT INTO Course VALUES
	('Cells', 'CourseCode1', 1, 1),
	('SQL', 'CourseCode2', 2, 2),
	('Elements', 'CourseCode3', 3, 3),
	('Circuits', 'CourseCode4', 4, 4),
	('Firewalls', 'CourseCode5', 5, 5);

INSERT INTO Research_Project VALUES
	('HelloWorld', 2, 'Area1', 10, CURRENT_TIMESTAMP),
	('CellsOnline', 1, 'Area2', 13, CURRENT_TIMESTAMP),
	('BuildFirewall', 5, 'Area3', 15, CURRENT_TIMESTAMP),
	('PeriodicTableOnline', 3, 'Area4', 19, CURRENT_TIMESTAMP),
	('DoItYourselfCircuit', 4, 'Area5', 8, CURRENT_TIMESTAMP);

INSERT INTO Student VALUES
	('Prerana', 'Annapantula', '2001-01-02', 'F', 5555603, 'Email@gmail.com', 'American', 'Street', 'City', 'State', 'ZipCode', 2, 1),
	('Donato', 'Manzione', '2001-01-03', 'M', 5555603, 'Email1@gmail.com', 'American', 'Street1', 'City1', 'State1', 'ZipCode1', 1, 2),
	('Pooja', 'Shukla', '2001-01-04', 'F', 5555603, 'Email2@gmail.com', 'American', 'Street2', 'City2', 'State2', 'ZipCode2', 3, 4),
	('Erik', 'Johnson', '2001-01-05', 'M', 5555603, 'Email3@gmail.com', 'American', 'Street3', 'City3', 'State3', 'ZipCode3', 5, 3),
	('Dan', 'Mont-Eton', '2001-01-06', 'M', 5555603, 'Email4@gmail.com', 'American', 'Street4', 'City4', 'State4', 'ZipCode4', 4, 5);

	select * from Department;
	Select * from Faculty;
	select * from Course;
	select * from Research_Project;
	select * from Student;
--	drop table Student, Research_Project, Course, Faculty, Department;