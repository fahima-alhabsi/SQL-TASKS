CREATE TABLE REGISTRATION
(AcNo NUMERIC PRIMARY KEY,
FName   varchar(15) not null,
LName   varchar(15) not null,
DOB Date,
RegDate Date ,
CivilID NUMERIC Not null,
Gender  Char(1),
GSM     NUMERIC(8),
OpenBal NUMERIC)



ALTER TABLE registration
add constraint gsm_unique
UNIQUE (GSM);

ALTER TABLE registration
add constraint Openbal_check
CHECK (OpenBal >= 50);


ALTER TABLE registration
add constraint gender_check
Check (Gender IN('M','m','F','f'));
-------------------------------
Create table deposits
(DNO  NUMERIC Primary key,
 AcNO NUMERIC,
 ddate date ,
 DAmt  NUMERIC not null,
 Dlocation varchar(10) not null,
constraint dept_reg_FK Foreign Key
(AcNO) References Registration(Acno));

-- making insert to check the trigger 
insert  into deposits values (1,23,'12-3-23',5,'muscat')
-----------------------------
Create table withdrawls
(WNo NUMERIC Primary key,
Acno NUMERIC,
WDate   Date ,
WAmount NUMERIC not null,
WLocation varchar(10) not null,
constraint dept_Withd_FK Foreign Key
(AcNO) References Registration(Acno));
---------------------------------
select* from REGISTRATION
select * from deposits
select * from withdrawls





---------------------INSERT INSIDE TEBLE USING PROCEDURE---------------------------------------
create procedure REGISTRATION_p1
(
@AcNo NUMERIC,
@FName varchar,
@LName   varchar,
@DOB Date,
@RegDate Date ,
@CivilID NUMERIC,
@Gender  Char,
@GSM     NUMERIC,
@OpenBal NUMERIC


)
AS
begin
insert into REGISTRATION (AcNo,FName ,LName ,DOB ,RegDate,CivilID ,Gender,GSM ,OpenBal )
values (@AcNo ,@FName ,@LName ,@DOB ,@RegDate,@CivilID ,@Gender,@GSM ,@OpenBal )
PRINT('record saved sucessfully');	
end;
EXEC REGISTRATION_p1 23,'fahima','said','2012-02-25','2012-09-30',11133,'f',95498938,60

select * from REGISTRATION


--------------------UPDATE IN TEBLE USING PROCEDURE-----------------------------
create procedure REGISTRATION_p2
@FName varchar(15),
@CivilID NUMERIC,
@AcNo NUMERIC

AS
BEGIN
    UPDATE REGISTRATION
	SET
        FName = @FName,
        CivilID = @CivilID

    where AcNo=@AcNo

END
DROP procedure REGISTRATION_p2

EXEC REGISTRATION_p2 'malak',22334,23
SELECT * FROM REGISTRATION


--------------------------DELET DATA INSIDE PROCEDURE--------------------

create procedure REGISTRATION_p3
@FName varchar(15),
@CivilID NUMERIC,
@AcNo NUMERIC

AS
BEGIN
    DELETE FROM REGISTRATION
	
    where AcNo=@AcNo

END
DROP procedure REGISTRATION_p3

EXEC REGISTRATION_p3 'FAHIMA',11133,23
SELECT * FROM REGISTRATION

--------------------------------------------------deposite amount all column----------------------------------------------

create procedure deposits_d1
(

@DNO  NUMERIC ,
 @AcNO NUMERIC,
 @ddate date ,
 @DAmt  NUMERIC ,
 @Dlocation varchar
)

AS
begin
insert into deposits values (@DNO,@AcNO,@ddate,@DAmt ,@Dlocation)
PRINT('record saved sucessfully');	
end;
EXEC deposits_d1 






                -----------------------------------trigger--------------------------------------

				--1. Create a trigger (Trigger_Deposit_Bal_Update) on Deposits table 
--to update OpenBal in Registration table, whenever a person deposits money in the account.

Create  trigger Trigger_Deposit_Bal_Update
on Deposits
for update
as 
if update(DAmt)
begin 
print 'you cannot update'
rollback transaction 
end

--to check wether trigger is working we apdate value in table
update  deposits 
set DAmt= 5
where AcNO=23






--2. Create a trigger (Trigger_Withdrawls_Bal_Update) on Withdrawls table to update OpenBal in Registration table, whenever a person 
--withdraws money from the account. Make sure to perform OpenBal check before he withdraws money. WAmount should be less than OpenBal 

 Create  trigger Trigger_Withdrawls_Bal_Update
on Withdrawls
for update
as 
if update(WDate)
begin 
print 'you cannot update'
rollback transaction 
end


