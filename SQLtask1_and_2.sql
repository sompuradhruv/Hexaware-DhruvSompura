create database HMBank;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type ENUM('savings', 'current', 'zero_balance') NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type ENUM('deposit', 'withdrawal', 'transfer') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- q1 Insert at least 10 sample records into each table

INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address)
VALUES
('John', 'Doe', '1985-04-12', 'john.doe@example.com', '1234567890', '123 Main St, New York'),
('Jane', 'Smith', '1990-06-18', 'jane.smith@example.com', '2345678901', '456 Park Ave, New York'),
('Raj', 'Patel', '1987-11-22', 'raj.patel@example.com', '3456789012', '789 Maple St, Los Angeles'),
('Sara', 'Williams', '1995-08-08', 'sara.williams@example.com', '4567890123', '12 King St, Chicago'),
('Priya', 'Shah', '1992-03-15', 'priya.shah@example.com', '5678901234', '34 Queen St, Miami'),
('Michael', 'Brown', '1988-09-05', 'michael.brown@example.com', '6789012345', '56 Elm St, Dallas'),
('Emily', 'Davis', '1993-12-25', 'emily.davis@example.com', '7890123456', '78 Pine St, Houston'),
('Utkarsh', 'Kumar', '1994-10-02', 'utkarsh.kumar@example.com', '8901234567', '90 Oak St, Boston'),
('Raj', 'Mehta', '1989-01-30', 'raj.mehta@example.com', '9012345678', '11 Birch St, San Francisco'),
('Lisa', 'Johnson', '1986-05-20', 'lisa.johnson@example.com', '0123456789', '22 Cedar St, Seattle');

INSERT INTO Accounts (customer_id, account_type, balance)
VALUES
(1, 'savings', 5000.00),
(2, 'current', 1200.50),
(3, 'savings', 3500.75),
(4, 'current', 500.00),
(5, 'savings', 7000.00),
(6, 'zero_balance', 0.00),
(7, 'current', 1500.25),
(8, 'savings', 8200.00),
(9, 'current', 2200.50),
(10, 'savings', 0.00);

INSERT INTO Transactions (account_id, transaction_type, amount)
VALUES
(1, 'deposit', 1000.00),
(2, 'withdrawal', 200.00),
(3, 'deposit', 500.00),
(4, 'withdrawal', 100.00),
(5, 'deposit', 2500.00),
(6, 'deposit', 0.00),
(7, 'deposit', 750.00),
(8, 'deposit', 2000.00),
(9, 'withdrawal', 1000.00),
(10, 'deposit', 0.00);


-- q1 Retrieve the name, account type, and email of all customers

SELECT first_name, last_name, account_type, email
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

-- q2 List all transactions corresponding to each customer

SELECT c.first_name, c.last_name, t.transaction_type, t.amount, t.transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id;

-- q3 Increase the balance of a specific account by a certain amount

UPDATE Accounts
SET balance = balance + 500.00  
WHERE account_id = 1; 


-- q5 Remove accounts with a balance of zero where the account type is savings

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Accounts
WHERE balance = 0.00 AND account_type = 'savings';

-- q6 Find customers living in a specific city

SELECT first_name, last_name, email
FROM Customers
WHERE address LIKE '%New York%';  

-- q7 Get the account balance for a specific account

SELECT balance
FROM Accounts
WHERE account_id = 2;  -- Specify the account_id

-- q8 List all current accounts with a balance greater than $1,000

SELECT customer_id, balance
FROM Accounts
WHERE account_type = 'current' AND balance > 1000.00;

-- q9 Retrieve all transactions for a specific account

SELECT transaction_type, amount, transaction_date
FROM Transactions
WHERE account_id = 3;  
 
-- q10 Calculate the interest accrued on savings accounts based on a given interest rate

SELECT account_id, balance, (balance * 0.07) AS interest_accrued  
FROM Accounts
WHERE account_type = 'savings';
 
-- q11 Identify accounts where the balance is less than a specified overdraft limit

SELECT account_id, balance
FROM Accounts
WHERE balance < -500.00; 


-- q12 Find customers not living in a specific city

SELECT first_name, last_name, address
FROM Customers
WHERE address NOT LIKE '%New York%'; 

