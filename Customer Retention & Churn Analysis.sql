CREATE database Customer_Churn_Analysis;

SHOW TABLES;
describe `bank customer churn prediction`;
RENAME TABLE `Bank Customer Churn Prediction` TO churn_data;
describe churn_data;

-- Cleaning of the data --
-- 1. Checking for Duplicates --
SELECT customer_id, count(*)
FROM churn_data
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Finding missing values--
SELECT * 
FROM churn_data
WHERE customer_id IS NULL
OR credit_score IS NULL
OR country IS NULL
OR gender IS NULL
OR age IS NULL
OR tenure IS NULL
OR balance IS NULL
OR products_number IS NULL
OR credit_card IS NULL
OR active_member IS NULL
OR estimated_salary IS NULL
OR churn IS NULL;

-- Checking for Outliers --
SELECT *
FROM churn_data
WHERE credit_score < 300 OR credit_score > 850
	OR age < 18 OR age > 100
    OR balance < 0;
    
-- Exploratory Data Analysis (EDA) --
-- Understanding the proportion of churned vs retained customers:
SELECT churn, COUNT(*) As Count 
FROM churn_data
GROUP BY churn;

-- Analyze Credit Score Distribution --
SELECT 
	FLOOR(credit_score /50) * 50 AS score_range,
    COUNT(*) AS count
FROM churn_data
GROUP BY score_range
ORDER BY score_range;

-- Gender-wise Churn Rate -- 
SELECT gender,churn,Count(*) As count
FROM churn_data
GROUP BY gender, churn;

-- Tenure vs. Churn --
SELECT tenure, churn, COUNT(*) AS COUNT
FROM churn_data
GROUP BY tenure, churn
ORDER BY tenure;

-- Average Balance by Churn --
SELECT churn, AVG(balance) AS avg_bal
FROM churn_data
GROUP BY churn;

-- Country-wise Churn Analysis --
SELECT country, churn, count(*) AS count
FROM churn_data
GROUP BY country, churn
ORDER BY country;

SELECT COUNT(*) 
FROM churn_data;

SELECT * 
FROM churn_data LIMIT 10;

SELECT * 
FROM churn_data;
