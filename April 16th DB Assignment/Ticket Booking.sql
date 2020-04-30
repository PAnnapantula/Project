use TicketBooking

--Ticket Booking--

CREATE TABLE Flight(
	Flight_ID int PRIMARY KEY,
	Airline_ID int,
	Airline_Name varchar(50),
	Total_Seats int
);


CREATE TABLE Flight_Details(
	Flight_ID int FOREIGN KEY REFERENCES Flight(Flight_ID),
	From_Location varchar(50),
	To_Location varchar(50),
	Departure_Time DateTime PRIMARY KEY,
	Arrival_Time DateTime,
	Price int,
	Available_Seats int
);


CREATE TABLE Credit_Card_Details(
	Profile_ID int PRIMARY KEY,
	Card_Number int,
	Expiration_Month int,
	Expiration_Year int
);


CREATE TABLE Passenger_Profile(
	Passenger_ID int PRIMARY KEY,
	Pass_Password varchar(100),
	Profile_ID int FOREIGN KEY REFERENCES Credit_Card_Details(Profile_ID),
	First_Name varchar(50),
	Last_Name varchar(50),
	Pass_Address varchar(200),
	Phone int,
	Email varchar(50)
);


CREATE TABLE Ticket_Info(
	Ticket_ID int PRIMARY KEY,
	Passenger_ID int FOREIGN KEY REFERENCES Passenger_Profile(Passenger_ID),
	Flight_ID int FOREIGN KEY REFERENCES Flight(Flight_ID),
	Departure_Time DateTime FOREIGN KEY REFERENCES Flight_Details(Departure_Time),
	Passenger_Status varchar(30),
	Passenger_Name varchar(100),
	Seat_Assigned varchar(10)
);


INSERT INTO Flight VALUES
	(1350, 133, 'Delta Air Lines', 130),
	(1351, 134, 'Singapore Airlines', 131),
	(1352, 135, 'Alaskan Airlines', 132),
	(1353, 136, 'Emirates', 133),
	(1354, 137, 'United Airlines', 134);

INSERT INTO Flight_Details VALUES 
	(1350, 'SeaTac', 'Hyderabad', CURRENT_TIMESTAMP + 30, CURRENT_TIMESTAMP + 15, 150, 10),
	(1351, 'SeaTac', 'Singapore', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + 1, 150, 10),
	(1352, 'SeaTac', 'Los Angeles', CURRENT_TIMESTAMP + 45, CURRENT_TIMESTAMP + 12, 150, 10),
	(1353, 'SeaTac', 'Dubai', CURRENT_TIMESTAMP + 12, CURRENT_TIMESTAMP + 14, 150, 10),
	(1354, 'SeaTac', 'Cincinatti', CURRENT_TIMESTAMP + 10, CURRENT_TIMESTAMP + 17, 150, 10);

INSERT INTO Credit_Card_Details VALUES
	(1971, 555711, 06, 20),
	(1972, 555811, 05, 20),
	(1973, 555911, 07, 20),
	(1974, 555211, 09, 20),
	(1975, 555411, 08, 20);

INSERT INTO Passenger_Profile VALUES 
	(111, 'I@MCaT', 1971, 'Prerana', 'Annapantula', 'HomeAddress', 5554797, 'Email@gmail.com'),
	(112, 'I@MD0G', 1972, 'Donato', 'Manzione', 'HomeAddress1', 5554798, 'Email1@gmail.com'),
	(113, 'I@MF!SH', 1973, 'Pooja', 'Shukla', 'HomeAddress2', 5554790, 'Email2@gmail.com'),
	(114, 'I@MSNAK3', 1974, 'Erik', 'Johnson', 'HomeAddress3', 5554794, 'Email3@gmail.com'),
	(115, 'I@MM0USE', 1975, 'Dan', 'Mont-Eton', 'HomeAddress4', 5554796, 'Email4@gmail.com');

INSERT INTO Ticket_Info VALUES
	(17191, 111, 1350, '2020-05-23 03:37:55.780', 'First', 'Prerana Annapantula', '1A'),
	(17192, 112, 1351, '2020-04-23 03:37:55.780', 'First', 'Donato Manzione', '1B'),
	(17193, 113, 1352, '2020-06-07 03:37:55.780', 'Business', 'Pooja Shukla', '7C'),
	(17194, 114, 1353, '2020-05-05 03:37:55.780', 'Business', 'Erik Johnson', '7A'),
	(17195, 115, 1354, '2020-05-03 03:37:55.780', 'Economy', 'Dan Mont-Eton', '17A');

select * from Flight;
select * from Flight_Details;
select * from Credit_Card_Details;
select * from Passenger_Profile;
select * from Ticket_Info;