-- Step 1: Show all present databases
SHOW DATABASES;


-- Step 2: Use the specific database
USE RD;


-- Step 3: Show all tables in the database
SHOW TABLES;


-- Step 4: Create the `revenue` table
CREATE TABLE revenue (
    Material VARCHAR(30),
    pi_amt INT
);


-- Step 5: Insert initial data into `revenue`
INSERT INTO revenue VALUES ('Tata Power', 50);
INSERT INTO revenue VALUES 
('Suzlon', 20),
('Adani', 1),
('Tata Motors', 1),
('Tata Steel', 16),
('Ola', 6);


-- Step 6: View the inserted data
SELECT * FROM revenue;


-- Step 7: Group by Material with sum and filtering
SELECT Material, SUM(pi_amt) AS TOTAL_SHARES
FROM revenue 
GROUP BY Material 
HAVING SUM(pi_amt) > 10
ORDER BY TOTAL_SHARES DESC;


-- Step 8: Insert additional data
INSERT INTO revenue VALUES ('Suzlon', 20);


-- Step 9: Select distinct Material
SELECT DISTINCT(Material), pi_amt FROM revenue;


-- Step 10: Use CASE to categorize investments
SELECT *,
    CASE
        WHEN pi_amt > 10 THEN 'High Investment'
        WHEN pi_amt > 5 AND pi_amt <= 10 THEN 'Medium Investment'
        ELSE 'Very Low Investment'
    END AS Investment_category
FROM revenue;


-- Step 11: View table structure
DESC REVENUE;


-- Step 12: Alter table to add `BUY_PRICE` and `CURRENT_PRICE` columns
ALTER TABLE REVENUE ADD COLUMN BUY_PRICE INT;
ALTER TABLE REVENUE ADD COLUMN CURRENT_PRICE INT;


-- Step 13: Update the table with price data
SET SQL_SAFE_UPDATES = 0;
UPDATE revenue SET BUY_PRICE = 139, CURRENT_PRICE = 152 WHERE Material = 'Tata Power';
UPDATE revenue SET BUY_PRICE = 39, CURRENT_PRICE = 80 WHERE Material = 'Suzlon';
UPDATE revenue SET BUY_PRICE = 900, CURRENT_PRICE = 1200 WHERE Material = 'Adani';
UPDATE revenue SET BUY_PRICE = 950, CURRENT_PRICE = 1100 WHERE Material = 'Tata Motors';
UPDATE revenue SET BUY_PRICE = 307, CURRENT_PRICE = 430 WHERE Material = 'Tata Steel';
UPDATE revenue SET BUY_PRICE = 89, CURRENT_PRICE = 155 WHERE Material = 'Ola';


-- Step 14: Calculate and update DIFF and ROI columns
SELECT *, 
       (CURRENT_PRICE - BUY_PRICE) AS DIFF,
       ROUND(((CURRENT_PRICE - BUY_PRICE) / BUY_PRICE) * 100, 0) AS ROI
FROM REVENUE;


ALTER TABLE REVENUE ADD COLUMN DIFF INT, ADD COLUMN ROI INT;


UPDATE REVENUE SET
DIFF = (CURRENT_PRICE - BUY_PRICE),
ROI = ROUND(((CURRENT_PRICE - BUY_PRICE) / BUY_PRICE) * 100, 0);


-- Step 15: Categorize ROI using CASE
SELECT *,
    CASE
        WHEN ROI = 0 THEN 'POSITIVE RETURN'
        WHEN ROI >= 20 THEN 'HIGHER RETURN'
        WHEN ROI > 1 AND ROI < 20 THEN 'AVERAGE RETURN'
        ELSE 'NEGATIVE RETURN'
    END AS RETURN_CATEGORY
FROM REVENUE;


-- Step 16: Calculate the average ROI
SELECT AVG(ROI) AS AVERAGE_RETURN FROM REVENUE;


-- Step 17: Order data by difference (profit) descending
SELECT * FROM REVENUE ORDER BY DIFF DESC;


-- Step 18: Count total stocks and sum of profits
SELECT COUNT(Material) AS Total_Stocks, SUM(DIFF) AS TOTAL_PROFIT FROM REVENUE;
