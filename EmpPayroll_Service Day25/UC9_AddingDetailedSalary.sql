use Payroll_Service
select * from employee_payroll

update employee_payroll
set Department =
	case empid
		  when 1 then 'HR'
		  when 2 then 'finance'
		  when 3 then 'HR'
		  when 4 then 'Sales'
	end

--UC9 using stored procedure to update name of columns 
--creating columns deductions, taxable pay, net pay and income tax 
Exec sp_rename 'employee_payroll.salary','Base_pay','COLUMN';
alter table employee_payroll add Deductions float , TaxablePay float,NetPay float,IncomeTax float 
