CREATE TABLE Salesman (
 salesman_id INT PRIMARY KEY,
 name VARCHAR(20) NOT NULL,
 city VARCHAR(20) NOT NULL,
 commission DECIMAL(4, 2) NOT NULL
);



INSERT INTO Salesman (salesman_id, name, city, commission)
VALUES
 (5001, 'James Hoog', 'New York', 0.15),
 (5002, 'Nail Knite', 'Paris', 0.13),
 (5005, 'Pit Alex', 'London', 0.11),
 (5006, 'Mc Lyon', 'Paris', 0.14),
 (5007, 'Paul Adam', 'Rome', 0.13),
 (5003, 'Lauson Hen', 'San Jose', 0.12)

 CREATE TABLE Customer (
 customer_id INT PRIMARY KEY,
 cust_name VARCHAR(20) NOT NULL,
 city VARCHAR(20) NOT NULL,
 grade INT,
 salesman_id INT,
 FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
 (3002, 'Nick Rimando', 'New York', 100, 5001),
 (3007, 'Brad Davis', 'New York', 200, 5001),
 (3005, 'Graham Zusi', 'California', 200, 5002),
 (3008, 'Julian Green', 'London', 300, 5002),
 (3004, 'Fabian Johnson', 'Paris', 300, 5006),
 (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
 (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
 (3001, 'Brad Guzan', 'London', NULL, 5005)

 CREATE TABLE Orders (
 ord_no INT PRIMARY KEY,
 purch_amt DECIMAL(8, 2) NOT NULL,
 ord_date DATE NOT NULL,
 customer_id INT,
 salesman_id INT,
 FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
 FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
 (70001, 150.5, '2012-10-05', 3005, 5002),
 (70009, 270.65, '2012-09-10', 3001, 5005),
 (70002, 65.26, '2012-10-05', 3002, 5001),
 (70004, 110.5, '2012-08-17', 3009, 5003),
 (70007, 948.5, '2012-09-10', 3005, 5002),
 (70005, 2400.6, '2012-07-27', 3007, 5001),
 (70008, 5760, '2012-09-10', 3002, 5001),
 (70010, 1983.43, '2012-10-10', 3004, 5006),
 (70003, 2480.4, '2012-10-10', 3009, 5003),
 (70012, 250.45, '2012-06-27', 3008, 5002),
 (70011, 75.29, '2012-08-17', 3003, 5007),
 (70013, 3045.6, '2012-04-25', 3002, 5001)

 CREATE TABLE Company_mast (
 COM_ID INT PRIMARY KEY,
 COM_NAME VARCHAR(30) NOT NULL
);
INSERT INTO Company_mast (COM_ID, COM_NAME)
VALUES
 (11, 'Samsung'),
 (12, 'iBall'),
 (13, 'Epsion'),
 (14, 'Zebronics'),
 (15, 'Asus'),
 (16, 'Frontech');


 create table item_mast (
PRO_ID int PRIMARY KEY,
PRO_NAME varchar(50),
PRO_PRICE float,
PRO_COM int)
insert into item_mast values 
(101,'Mother Board', 3200.00,15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00,14),
(104, 'Speaker' , 550.00,16),
(105, 'Monitor' , 5000.00,11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge' , 350.00, 13),
(110, ' Mouse', 250.00, 12);

CREATE TABLE DEPARTMENT (
 DPT_CODE INT PRIMARY KEY,
 DPT_NAME VARCHAR(20) NOT NULL,
 DPT_ALLOTMENT FLOAT NOT NULL
);
INSERT INTO DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)
VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);


CREATE TABLE EMP_DETAILS (
 EMP_IDNO INT PRIMARY KEY,
 EMP_FNAME VARCHAR(50) NOT NULL,
 EMP_LNAME VARCHAR(50) NOT NULL,
 EMP_DEPT INT NOT NULL
);
INSERT INTO EMP_DETAILS (EMP_IDNO, EMP_FNAME, EMP_LNAME, 
EMP_DEPT)
VALUES 
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57)

SELECT*
FROM  Salesman 

SELECT*
FROM  Customer

------------------------------------------------proceduretask--------------------------------------------------------------------------




--Write a procedure which displays all even numbers below 100.
create procedure P @n NUMERIC       --VOID FUNNamme( int n)
AS
BEGIN                                --{
DECLARE @EVN NUMERIC                  --int EVN ;
SET @evn =2                              --EVN = 2;
WHILE (@evn<@n)                         --WHILE(evn<n)  
BEGIN                                           --{
PRINT @evn                                --sysout(evn)
SET @evn=@evn+2                            -- evn +=2 or evn=evn+2
END                                        --}  
END                                          --}

EXEC P 100                               --FUNNamme(100)


-- Write a procedure which displays all odd numbers below 100.
create procedure P2 @n NUMERIC
AS
BEGIN 
DECLARE @ODD NUMERIC 
SET @ODD =1
WHILE (@ODD<@n)
BEGIN
PRINT @ODD
SET @ODD=@ODD+2
END
END

EXEC P2 40




-- Write a procedure which display whether  a number  is prime or not.

CREATE PROCEDURE P3 @n NUMERIC
AS
BEGIN
  DECLARE @PRM NUMERIC
  SET @PRM = 1

  WHILE (@PRM <= @n)
  BEGIN
    IF (@PRM % 2 = 1)
      PRINT @PRM
      
    SET @PRM = @PRM + 1
  END
END
EXEC P3 20

-- Write a procedure which display the sum of 10 numbers.

create procedure sumoften
AS
BEGIN
DECLARE @flag NUMERIC
SET @flag =1

DECLARE @output NUMERIC
SET @output =0
SET @flag =1

WHILE (@flag<10)
BEGIN
set @output = @output +@flag
SET @flag=@flag+1
END
print @output
END
EXEC sumoften





-- Write a procedure which display 20 multiples for all the numbers between  2 given numbers.
create procedure multiples @flag1 NUMERIC ,@flag2 NUMERIC
AS
BEGIN
WHILE(@flag1<@flag2)
BEGIN
print  CONVERT(varchar(10),@flag1) +
      ' * ' +  CONVERT(varchar(10),@flag2) +' = '+CONVERT(varchar(10),(@flag1 *@flag2))
set @flag2=@flag2+1
END
END

EXEC multiples 21,1
--Write a procedure to display the reverse of a given number.
create procedure reverses @n NUMERIC
AS
BEGIN
WHILE (@n>0)
BEGIN
print @n
set @n=@n-1
END
END
EXEC reverses 10


--Write a procedure to display the sum of individual digits of given number.

create procedure sum @n NUMERIC
AS
BEGIN
print  CONVERT(varchar(10),@n) +
      ' + ' +  CONVERT(varchar(10),@n) +' = '+CONVERT(varchar(10),(@n +@n))
END
EXEC sum 10



------------------------------------------------proceduretask--------------------------------------------------------------------------



SELECT*
FROM  Orders 

SELECT*
FROM COMPANY_MAST

SELECT *
FROM ITEM_MAST


SELECT* 
FROM  DEPARTMENT

SELECT*
FROM  EMP_DETAILS


-- QUESTIONS 


--Q18. find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT name AS SALESPERSON ,CUST_NAME,salesman.CITY
FROM Salesman
JOIN Customer
on Salesman.city=Customer.city



--Q19.  find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city. 
SELECT ord_no,purch_amt,cust_name,city
FROM Customer
join orders
on orders.salesman_id=Customer.salesman_id
where orders.purch_amt between 500 and 2000




--Q20.  find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission. 
SELECT CUST_NAME,Salesman.CITY,name AS salesman,commission
FROM salesman
join customer 
on Salesman.Salesman_id=Customer.Salesman_id
JOIN orders
ON orders.salesman_id=Customer.salesman_id


--Q21.  salespeople who received commissions of more than 12 percent from the company. 
--Return Customer Name, customer city, Salesman, commission. 

SELECT CUST_NAME,Salesman.CITY,name AS salesman,commission
FROM salesman
join customer 
on Salesman.Salesman_id=Customer.Salesman_id
JOIN orders
ON orders.salesman_id=Customer.salesman_id
where commission > 0.12


--Q22. locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company.
--Return Customer Name, customer city, Salesman, salesman city, commission.
select cust_name,customer.city,name AS salesman,salesman.city,commission
FROM salesman
join customer 
on Salesman.Salesman_id=Customer.Salesman_id
where Salesman.city!=customer.city
and commission>0.12



--Q23. find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 

select ord_no,ord_date,purch_amt,cust_name,grade,name AS Salesman,commission
FROM salesman
join customer 
on Salesman.Salesman_id=Customer.Salesman_id
JOIN orders
ON orders.salesman_id=Customer.salesman_id

--Q24.  join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 

SELECT*
FROM salesman
 JOIN customer
On Salesman.Salesman_id=Customer.Salesman_id
 JOIN orders
ON orders.salesman_id=Customer.salesman_id


SELECT *
FROM salesman
JOIN customer 
ON salesman.salesman_id = customer.salesman_id
JOIN orders 
ON customer.customer_id = orders.customer_id AND salesman.salesman_id = orders.salesman_id;


--Q25. display the customer name, customer city, grade, salesman, salesman city. 
--The results should be sorted by ascending customer_id. 
SELECT CUST_NAME,CUSTOMER.CITY,GRADE,CUSTOMER.SALESMAN_ID,SALESMAN.CITY AS salesman_city,CUSTOMER_ID
FROM CUSTOMER
JOIN SALESMAN
ON salesman.salesman_id = customer.salesman_id
ORDER BY customer_id


--Q26. find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. 
--The result should be ordered by ascending customer_id. 
SELECT CUST_NAME,CUSTOMER.CITY,GRADE,CUSTOMER.SALESMAN_ID,SALESMAN.CITY 
FROM CUSTOMER
JOIN SALESMAN
ON salesman.salesman_id = customer.salesman_id
WHERE GRADE <300



--Q27. make a report with customer name, city, order number, order date, 
--and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not. 
SELECT CUST_NAME,CUSTOMER.CITY,ORD_NO,ord_date,purch_amt
FROM salesman
JOIN customer 
ON salesman.salesman_id = customer.salesman_id
JOIN orders 
ON customer.customer_id = orders.customer_id
ORDER BY ord_date






--Q28. generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of 
--the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
SELECT CUST_NAME,CUSTOMER.CITY,ORD_NO,ord_date,purch_amt,name AS salesman, commission
FROM salesman
JOIN customer 
ON salesman.salesman_id = customer.salesman_id
JOIN orders 
ON customer.customer_id = orders.customer_id



--Q29.  generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
select name ,cust_name
from salesman
join customer
on salesman.salesman_id = customer.salesman_id
order by salesman.name



--Q30.  list all salespersons along with customer name, city, grade, order number, date, and amount.

SELECT name AS salseman,CUST_NAME,SALESMAN.CITY,GRADE,ORD_NO,ORD_DATE,PURCH_AMT
FROM salesman
JOIN customer 
ON salesman.salesman_id = customer.salesman_id
JOIN orders 
ON customer.customer_id = orders.customer_id


--Q31. list for the salesmen who either work for one or more customers or yet to join any of the customer.
--The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. 







--Q32. For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, 
--create a report containing the customer name, city, order number, order date, and purchase amount.


SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
UNION --to combine result of two statment
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM Orders o
LEFT JOIN Customer c ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL
ORDER BY cust_name, ord_date;










--Q33. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have 
--a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.


SELECT cust_name, city, ord_no, ord_date, purch_amt
FROM Customer 
LEFT JOIN Orders 
ON Orders.customer_id = Customer.customer_id


--Q34. Write a SQL query to combine each row of the salesman table with each row of the customer table.
SELECT *
FROM SALESMAN
CROSS JOIN CUSTOMER



--Q35. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. 
--each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.


SELECT salesman.salesman_id, salesman.name as salesman_name, salesman.city as salesman_city, customer.customer_id, cust_name, customer.city as customer_city
FROM Salesman 
join Customer 
 ON salesman.salesman_id = customer.salesman_id
WHERE salesman.city = customer.city OR salesman.city IS NULL



SELECT s.salesman_id, s.name as salesman_name, s.city as salesman_city, c.customer_id, c.cust_name, c.city as customer_city
FROM Salesman s, Customer c
WHERE s.city = c.city OR s.city IS NULL





--Q36. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. 
--each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.

SELECT salesman.salesman_id, salesman.name as salesman_name, salesman.city as salesman_city, customer.customer_id, cust_name, customer.city as customer_city,grade
FROM Salesman 
join Customer 
 ON salesman.salesman_id = customer.salesman_id
WHERE salesman.city = customer.city OR salesman.city IS NULL 




--Q37.  make a Cartesian product between salesman and customer i.e.
--each salesman will appear for all customers and vice versa for those 
--salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade. 


SELECT salesman.salesman_id, salesman.name as salesman_name, salesman.city as salesman_city, customer.customer_id, cust_name,
customer.city as customer_city,grade as customer_gade
FROM Salesman 
join Customer 
 ON salesman.salesman_id = customer.salesman_id
WHERE salesman.city != customer.city OR salesman.city IS NULL 





--Q38.  select all rows from both participating tables as long as there is a match between pro_com and com_id.
select distinct pro_com ,com_id
from item_mast
join company_mast
on item_mast.pro_com=company_mast.com_id
  




--Q39. Write a SQL query to display the item name, price, and company name of all the products. 

select pro_name,pro_price, com_name
from item_mast
join company_mast
on item_mast.pro_com=company_mast.com_id


--Q40.  calculate the average price of items of each company. Return average value and company name. 

select com_name, pro_price as average_value
from item_mast
join company_mast
on item_mast.pro_com=company_mast.com_id
 
GROUP BY pro_price,com_name
HAVING pro_price=AVG(pro_price)


--Q41. calculate and find the average price of items of each company higher than or equal to Rs. 350. 
--Return average value and company name.

select com_name, pro_price as average_value
from item_mast
join company_mast
on item_mast.pro_com=company_mast.com_id
 
GROUP BY pro_price,com_name
HAVING AVG(pro_price)>=350


--Q42.  find the most expensive product of each company. Return pro_name, pro_price and com_name.

SELECT pro_name,pro_price,com_name
from item_mast
join company_mast
on item_mast.pro_com=company_mast.com_id
GROUP BY pro_name,pro_price,com_name
HAVING pro_price=MAX(pro_price)




--Q43. From the following tables write a SQL query to display all the data of employees 
including their department. 
--Q44. From the following tables write a SQL query to display the first and last names of 
each employee, as well as the department name and sanction amount. 
--Q45. From the following tables write a SQL query to find the departments with 
budgets more than Rs. 50000 and display the first name and last name of 
employees. 
--Q46. From the following tables write a SQL query to find the names of departments 
where more than two employees are employed. Return dpt_name. 
--Q47. From the following tables write a SQL query to find the names of departments 
where the department name has two letters. Return dpt_name. 
--Q48. From the following tables write a SQL query to find the names of customers 
where the customer name eds with ‘n’. Return cust_name. 
--Q49. From the following tables write a SQL query to find the names of departments, 
cutomer id and order id. 
--Q50. From the following tables write a SQL query to find cutomer name and order id 
where the order was purchased on October