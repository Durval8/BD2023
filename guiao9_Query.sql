go 
create procedure remove_employee @ssn int
as
	begin
		delete from Company.Works_on where Ssn=@ssn;
		delete from Company.Employee where Ssn=@ssn;
		delete from Company.[Dependent] where Essn=@ssn;
		update Company.Employee where Super_ssn=@ssn;
		update Company.Department where Mge_ssn=@ssn;
	end
exec remove_employee 21312332;

go
create procedure set_dept_managers (@mgr_ssn int output, @years int output)
as
	begin
		select Employee.* from Company.Employee inner join Company.Department 
			on Company.Employee.Ssn = Company.Department.Mgr_ssn;
		select @mgr_ssn = Department.Mgr_ssn, @years = Datediff(year, Mgr_start_date, getdate())
			from Company.Department
				where Mgr_start_date = (select min(Mgr_start_date) from Company.Department);

	end

declare @ssn int;
declare @years int;
exec set_dept_managers @ssn output, @years output;
print @ssn;
print @years;


