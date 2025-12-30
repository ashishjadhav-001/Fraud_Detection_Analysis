use fraud_transaction;
select * from new_transaction;

-- Q1. How many total transactions are in the dataset?
SELECT COUNT(*) AS total_transaction FROM new_transaction;

-- Q2. How many fraud transactions occurred?
SELECT COUNT(*) AS fraud_count from new_transaction
where is_fraud=1;

-- Q3. What percentage of transactions are fraudulent?
SELECT 
(SUM(is_fraud)/count(*))*100 as fraud_percentage
from new_transaction;

-- Q4. What is the average transaction amount? 
SELECT AVG(amount) as avg_transaction_amount 
FROM new_transaction;

-- Q5. What is the average amount of fraud transactions only? 
SELECT AVG(amount) AS avg_fraud_amount
FROM new_transaction
WHERE is_fraud = 1;

-- Q6. Fraud count by hour of the day
SELECT hour, COUNT(*) AS fraud_count
FROM new_transaction
WHERE is_fraud = 1
GROUP BY hour
ORDER BY fraud_count DESC;

-- Q7. Which day has the most fraud cases?
SELECT day_of_week, COUNT(*) AS fraud_count
FROM new_transaction
WHERE is_fraud = 1
GROUP BY day_of_week
ORDER BY fraud_count DESC;

-- Q8. What is the highest amount involved in a fraud transaction?
SELECT MAX(amount) AS max_fraud_amount
FROM new_transaction
WHERE is_fraud = 1;

-- Q9. List all international transactions that are fraudulent.
SELECT *
FROM new_transaction
WHERE is_fraud = 1 AND international_flag = 1;

-- Q10. How many high-amount transactions (> ₹50,000) were fraudulent?
SELECT COUNT(*) AS high_value_fraud
FROM new_transaction
WHERE is_fraud = 1 AND high_amount_flag = 1;

-- Q11. Total amount lost due to fraud
SELECT SUM(amount) AS total_fraud_loss
FROM new_transaction
WHERE is_fraud = 1;

-- Q12. Top 10 highest amount fraud transactions.
SELECT *
FROM new_transaction
WHERE is_fraud = 1
ORDER BY amount DESC
LIMIT 10;





