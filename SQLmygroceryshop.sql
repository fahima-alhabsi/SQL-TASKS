create table vendor(
ven_id int primary key,
city text,
ven_name text,
)
INSERT INTO vendor (ven_id ,city ,ven_name )
VALUES
 (5001, 'muscat', 'Nail Knite'),
 (5002, 'matrah', 'Paris'),
 (5003, 'barka', 'Rome'),
 (5004, 'sur', 'San Jose'),
  (5005, 'nizwa', 'sam');
create table grocery(
ven_id_fk int ,
pro_id int primary key,
grocery_price float,
FOREIGN KEY (ven_id_fk) REFERENCES vendor(ven_id)
)
 INSERT INTO grocery (ven_id_fk  ,pro_id ,grocery_price )
VALUES
 (5001, 1, 10),
 (5004, 4, 90),
 (5003, 6, 60.5);
CREATE TABLE producat (
prod_id integer  PRIMARY KEY,
ven_price float,
prod_name text,
ven_id_fk int,
FOREIGN KEY (ven_id_fk) REFERENCES vendor(ven_id)
)
  INSERT INTO producat (ven_id_fk  ,prod_id ,prod_name,ven_price )
VALUES
(5001,1,'milk',7.5),
(5003,2,'phone',56),
(5002,3,'watch',20),
(5004,4,'lap',78),
(5003,5,'phone',56),
(5002,6,'watch',20);
CREATE TABLE orders (
order_id integer  PRIMARY KEY ,
purch_amt float,
order_date date,
ven_id_fk int
)
INSERT INTO orders (order_id, purch_amt, order_date,ven_id_fk)
VALUES
 (70001, 150.5, '2012-10-05',  5002),
 (70009, 270.65, '2012-09-10',  5004),
 (70002, 65.26, '2012-10-05', 5001),
 (70004, 110.5, '2012-08-17',  5003),
 (70007, 948.5, '2012-09-10',  5002);

  select * FROM orders ;
    select * FROM producat;
	  select * FROM grocery;
    select * FROM vendor;
     select city FROM vendor;

  ALTER TABLE vendor ALTER COLUMN city varchar(150)
          select sum(ven_price) ,ven_id_fk as total_vende_price FROM producat P
	   group by ven_id_fk;
	    select city FROM vendor
		where city like '%a';
		select DISTINCT(ven_id_fk) FROM producat;
		select * from grocery g
		join vendor v
		on v.ven_id =g.ven_id_fk;








