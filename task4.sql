-- 1. Retrieve the customer(s) with the highest account balance:
SELECT C.customer_id, C.first_name, C.last_name, A.balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
WHERE A.balance = (SELECT MAX(balance) FROM Accounts);

-- 2. Calculate the average account balance for customers who have more than one account:
SELECT customer_id, AVG(balance) AS average_balance
FROM Accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1;

-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount:
SELECT account_id, transaction_type, amount
FROM Transactions
WHERE amount > (SELECT AVG(amount) FROM Transactions);

-- 4. Identify customers who have no recorded transactions:
SELECT C.customer_id, C.first_name, C.last_name
FROM Customers C
WHERE NOT EXISTS (
    SELECT 1
    FROM Accounts A
    JOIN Transactions T ON A.account_id = T.account_id
    WHERE C.customer_id = A.customer_id
);

-- 5. Calculate the total balance of accounts with no recorded transactions:
SELECT SUM(balance) AS total_balance
FROM Accounts A
WHERE NOT EXISTS (
    SELECT 1
    FROM Transactions T
    WHERE A.account_id = T.account_id
);

-- 6. Retrieve transactions for accounts with the lowest balance:
SELECT T.*
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
WHERE A.balance = (SELECT MIN(balance) FROM Accounts);

-- 7. Identify customers who have accounts of multiple types:
SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1;

-- 8. Calculate the percentage of each account type out of the total number of accounts:
SELECT account_type, 
       COUNT(account_id) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM Accounts
GROUP BY account_type;

-- 9. Retrieve all transactions for a customer with a given customer_id:
SELECT T.*
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
WHERE A.customer_id = customer_id;

-- 10. Calculate the total balance for each account type, including a subquery within the SELECT clause:
SELECT account_type, 
       (SELECT SUM(balance) FROM Accounts WHERE account_type = A.account_type) AS total_balance
FROM Accounts A
GROUP BY account_type;


