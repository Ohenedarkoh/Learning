SELECT *
FROM employee_demographics;


SELECT * 
FROM employee_salary;

SELECT dem.employee_id,age,occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON 	dem.employee_id= sal.employee_id;
    
    
    
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id= sal.employee_id;
    
    
SELECT dem.employee_id,age,occupation
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id= sal.employee_id;
    
    
    