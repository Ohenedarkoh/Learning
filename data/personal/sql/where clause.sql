
SELECT * 
FROM employee_salary
WHERE salary > 50000;


SELECT *
FROM sys.employee_salary
WHERE salary >= 50000;


SELECT *
FROM employee_demographics
WHERE gender ='Female';

SELECT *
FROM employee_demographics
WHERE gender !='Female';


SELECT *
FROM employee_demographics
WHERE birth_rate > '1985-01-01';



SELECT *
FROM employee_demographics
WHERE first_name LIKE '%an%';



