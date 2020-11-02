-- uc12 Check uc4 ,uc5, uc7 again
use Payroll_Service
-- Rechecking uc 4 get salary of all employees
select empid,empname,netpay from employeedetails,payrolldetails
where employeedetails.payrollid = payrolldetails.payrollid

--Rechecking UC5 - retrieve salary of particular employee or with start date range
select empid,empname,netpay from employeedetails,payrolldetails
where empname = 'Ram' and
employeedetails.payrollid = payrolldetails.payrollid

-- Rechecking to Get within a given date range
select empid,empname,start_date,netpay from employeedetails,payrolldetails
where start_date between cast('2015-01-01' as date) and GetDate() and
employeedetails.payrollid = payrolldetails.payrollid

--rechecking Uc7 min max salaries
select * from EmployeeDetails ED
Inner join(
select PD.basepay,PD.payrollId from PayrollDetails PD
inner Join(select max(basepay) as Maxpay from PayrollDetails) PD1 
on PD1.Maxpay = PD.BasePay ) ED1 on  ED1.payrollId = ED.PayrollId



