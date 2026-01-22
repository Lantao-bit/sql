-- DML: Data Manipulation Language
-- INSERT INTO <table> (<col1>,<col2>) VALUES(<val1>,<val2>)

INSERT INTP books (title) VALUES ("Romance of the Three ")
UPDATE authors SET date_of_birth="1330-11-11" 
    WHERE author_id = 1 OR author_id = 2;
DELETE FROM authors WHERE author_id = 3;

-- Table Join 
SELECT firstName,lastName, phone, extension, country FROM employees JOIN offices 
   on employees.officeCode = offices.officeCode;

-- Incase columns appear in muitiple tables
SELECT orders.orderNumber, productCode, quantityOrdered, status
FROM orders
JOIN orderdetails
    ON orders.orderNumber = orderdetails.orderNumber;

-- INNER JOIN means rows from the 
-- LEFT JOIN means rows from the LHS are always included
-- RIGHT JOIN means rows from the RHS are always included 

-- Sequence: SELECT, FROM, JOIN, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT, OFFSET

SELECT customerName,
        amount
FROM payments
JOIN customers
    ON payments.customerNumber = customers.customerNumber
WHERE country = "USA"
        AND creditLimit > 100000
ORDER BY  amount DESC LIMIT 10 OFFSET 2;