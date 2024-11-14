CREATE PROCEDURE large_salaries()

SELECT *
FROM employee_salary
WHERE salary >= 60000;


