-----Day 1 SQL-----


CREATE database employee;
GO

USE employee;
GO

CREATE table department
(
dep_id INTEGER primary key,
dep_name VARCHAR(20),
dep_location VARCHAR(15),
);
SELECT * from department;




CREATE table salarygrade
(
grade INTEGER,
min_salary INTEGER,
max_salary INTEGER,
);
SELECT * from salarygrade;



CREATE table emplyees
(
emp_id INTEGER,
emp_name VARCHAR(15),
job_name VARCHAR(10),
manager_id INTEGER,
hire_date DATE,
salary DECIMAL(10, 2),
commission DECIMAL(7,2),
dep_id INTEGER,
CONSTRAINT dep_id_fk FOREIGN KEY (dep_id) REFERENCES department(dep_id)
);

SELECT * from department;
insert into department values ( 1001,'FINANCE','SYDNEY')
insert into department values ( 2001,'AUDIT ','MELBOURNE')
insert into department values ( 3001,'MARKETING','PERTH')
insert into department values ( 4001,'PRODUCTION','BRISBANE')


SELECT * from salarygrade;
insert into salarygrade values ( 1,800,1300)
insert into salarygrade values ( 2,1301 ,1500)
insert into salarygrade values ( 3,1501,2100)
insert into salarygrade values ( 4,2101 ,3100)
insert into salarygrade values ( 5,3101 ,9999)

	
SELECT * from emplyees;
insert into emplyees values (68319,'KAYLING','PRESIDENT',null,'1991-11-18',6000.00,null,1001);
insert into emplyees values (66928,'BLAZE','MANAGER',68319, '1991-05-01',2750.00 ,null,3001);
insert into emplyees values (67832,'CLARE','MANAGER',68319, '1991-06-09',2550.00 ,null,1001);
insert into emplyees values (65646,'JONAS','MANAGER',68319, '1991-04-02',2957.00 ,null,2001);
insert into emplyees values (67858,'SCARLET','ANALYST',65646,'1997-04-19' ,3100.00,null,2001);
insert into emplyees values (69062,'FRANK','ANALYST',65646,'1991-12-03' ,3100.00,null,2001);
insert into emplyees values (63679,'SANDRINE','CLERK',69062,'1990-12-18' ,900.00,null,2001);
insert into emplyees values (64989,'ADELYN','SALESMAN',66928,'1991-02-20' ,1700.00,400.00,3001);
insert into emplyees values (65271,'WADE','SALESMAN',66928,'1991-02-22' ,1350.00,600.00,3001);
insert into emplyees values (66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350.00,1500.00,3001);
insert into emplyees values (68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600.00, 0.00 ,3001);
insert into emplyees values (68736,'ADNRES',' CLERK',67858,'1997-05-23',1200.00, 0.00 ,2001);
insert into emplyees values ( 69000,'JULIUS',' CLERK',66928,'1991-12-03',1050.00, null ,3001);
insert into emplyees values ( 69324,'MARKER',' CLERK',67832,'1992-01-23',1400.00, null ,1001);
--Q1   find the salaries of all employees. Return salary.
SELECT salary FROM emplyees;
--Q2  find the unique designations of the employees. Return job name
SELECT DISTINCT job_name
FROM emplyees;
--Q3 find the unique designations of the employees. Return job name
SELECT job_name FROM emplyees;
--Q4  list the employees’ name, increased their salary by 15%
SELECT emp_name, salary * 1.15 AS increased_salary
FROM emplyees;

--Q5 list the employee's name and job name as a format of "Employee & Job"
SELECT concat(emp_name,'&',job_name ) AS "employee & job" FROM emplyees;
--Q6 find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
SELECT emp_id, emp_name, salary,
CONVERT(VARCHAR(20), hire_date,107) AS hire_date
FROM emplyees
--Q7 count the number of employees who have total income more than 2200
SELECT COUNT(*)
FROM emplyees
WHERE salary > 2200;

--Q8 find the unique jobs with their corresponding department id.
SELECT DISTINCT job_name, dep_id
FROM emplyees;



--Q9find those employees who do not belong to the department 2001.
SELECT *
FROM emplyees
WHERE dep_id != 2001;

-- Q10 find those employees who joined before 1991
SELECT *
FROM emplyees
WHERE hire_date < '1991-01-01';


