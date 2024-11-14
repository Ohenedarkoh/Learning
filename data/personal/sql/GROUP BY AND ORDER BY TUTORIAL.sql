SELECT * 
FROM employee_demographics;

SELECT first_name
FROM employee_demographics
GROUP BY first_name ;

SELECT occupation,salary
FROM employee_salary
GROUP BY occupation,salary;


SELECT gender , MIN(age), MAX(age), COUNT(age), AVG(age)
FROM employee_demographics
GROUP BY gender;


SELECT *
FROM employee_demographics;

SELECT *
FROM employee_demographics
ORDER BY gender ;

SELECT *
FROM employee_demographics
ORDER BY gender,age;


SELECT *
FROM employee_demographics
ORDER BY gender DESC,age DESC;


SELECT *
FROM employee_demographics
ORDER BY first_name;
