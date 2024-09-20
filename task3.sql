
-- q1 
SELECT AVG(balance) AS average_balance
FROM accounts;

-- q2
SELECT customer_id, balance
FROM accounts
ORDER BY balance DESC
LIMIT 10;

-- q3 
SELECT SUM(amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'deposit' 
  AND transaction_date = '2024-09-19';


-- q4
SELECT customer_id, first_name, last_name, DOB
FROM customers
ORDER BY DOB ASC
LIMIT 1;
SELECT customer_id, first_name, last_name, DOB
FROM customers
ORDER BY DOB DESC
LIMIT 1;

-- q5
SELECT t.transaction_id, t.transaction_type, t.amount, t.transaction_date, a.account_type
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id;

-- q6
SELECT 
    c.customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email, 
    c.phone_number, 
    a.account_id, 
    a.account_type, 
    a.balance
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
ORDER BY 
    c.customer_id;

-- q7
SELECT 
    c.customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_id, 
    a.account_type, 
    t.transaction_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    a.account_id = 1;  -- Replace with the specific account_id

-- q8
SELECT customer_id, COUNT(account_id) AS num_accounts
FROM accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1;

-- q9
SELECT account_id, 
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) -
       SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS balance_difference
FROM transactions
GROUP BY account_id;

-- q10
SELECT 
    a.account_id, 
    a.account_type, 
    AVG(a.balance) AS average_balance
FROM 
    Accounts a
JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.transaction_date BETWEEN '2024-01-01' AND '2024-01-31'  -- Replace with your desired dates
GROUP BY 
    a.account_id, a.account_type;

-- q11
SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

-- q12
SELECT account_id, COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY account_id
ORDER BY transaction_count DESC;

-- q13
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
       a.account_type, SUM(a.balance) AS total_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, a.account_type
HAVING SUM(a.balance) > 10000  -- Replace 10000 with your high balance threshold
ORDER BY total_balance DESC;

-- q14
SELECT 
    t.account_id, 
    t.amount, 
    t.transaction_date, 
    COUNT(*) AS duplicate_count
FROM 
    Transactions t
GROUP BY 
    t.account_id, t.amount, t.transaction_date
HAVING 
    COUNT(*) > 1
ORDER BY 
    t.transaction_date, t.account_id;