--Q11 calculate the average salary of employees who work as analysts. Return average salary
SELECT AVG (salary)
FROM emplyees
WHERE job_name= 'ANALYST';


--Q12 find the details of the employees who's name start  with B or end with E
SELECT *
FROM emplyees
WHERE emp_name LIKE 'B%' OR emp_name LIKE '%E';


--Q13 find the details of the employees who's department name  start with B or end with E
SELECT emplyees. *,department.dep_name
from emplyees
JOIN department
ON emplyees.dep_id = department.dep_id
WHERE dep_name LIKE 'B%' OR dep_name LIKE '%E';


--Q14 find the details of the employees who's department location  start with F or end with N
SELECT emplyees. *,department.dep_location
from emplyees
JOIN department
ON emplyees.dep_id = department.dep_id
WHERE dep_location LIKE 'F%' OR dep_location LIKE '%N';

--Q15 identify employees whose commissions exceed their salaries. Return complete information about the employees, department location and department name
SELECT emplyees.* , department.dep_location,department.dep_name
FROM emplyees
JOIN department
ON emplyees.dep_id = department.dep_id
WHERE  emplyees.commission > salary

--Q16  identify those employees whose salaries exceed 3000 after receiving a 25% salary increase

SELECT emplyees.emp_name, salary, (salary * 1.25) AS new_salary_after_increasing
FROM emplyees
WHERE (salary * 1.25) > 3000;

--Q17 find out which employees joined in the month of January. Return complete information about the employees

SELECT *
FROM emplyees
WHERE MONTH (hire_date) = 1;

--Q18 separate the names of employees and their managers by the string 'works for'
SELECT concat (emp_name, ' works for ' , manager_id) AS works_for
 FROM emplyees

 --Q19 find those employees whose designation is ‘CLERK’. Return complete information about the employees
 SELECT * FROM emplyees WHERE job_name = 'CLERK' 
 

 --Q20 identify employees with more than 27 years of experience. Return complete information about the employees.
 SELECT *
 FROM emplyees
 WHERE DATEDIFF(YEAR, hire_date, GETDATE())>27;

 --Q21  find those employees whose salaries are less than 3500. Return complete information about the employees.
 SELECT *
 from emplyees
 WHERE salary<3500;

 --Q22 find the employee whose designation is ‘ANALYST’. Return employee name, job name and salary
 SELECT emp_name, job_name,salary
 FROM emplyees
 where job_name= 'analyst';

 --Q23 identify those employees who joined the company in 1991. Return complete information about the employees
 SELECT *
 FROM emplyees
 WHERE YEAR (hire_date)=1991;
 
 --Q24 identify those employees who joined the company after 1991.Return complete information about the employees.
  SELECT *
 FROM emplyees
 WHERE YEAR (hire_date)>1991;
 
 --Q25 find those employees who joined before 1st April 1991.Return employee ID, employee name, hire date and salary.
 SELECT *
 FROM emplyees
  WHERE hire_date < '1991-04-01';

  --Q26 identify the employees who do not report to a manager. Return employee name, job name
  SELECT emp_name,job_name
  FROM emplyees
  WHERE manager_id IS NULL;

  --Q27  find the employees who joined on the 1st of May 1991. Return complete information about the employees
  SELECT *
  FROM emplyees
  WHERE hire_date = '1991-05-01'

  --Q28 identify the experience of the employees who work under the manager whose ID number is 68319. Return employee ID, employee name, salary, experience
  SELECT emp_id, emp_name, salary,DATEDIFF(YEAR, hire_date, GETDATE()) AS experiance
  FROM  emplyees
  WHERE manager_id =68319;


  --Q29 find out which employees earn more than 100 per day as a salary. Return employee ID, employee name, salary, and experience.
  SELECT emp_id, emp_name, salary, (salary / 365) AS daily_salary 
FROM emplyees 
WHERE (salary / 365) > 100

--Q30 to identify those employees who retired after 31-Dec-99, completing eight years of service. Return employee name.
SELECT emp_name 
FROM emplyees 
WHERE DATEADD(year, 8, hire_date) > '1999-12-31'

--Q31 identify the employees whose salaries are odd. Return complete information about the employee
SELECT *
FROM emplyees
where salary % 2=1

