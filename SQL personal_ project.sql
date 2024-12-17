---retrieve data from a table
SELECT *
     FROM
	      employee_demographics;

SELECT DISTINCT first_name
            FROM
	           employee_demographics;S


SELECT *
        FROM
		     employee_salary
        WHERE
		first_name = 'Leslie';

SELECT *
        FROM
		     employee_salary
        WHERE
		     Salary >50000;

SELECT *
        FROM
	     	employee_demographics
	   WHERE
	        Gender ='female';

SELECT *
        FROM
	     	employee_demographics
	   WHERE
	        Gender !='female';

SELECT *
        FROM
	     	employee_demographics
	   WHERE
	        Birth_date > '1985-01-01';

---Logical operators AND OR NOT
SELECT *
        FROM
	     	employee_demographics
	   WHERE
	        Birth_date > '1985-01-01'
	AND gender = 'Male';

SELECT *
        FROM
	     	employee_demographics
	   WHERE
	        Birth_date > '1985-01-01'
		OR gender = 'Male';

SELECT *
        FROM
	     	employee_demographics
	   WHERE first_name LIKE 'jer%';

SELECT *
        FROM
	     	employee_demographics
	   WHERE first_name LIKE '%er%';

SELECT *
        FROM
	     	employee_demographics
	   WHERE first_name LIKE 'a%';



SELECT *
        FROM
	     	employee_demographics
	   WHERE first_name LIKE 'a__';

SELECT gender, AVG(age) AS Average_age
        FROM
	     	employee_demographics
GROUP BY 
        gender; 


SELECT gender, MAX(age) AS Maximum_age
 FROM
	 employee_demographics
GROUP BY 
          gender; 


---Orderby

SELECT *
        FROM
	     	employee_demographics
ORDER BY First_name ASC;

SELECT *
        FROM
	     	employee_demographics
ORDER BY gender, age;


SELECT 
     TOP 3 *
FROM employee_demographics;

---JOINS
SELECT
      *
FROM employee_demographics AS dem
       INNER JOIN employee_salary AS sal
             ON dem.employee_id = sal.employee_id;

SELECT
      *
FROM employee_demographics AS dem
       RIGHT JOIN employee_salary AS sal
             ON dem.employee_id = sal.employee_id;

UNION
SELECT
     first_name,
	 last_name
FROM employee_demographics
UNION
SELECT
     first_name,
	 last_name
FROM employee_salary;

SELECT
     first_name,
	 last_name
FROM employee_demographics
UNION ALL
SELECT
     first_name,
	 last_name
FROM employee_salary;