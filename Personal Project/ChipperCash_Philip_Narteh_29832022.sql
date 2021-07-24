CREATE DATABASE ChipperCash;
USE ChipperCash;

CREATE TABLE Country(
Country_name VARCHAR(20),
Country_location VARCHAR(20),
PRIMARY KEY(Country_name)
);

CREATE TABLE Users(
User_ID INT NOT NULL,
Telephone_number VARCHAR(15),
Username VARCHAR(40),
DOB DATE,
Gender VARCHAR(15),
Country_name VARCHAR(20),
Email_address VARCHAR(30),
Account_number BIGINT NOT NULL,
Account_balance DECIMAL(6,2),
Creation_date DATE,
Verification_ID INT NOT NULL,
ID_card_used VARCHAR(35),
Verification_date DATE,
PRIMARY KEY(User_ID)
); 

CREATE TABLE External_Deposits(
Deposit_ID INT NOT NULL, 
Partner_ID INT NOT NULL,
Country_name VARCHAR(20),
Partner_name VARCHAR(25),
Telephone_number VARCHAR(15),
Deposit_methods ENUM("debit card", "credit card", "mobile money"),
Amount_deposited DECIMAL,
TIme_completed TIME,
PRIMARY KEY(Deposit_ID),
FOREIGN KEY (Country_name) REFERENCES Country(Country_name)
);

CREATE TABLE OperatesIn(
Partner_ID INT NOT NULL,
Country_name VARCHAR(20),
Date_commenced DATE,
FOREIGN KEY (country_name) REFERENCES Country(Country_name)
);

CREATE TABLE Transaction_records(
Record_number INT NOT NULL AUTO_INCREMENT,
Transaction_type ENUM("send money", "receive money", "pay bill", "buy airtime"),
Amount_transacted DECIMAL,
date_completed DATE,
PRIMARY KEY(Record_number)
); 

CREATE TABLE Transactions(
Transaction_code BIGINT NOT NULL,
Record_number INT NOT NULL,
Time_initiated TIME,
Time_completed TIME,
Revenue_count INT,
PRIMARY KEY(Transaction_code),
FOREIGN KEY (Record_number) REFERENCES Transaction_records(Record_number)
); 

CREATE TABLE Send_Receive_Ledger(
Amount_transfered DECIMAL,
Time_sent TIME,
Time_received TIME
); 

CREATE TABLE Sent(
User_ID INT NOT NULL,
Transaction_code BIGINT NOT NULL,
Amount_sent DECIMAL(6,2),
Fees_charged DECIMAL(6,2),
FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
FOREIGN KEY (Transaction_code) REFERENCES Transactions(Transaction_code)
); 

CREATE TABLE Received(
User_ID INT NOT NULL,
Transaction_code BIGINT NOT NULL,
Amount_received DECIMAL(6,2),
FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
FOREIGN KEY (Transaction_code) REFERENCES Transactions(Transaction_code)
); 

CREATE TABLE Airtime(
User_ID INT NOT NULL,
Transaction_code BIGINT NOT NULL,
Telco_network VARCHAR(10),
Amount_purchased DECIMAL(6,2),
FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
FOREIGN KEY (Transaction_code) REFERENCES Transactions(Transaction_code)
); 

CREATE TABLE Bills(
User_ID INT NOT NULL,
Transaction_code BIGINT NOT NULL,
Bill_type ENUM("water", "electricity", "cable TV", "insureance", "fuel", "hotel bill", "school fees"),
Amount_paid DECIMAL,
Fees_charged DECIMAL(6,2),
FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
FOREIGN KEY (Transaction_code) REFERENCES Transactions(Transaction_code)
); 


INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(58615001, "+233243098364", "Kwesi Asante", "1996-03-06", "Male", "Ghana", "kasante@gmail.com", 3887357855, 0.00, "2021-05-13", 401314, "passport", "2021-05-13");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(28767001, "+233243098364", "Esi Ansah", "1991-07-19", "Female", "Ghana", "esiansah@outlook.com", 6059305571, 4.00, "2020-04-11", 912182, "voters' ID", "2020-04-11");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(29734002, "+250243098364", "Afsanat Ineza", "1998-05-23", "Female", "Rwanda", "InezaAfsanat@gmail.com", 3893658497, 1.00, "2020-04-1", 909687, "national ID", "2020-04-1");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(37985002, "+250243098364", "Paul Kagame", "1999-12-17", "Male", "Rwanda", "kagame@gmail.com", 5332376324, 0.50, "2020-03-21", 826215, "national ID", "2020-03-21");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(81329003, "+234243098364", "Amaka Oluwatomi", "1999-11-19", "Female", "Nigeria", "amaka@gmail.com", 3082204467, 2.00, "2020-03-15", 985745, "voters' ID", "2020-03-15");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(64908004, "+255243098364", "Ambokile Akida", "2000-06-13", "Male", "Tanzania", "ambokile@gmail.com", 7969072679, 00.75, "2020-04-26", 685807, "passport", "2020-04-26");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(33942005, "+256243098364", "Anold Nsubuga", "1998-05-06", "Male", "Uganda", "nsubuga@hotmail.com", 5989918649, 6.00, "2020-06-24", 612777, "passport", "2020-06-24");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(58606005, "+256243098364", "Emmanuel Museveni", "1983-07-19", "Male", "Uganda", "emuseveni@protonmail.com", 3887357855, 3.25, "2020-05-19", 294730, "passport", "2020-05-19");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(35403006, "+279243098364", "Sho Majozi", "1993-10-15", "Female", "South Africa", "majozzz@outlook.com", 6012512595, 1.50, "2020-11-25", 807002, "passport", "2020-11-25");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(50503006, "+273243098364", "Miriam Makeba", "1987-02-20", "Female", "South Africa", "miriammakeba@gmail.com", 5522341722, 3.00, "2020-08-19", 887245, "national ID", "2020-08-19");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(74197007, "+254243098364", "Claris Nadini", "1992-01-30", "Female", "Kenya", "claris.nadini@gmail.com", 5980740115, 20.00, "2020-02-11", 385423, "national ID", "2020-02-11");
INSERT INTO Users(User_ID, Telephone_number, Username, DOB, Gender, Country_name, Email_address, Account_number, Account_balance, Creation_date, Verification_ID, ID_card_used, Verification_date) VALUES(72939007, "+254243098364", "Esther Nzau", "1995-11-11", "Female", "Kenya", "Nesther@gmail.com", 1354481330, 10.00, "2020-01-15", 150824, "voters' ID", "2020-01-15");


INSERT INTO Country(Country_name, Country_location) VALUES("Ghana", "West Africa");
INSERT INTO Country(Country_name, Country_location) VALUES("Rwanda", "Central Africa");
INSERT INTO Country(Country_name, Country_location) VALUES("Nigeria", "West Africa");
INSERT INTO Country(Country_name, Country_location) VALUES("Tanzania", "East Africa");
INSERT INTO Country(Country_name, Country_location) VALUES("Uganda", "East Africa");
INSERT INTO Country(Country_name, Country_location) VALUES("South Africa", "South Africa");
INSERT INTO Country(Country_name, Country_location) VALUES("Kenya", "East Africa");


INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(1256, 328098, "Ghana", "Hubtel", "+233267697534", "mobile money", 1000.00, "12:04:56");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(2698, 668718, "Ghana", "Ecobank", "+233266971584", "credit card", 1450.00, "08:05:46");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(3697, 141350, "Rwanda", "M-Pesa", "+250263654795", "mobile money", 1300.00, "13:15:36");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(4674, 141350, "Rwanda", "M-Pesa", "+250697158545", "mobile money", 670.00, "09:00:06");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(5348, 350946, "Nigeria", "Paystack", "+234784125796", "debit card", 1980.00, "15:34:34");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(6646, 631789, "Tanzania", "Flutterwave", "+255841364785", "debit card", 1500.00, "12:45:37");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(7643, 475848, "Uganda", "Airtel", "+256365468715", "mobile money", 800.00, "09:30:48");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(8977, 475848, "Uganda", "MTN", "+256357168428", "mobile money", 500.00, "13:47:36");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(9642, 220667, "South Africa", "Paygate", "+279713579425", "mobile money", 1200.00, "15:15:49");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(1017, 220667, "South Africa", "Paygate", "+274237913595", "debit card", 2000.00, "11:06:01");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(1195, 141350, "Kenya", "M-Pesa", "+254365584758", "mobile money", 200.00, "10:09:08");
INSERT INTO External_deposits(Deposit_ID, Partner_ID, Country_name, Partner_name, Telephone_number, Deposit_methods, Amount_deposited, TIme_completed) VALUES(12, 141350, "Kenya", "M-Pesa", "+254679423597", "mobile money", 400.00, "16:00:09");


INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(328098, "Ghana", "2016-11-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(668718, "Ghana", "2014-11-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(141350, "Rwanda", "2015-11-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(926354, "Rwanda", "2017-11-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(350946, "Nigeria", "2015-11-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(631789, "Tanzania", "2014-11-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(475848, "Uganda", "2014-11-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(715927, "Uganda", "2016-11-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(220667, "South Africa", "2014-11-15");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(923645, "South Africa", "2016-11-15");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(141350, "Kenya", "2015-10-09");
INSERT INTO OperatesIn(Partner_ID, Country_name, Date_commenced) VALUES(018364, "Kenya", "2014-10-09");


INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(1, "send money", "1000.00", "2020-11-09");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(2, "send money", "1300.00", "2020-02-19");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(3, "send money", "1200.00", "2020-07-30");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(4, "send money", "650.00", "2020-10-18");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(5, "send money", "500.00", "2020-07-30");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(6, "receive money", "200.00", "2020-10-18");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(7, "receive money", "150.00", "2020-11-09");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(8, "send money", "250.00", "2021-10-01");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(9, "buy airtime", "20.00", "2020-03-09");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(10, "send money", "290.00", "2020-04-1");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(11, "pay bill", "180.00", "2020-03-15");
INSERT INTO Transaction_records(Record_number, Transaction_type, Amount_transacted, date_completed) VALUES(12, "send money", "300.00", "2020-04-26");


INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(7934322687, 1, "12:04:51", "12:04:56", 20.00);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(7112489737, 2, "08:05:41", "08:05:46", 26.00);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(1724208700, 3, "13:15:31", "13:15:36", 24.00);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(6740526752, 4, "09:00:01", "09:00:06", 13.00);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(9801835259, 5, "15:34:29", "15:34:34", 10.00);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(8874260087, 6, "12:45:32", "12:45:37", NULL);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(3015114122, 7, "09:30:43", "09:30:48", NULL);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(9372232881, 8, "13:47:31", "13:47:36", 5.00);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(6894399548, 9, "15:15:44", "15:15:49", NULL);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(8237529955, 10, "11:05:56", "11:06:01", 5.80);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(7375702304, 11, "10:09:03", "10:09:08", 2.00);
INSERT INTO Transactions(Transaction_code, Record_number, Time_initiated, Time_completed, Revenue_count) VALUES(8718100571, 12, "16:00:04", "16:00:09", 6.00);


INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("1000.00", "12:04:51", "12:04:56");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("1300.00", "08:05:41", "08:05:46");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("1200.00", "13:15:31", "13:15:36");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("650.00", "09:00:01", "09:00:06");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("500.00", "15:34:29", "15:34:34");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("200.00", "12:45:32", "12:45:37");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("150.00", "09:30:43", "09:30:48");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("250.00", "13:47:31", "13:47:36");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("290.00", "11:05:56", "11:06:01");
INSERT INTO Send_Receive_Ledger(Amount_transfered, Time_sent, Time_received) VALUES("300.00", "16:00:04", "16:00:09");


INSERT INTO Sent(User_ID, Transaction_code, Amount_sent, Fees_charged) VALUES(58615001, 7934322687, "1000.00", 20.00);
INSERT INTO Sent(User_ID, Transaction_code, Amount_sent, Fees_charged) VALUES(58615001, 7934322687, "1300.00", 26.00);
INSERT INTO Sent(User_ID, Transaction_code, Amount_sent, Fees_charged) VALUES(58615001, 7934322687, "1200.00", 24.00);
INSERT INTO Sent(User_ID, Transaction_code, Amount_sent, Fees_charged) VALUES(58615001, 7934322687, "650.00", 13.00);
INSERT INTO Sent(User_ID, Transaction_code, Amount_sent, Fees_charged) VALUES(58615001, 7934322687, "500.00", 10.00);
INSERT INTO Sent(User_ID, Transaction_code, Amount_sent, Fees_charged) VALUES(58615001, 7934322687, "250.00", 5.00);
INSERT INTO Sent(User_ID, Transaction_code, Amount_sent, Fees_charged) VALUES(58615001, 7934322687, "200.00", 5.80);
INSERT INTO Sent(User_ID, Transaction_code, Amount_sent, Fees_charged) VALUES(58615001, 7934322687, "300.00", 6.00);


INSERT INTO Received(User_ID, Transaction_code, Amount_received) VALUES(64908004, 8874260087, "200.00");
INSERT INTO Received(User_ID, Transaction_code, Amount_received) VALUES(33942005, 3015114122, "150.00");


INSERT INTO Bills(User_ID, Transaction_code, Bill_type, Amount_paid, Fees_charged) VALUES(74197007, 7375702304, "electricity", "180.00", "3.60");



-- ChipperCash Queries

CREATE INDEX Users_dx 
ON Users (User_ID);
-- I am indexing the User ID  because it the one with the most relationships and entries.
-- As the data volume grows, it will take longer and longer to search it up. I indexed just the User_iD because it is the unique one and would most likely be referenced most.

CREATE INDEX External_Deposits_idx
ON External_Deposits(Time_completed);
-- This index is also useful because the data grows exponentially over time. Time completed is also most likely a go to choice for selection

CREATE INDEX Transactions_idx
ON Transactions(Transaction_code);
-- Transactions are also another thing that will slow things down with time because it grows. Indexing transactions via the transaction code will provide a great index that affects every part of the table for efficiency

CREATE INDEX Transaction_records_idx
ON Transaction_records(Record_number);
-- The transaction records table also grows fast similarly to the rest. Indexing the record number will make retrieval of queries faster

SELECT Username, Gender, Email_address, Account_balance
FROM users;

SELECT External_Deposits.Country_name, Partner_name, Amount_deposited, Time_completed
FROM External_deposits
INNER JOIN Users ON External_deposits.Country_name = Users.Country_name;

SELECT Transaction_code, Record_number, Time_initiated, External_Deposits.Time_completed
FROM Transactions
FULL JOIN External_deposits ON External_deposits.Time_completed;


SELECT SUM(Revenue_count) AS "total_revenue"
FROM  Transactions;

SELECT User_ID, Amount_sent, Fees_charged
FROM Sent
ORDER BY Amount_sent DESC;

SELECT Username, Gender, Country_name, DOB
FROM users
WHERE DOB > "1998-07-16";

SELECT Partner_name, Country_name, Telephone_number, Deposit_methods
FROM External_deposits
WHERE Partner_name IN ("Hubtel", "M-Pesa");

SELECT Record_number, Transaction_type, Amount_transacted, date_completed
FROM Transaction_records
WHERE Amount_transacted > (
	SELECT AVG(Amount_transacted) FROM Transaction_records);



























