-- Sequence: SELECT, FROM, JOIN, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT, OFFSET

SELECT customerName,
        amount
FROM payments
JOIN customers
    ON payments.customerNumber = customers.customerNumber
WHERE country = "USA"
        AND creditLimit > 100000
ORDER BY  amount DESC LIMIT 10 OFFSET 2;


-- Year, month function 
SELECT YEAR(paymentDate),MONTH(paymentDate),DAY(paymentDate) FROM payments;
SELECT * FROM payments WHERE YEAR(paymentDate) = 2004 AND MONTH(paymentDate) = 10;

-- aggregation: count, sum, min, max, avg, count 
SELECT COUNT(*) FROM employees;    -- how many employees there
SELECT SUM(amount) FROM payments;  -- total
SELECT AVG(amount) FROM payments;  -- average
SELECT AVG(creditLimit) FROM customers where creditLimit >0; 
SELECT MAX(creditLimit) FROM customers;
SELECT *
FROM customers WHERE creditLimit = 
    (SELECT max(creditLimit) FROM customers);

-- group by - for a <catagory>, I want to know an <aggregate>
-- for each office, I want to know the total number of employees
SELECT count(*), officeCode FROM employees group by officeCode;

-- for each country, I want to know how many office 
SELECT count(*), country FROM offices group by country; 

-- SQL Steps
-- 1. SELECT DISTINCT country FROM offices; 
-- 2. Create one group for 

SELECT count(*), country FROM customers GROUP BY country;

-- For each country, show how many employees

SELECT country, COUNT(*)
FROM employees join offices 
ON employees.officeCode = offices.officeCode
WHERE jobTitile = "Sales Rep"
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 3;

-- for each country, show the avg creditLimit of the customers
-- and only show country where the average crdit limit >= 25k
SELECT country, AVG(creditLimit) COUNT(*)
FROM country
HAVING AVG(creditLimit) >= 25000;

-- 
ELECT customerNumber, COUNT(*) FROM payments
GROUP BY customerNumber
HAVING COUNT(*) >=3;

-- show how much revenue is made in each of month of 2004
-- show how much revenue is made in each of month of 2004
SELECT YEAR(paymentDate), Month(paymentDate), SUM(amount)  
FROM payments
WHERE YEAR(paymentDate) = 2004
GROUP BY ;

-- find the top three salesperson IN terms of revenue IN the year 2004 -- -- IN the country of USA
-- and the salesperson must have made at least 100000 --
SELECT employeeNumber,
       employees.firstName,
       employees.lastName,
       SUM(amount)
FROM employees 
 JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
 JOIN payments ON customers.customerNumber = payments.customerNumber
WHERE country = "USA" AND YEAR(paymentDAte) = 2004
GROUP BY  employeeNumber, employees.firstName, employees.lastName
HAVING sum(amount) >= 100000 
ORDER BY sum(amount) DESC
LIMIT 3;

SELECT employeeNumber,
         firstName,
         lastName,
         sum(amount)
FROM employees
JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN payments ON customers.customerNumber = payments.customerNumber
WHERE customers.country = "USA" AND YEAR(paymentDate) = 2004
GROUP BY  employeeNumber, firstName, lastName
HAVING SUM(amount) >= 10000
ORDER BY  SUM(amount) DESC LIMIT 3 ;