--Q32 identify employees whose salaries contain only three digits. Return complete information about the employees.
SELECT *
FROM emplyees
WHERE salary BETWEEN 100 AND 999;


--Q33 find those employees who joined in the month of APRIL. Return complete information about the employees
SELECT *
FROM Emplyees
WHERE  MONTH(hire_date) = 4


--Q34 find out which employees joined the company before the 19th of the month. Return complete information about the employees
SELECT *
FROM emplyees
WHERE DAY(hire_date)< 19

--Q35  identify those employees who have been working as a SALESMAN and month portion of the experience is more than 10. Return complete information about the employees.
SELECT *
FROM emplyees
WHERE job_name = 'SALESMAN'
  AND (MONTH(GETDATE()) - MONTH(hire_date))> 10;

  --Q36 find those employees of department id 3001 or 1001 and joined in the year 1991. Return complete information about the employees.
  SELECT *
  FROM emplyees
  WHERE dep_id IN (3001,1001 ) AND YEAR(hire_date)=1991;


  --Q37 find the employees who are working for the department ID 1001 or 2001. Return complete information about the employees.
  SELECT *
  FROM emplyees
  WHERE dep_id IN (1001,2001 ) 

  --Q38 find those employees whose designation is ‘CLERK’ and work in the department ID 2001. Return complete information about the employees
  SELECT*
  FROM emplyees
  WHERE job_name = 'CLERK' AND dep_id =2001


  --Q39 find those employees who are either CLERK or MANAGER. Return complete information about the employees
  SELECT*
  FROM emplyees
  WHERE job_name IN ('CLERK' , 'MANAGER')

  --Q40 identify those employees who joined in any month other than February. Return complete information about the employees.
  SELECT *
  FROM emplyees
  WHERE MONTH(hire_date) != 2 


  --Q41 identify the employees who joined the company in June 1991. Return complete information about the employees.
  SELECT*
  FROM emplyees
  WHERE hire_date BETWEEN '1991-06-01' AND '1991-06-30';


  --Q42 earch for all employees with an annual salary between 24000 and 50000 (Begin and end values are included.). Return complete information about the employees.
  SELECT *
  FROM emplyees
  WHERE 
  (salary*12) BETWEEN 24000 AND 50000


  --Q43 identify all employees who joined the company on 1st May, 20th February, and 3rd December 1991. Return complete information about the employees.
  SELECT *
  FROM emplyees
  WHERE hire_date IN('1991-05-01','1991-02-20','1991-12-03')

  --Q44 find out which employees are working under the managers 63679, 68319, 66564, or 69000. Return complete information about the employees.
  SELECT*
  FROM emplyees
  WHERE manager_id IN ('63679','68319','66564','69000')

  --Q45 find those employees who joined in 90's. Return complete information about the employees
  SELECT*
  FROM emplyees
  WHERE  YEAR(hire_date)=1990


  --Q46 find those managers who are in the department 1001 or 2001. Return complete information about the employees.
 SELECT *
 FROM emplyees
 WHERE dep_id IN (1001,2001) AND job_name='manager'


 --Q47 identify employees who joined in the month of FEBRUARY with a salary range of 1001 to 2000 (Begin and end values are included.). Return complete information about the employees.
 SELECT *
 FROM emplyees
 WHERE MONTH(hire_date)= 2 AND (salary BETWEEN 1001 AND 2000)

 --Q48 find those employees who joined before or after the year 1991. Return complete information about the employees.
 SELECT*
 FROM emplyees
 WHERE YEAR(hire_date)!= 1991

 --Q49 find employees along with their department details. Return employee ID, employee name, job name, manager ID, hire date, salary, commission, department ID, and department name.
 SELECT emplyees.*, department.dep_name
 FROM emplyees
 JOIN department
 ON emplyees.dep_id= department.dep_id



--Q50 identify those employees who earn 60000 or more per year or do not work as ANALYST. Return employee name, job name, (12*salary) as Annual Salary, department ID, and grade.
SELECT *
FROM emplyees
WHERE 12*salary>= 6000 AND job_name!='ANALYST'

--Q51 identify employees whose salaries are higher than their managers' salaries. Return employee name, job name, manager ID, salary, manager name, manager's salary
SELECT * ,  salary AS manager_salary
FROM emplyees
WHERE  salary>(SELECT salary FROM emplyees where job_name = 'manager')


