SELECT first_name, LENGTH(first_name)
FROM employee_demographics;


SELECT UPPER('sky');

SELECT first_name, lower(first_name)
FROM employee_demographics;


SELECT LTRIM('     I           love          SQL');


SELECT LTRIM('			I LOVE SQL');


SELECT LEFT('alexander',4);


SELECT first_name, left(first_name,4)
FROM employee_demographics;


SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;
