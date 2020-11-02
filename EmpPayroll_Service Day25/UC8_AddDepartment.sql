--UC 8 Add phonenumber department and address
use Payroll_Service
alter table employee_payroll add  PhoneNumber bigint,
Address varchar(150) not null default ' ',
Department varchar(150) not null default ' ';
select * from employee_payroll