--Q52 find those employees whose salary is between 2000 and 5000 (Begin and end values are included.) and location is PERTH. Return employee name, department ID, salary, and commission
SELECT emp_name, department.dep_id ,salary, commission,department.dep_location
FROM emplyees
join department
ON emplyees.dep_id= department.dep_id
WHERE (salary BETWEEN 2000 and 5000) and department.dep_location ='PERTH'




--Q53 find the employees whose department ID is 1001 or 3001 and whose salary grade is not 4. 
--They joined the company before 1992-12-31. Return grade, employee name.

select * from salarygrade
select * from emplyees
select e.emp_name, s.grade 
from emplyees e, salarygrade s
WHERE e.dep_id IN (1001 ,3001) AND e.salary between s.min_salary and s.max_salary and grade !=4;

select * from salarygrade;

--	Q54 find those employees whose manager name is JONAS. Return employee id, employee name, job name, manager ID, hire date, salary, department ID, employee name.
SELECT *
FROM emplyees
WHERE manager_id=(SELECT emp_id FROM emplyees WHERE emp_name='JONAS')
--ANOTHER SOLUTION BY SELF JOIN

SELECT E.emp_name AS "employee name",M.emp_name AS "manager name", M.emp_id, M.job_name, M.manager_id,M.hire_date,M.salary,M.dep_id
FROM emplyees E JOIN emplyees M
ON E.manager_id = M.emp_id
WHERE M.emp_name = 'jonas'


-- Q55  find the name and salary of the employee FRANK. Salary should be equal to the maximum salary within his  salary group.
SELECT emp_name,salary
FROM emplyees
WHERE emp_name = 'FRANK'
OR salary IN (SELECT salary FROM salarygrade where salary=max_salary)

--Q56 search for employees who are working either as a MANAGER or an ANALYST with a salary between 2000 and 5000 (Begin and end values are included.) without commissions. Return complete information about the employees.
SELECT emplyees.emp_name,salarygrade.max_salary
FROM emplyees,salarygrade

--Q58 find the employees who joined in 1991 and whose department location is SYDNEY or MELBOURNE with a salary range of 2000 to 5000. 
--Return employee ID, employee name, department ID, salary, and department location.


SELECT e.emp_id, e.emp_name, e.dep_id, e.salary, d.dep_location
FROM emplyees e
JOIN department d 
ON e.dep_id = d.dep_id
WHERE year(e.hire_date) = 1991
AND (d.dep_location = 'SYDNEY' OR d.dep_location = 'MELBOURNE')
AND e.salary BETWEEN 2000 AND 5000;

--Q59 find the employees of MARKETING department come from MELBOURNE or PERTH, are in grades 3 ,4, and 5 and have at least 25 years of experience. 
--Return department ID, employee ID, employee name, salary, department name, department location and grade.
SELECT e.dep_id ,e.emp_id, e.emp_name, e.salary, d.dep_name, d.dep_location, g.grade
FROM emplyees e
JOIN department d
ON e.dep_id = d.dep_id 
JOIN salarygrade g
ON e.salary BETWEEN g.min_salary and g.max_salary
WHERE d.dep_name ='MARKETING'
AND (d.dep_location = 'MELBOURNE' OR d.dep_location = 'PERTH')
AND g.grade BETWEEN 3 AND 5
AND (YEAR(GETDATE()) - YEAR(e.hire_date)) >= 25;

--Q60 find those employees who are senior to their manager. Return complete information about the employees
SELECT e.emp_name, e.emp_id,e.job_name, e.manager_id,e.hire_date,e.commission,e.dep_id
FROM emplyees e
JOIN emplyees e1
ON e.emp_id =e1.manager_id
WHERE e.hire_date>e1.hire_date

--Q61 determine which employees have a grade of 4 and a salary between the minimum and maximum.
--Return all information of each employees and their grade and salary related details
SELECT e.emp_name, e.emp_id,e.job_name, e.manager_id,e.hire_date,e.commission,e.dep_id,g.grade
FROM emplyees e
JOIN salarygrade g
on  g.grade =salary
where salary between min_salary and max_salary AND grade=4
