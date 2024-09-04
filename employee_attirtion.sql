SELECT * FROM employee_attrition;
use employee_attrition_new;
set sql_safe_updates=0;
select * from employee_attrition;
select count(*) from employee_attrition;
select count(*) from employee_attrition where attrition = 'No';
alter table employee_attrition add column department1 varchar(100);
UPDATE employee_attrition
SET department1 = CASE
  WHEN attrition = 'no' THEN department
  ELSE department1
END;
alter table employee_attrition add column department2 varchar(100);
UPDATE employee_attrition
SET department2 = CASE
  WHEN attrition = 'yes' THEN department
  ELSE department2
END;
SELECT age
FROM employee_attrition
WHERE department = department2;
SELECT educationfield
FROM employee_attrition
WHERE department = department2;
SELECT department, COUNT(*) as count_no_attrition
FROM employee_attrition
WHERE attrition = 'yes'
GROUP BY department;
SELECT educationfield,department2 
FROM employee_attrition
WHERE department2 IS NOT NULL;
alter table employee_attrition add column education1 varchar(100);
ALTER TABLE employee_attrition
CHANGE COLUMN education1 education_yes varchar(100);
UPDATE employee_attrition
SET education_yes = CASE
  WHEN attrition = 'yes' THEN educationfield
  ELSE education_yes
END;
UPDATE employee_attrition
SET education_yes = NULL;
SELECT educationfield, COUNT(*) as count_no_attrition
FROM employee_attrition
WHERE attrition = 'yes'
GROUP BY educationfield;
SELECT jobrole, COUNT(*) as count_no_attrition
FROM employee_attrition
WHERE attrition = 'yes'
GROUP BY jobrole;
SELECT gender, COUNT(*) as count_no_attrition
FROM employee_attrition
WHERE attrition = 'yes'
GROUP BY gender;
SELECT MAX(monthlyrate) AS highest_salary
FROM employee_attrition;
SELECT a.attrition,a.monthlyrate
FROM employee_attrition a
JOIN (
  SELECT attrition, MAX(monthlyrate) AS max_monthlyrate
  FROM employee_attrition
  GROUP BY attrition
) b
ON a.attrition = b.attrition AND a.monthlyrate = b.max_monthlyrate;
SELECT MAX(monthlyrate) AS max_salary, MIN(monthlyrate) AS min_salary
FROM employee_attrition
WHERE attrition = 'Yes';
SELECT maritalstatus, COUNT(*) AS count_attrition_yes
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY maritalstatus;






