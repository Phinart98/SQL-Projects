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



