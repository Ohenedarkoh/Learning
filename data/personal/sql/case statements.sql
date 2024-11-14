SELECT *
FROM employee_demographics;




SELECT first_name,
 last_name, 
CASE 
	WHEN age < 30 THEN 'young'
    WHEN age > 40 THEN 'old'
    WHEN age BETWEEN 30 AND 50 THEN 'middle aged'
    WHEN age >= 50 THEN "The beginning of the end"
END AS Age_class
FROM  employee_demographics;



SELECT first_name,
last_name,
salary, 
dept_id,
CASE
  WHEN salary < 45000 THEN salary + (salary * 0.05)
  WHEN salary > 45000 THEN salary + ( salary * 0.07)
END AS new_salary,
CASE
	 WHEN dept_id ='6' THEN salary + (salary * 0.1)
END AS bonus
FROM employee_salary;



select dept_id
from employee_salary;