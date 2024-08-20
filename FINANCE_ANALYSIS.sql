SHOW DATABASES

USE RD

SHOW TABLES

create table revenue 
( Material varchar(30),
pi_amt int);

insert into revenue
values
('Tata Power',50)

insert into revenue
values
('Suzlon',20),
('Adani',1),
('Tata Motors',1),
('Tata Steel',16),
('Ola',6);

select * from revenue

select Material,sum(pi_amt) as
TOTAL_SHARES from revenue 
group by Material 
having sum(pi_amt)>10
order by TOTAL_SHARES desc


insert into revenue
values
('Suzlon',20)

select distinct(Material),pi_amt from revenue

SELECT *,
	CASE
		WHEN pi_amt > 10 THEN 'High Investment'
		WHEN pi_Amt > 5 AND pi_amt <= 10 THEN 'Medium Investment'
		ELSE 'Very Low Investment'
	END AS Investment_category
FROM revenue

SELECT * FROM REVENUE

ALTER TABLE REVENUE ADD COLUMN BUY_PRICE INT  
ALTER TABLE REVENUE ADD COLUMN CURRENT_PRICE INT 

DESC REVENUE

SET SQL_SAFE_UPDATES = 0;
-- update revenue set BUY_PRICE = 139,CURRENT_PRICE = 152 WHERE Material = "Tata Power"
update revenue set BUY_PRICE = 39,CURRENT_PRICE = 80 WHERE Material = "Suzlon"
update revenue set BUY_PRICE = 900,CURRENT_PRICE = 1200 WHERE Material = "Adani"
update revenue set BUY_PRICE = 950,CURRENT_PRICE = 1100 WHERE Material = "Tata Motors"
update revenue set BUY_PRICE = 307,CURRENT_PRICE = 430 WHERE Material = "Tata Steel"
update revenue set BUY_PRICE = 89,CURRENT_PRICE = 155 WHERE Material = "Ola"


SELECT *, 
       (CURRENT_PRICE - BUY_PRICE) AS DIFF,
       ROUND(((CURRENT_PRICE - BUY_PRICE) / BUY_PRICE) * 100,0) 
       AS ROI
FROM REVENUE;

ALTER TABLE REVENUE
ADD COLUMN DIFF INT,
ADD COLUMN ROI INT

UPDATE REVENUE SET
DIFF = (CURRENT_PRICE - BUY_PRICE),
ROI = ROUND(((CURRENT_PRICE - BUY_PRICE) / BUY_PRICE) * 100,0)

SELECT * FROM REVENUE

SELECT *,
	CASE
		WHEN ROI =0 THEN 'POSITVE RETURN'
		WHEN ROI >= 20 THEN 'HIGHER RETURN'
		WHEN ROI > 1 AND ROI < 20 THEN 'AVERAGE RETURN'
		ELSE 'NEGATIVE RETURN'
	END AS RETURN_CATEGORY
FROM REVENUE

SELECT AVG(ROI) AS AVERGAE_RETURN FROM REVENUE

SELECT * FROM REVENUE ORDER BY DIFF DESC

SELECT COUNT(Material) as Total_Stocks,SUM(DIFF) AS TOTAL_PROFIT FROM REVENUE



