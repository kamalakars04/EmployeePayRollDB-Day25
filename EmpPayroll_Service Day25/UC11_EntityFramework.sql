--UC 11 Use ERD to build tables
use Payroll_Service

-- drop the previous stored table
select * from employee_payroll
drop table employee_payroll

-- create employee details table
create table EmployeeDetails
( EmpID int not null Primary key identity(1,1),
  EmpName varchar(50) not null,
  Gender varchar(1) not null Check(len(Gender) = 1),
  PhoneNumber varchar not null check(len(PhoneNumber)=10),
  );
 alter table employeedetails drop constraint CK__EmployeeD__Gende__36B12243 
 alter table employeedetails drop constraint CK__EmployeeD__Phone__37A5467C 

 alter table employeeDetails
 alter column phonenumber varchar(10) not null

 alter table employeeDetails
 add start_date date not null default ' '

 alter table employeeDetails
 add constraint Length_check Check(len(Gender) = 1),check(len(PhoneNumber)=10)

 alter table EmployeeDetails
 add PayrollId int not null Foreign key References PayrollDetails(payrollId)
 -- Reset the value of identity
 DBCC CHECKIDENT (employeedetails, RESEED, 0)

Insert into EmployeeDetails(EmpName,Gender,PhoneNumber,payrollId) values
('Ram', 'M','7412330000',2),('sita', 'F','7896312365',3),('Kamalakar', 'M','1478569874',1)

-- Adding start date
 update EmployeeDetails set start_date =
 case empId
 when 1 then '12-02-2014' 
 when 2 then '2018-08-26'
 when 3 then '2020-07-18'
 end
select * from EmployeeDetails

-- Create payrollDetails table with one-many relation with employee table
create table PayrollDetails
( payrollId int not null primary key, 
  BasePay int not null,
  Deductions int not null,
  TaxablePay int not null,
  NetPay int not null,
  IncomeTax int not null);

  alter table PayrollDetails
  drop column Taxablepay,NetPay,IncomeTax;

  -- Add system computed columns
  alter table PayrollDetails
  add TaxablePay as (basepay-deductions) persisted,
  IncomeTax as 0.05*(basepay-deductions) persisted, 
  NetPay as (basepay-deductions- 0.05*(basepay-deductions)) persisted

 Insert into PayrollDetails values
(1,60000,5000),(2,50000, 1000),(3,75000,6000)

select * from PayrollDetails

-- Create address table with one - one relation with employeedetails
  CREATE TABLE addresses(
  EmpID int, -- Both a primary and foreign key
  street varchar(30) NOT NULL,
  city varchar(30) NOT NULL,
  state varchar(30) NOT NULL,
  PRIMARY KEY (EmpId),
  FOREIGN KEY (EmpId) REFERENCES  EmployeeDetails(empid) ON DELETE CASCADE
  )

  Insert into addresses values 
  (1,'gandhi street','bangalore','karnataka'),(2,'bose street','hyderabad','telangana'),
  (3,'bahadur street','kottayam','kerala')

  select * from addresses

  -- create departments table with many-many relation with employee details
  create table Departments
  ( DeptId int not null Identity(1,1) primary key,
    DeptName varchar(30) not null unique);

Insert into Departments values ('HR'),('Marketing'),('Finance')
select * from Departments

-- create a mediating table for many-many relation
create table dept_emp
( EmpId int not null foreign key references employeedetails(EmpId),
DeptId int not null foreign key references departments(deptId))

insert into dept_emp values
(1,2),(1,1),(2,3),(3,2)

select * from dept_emp




