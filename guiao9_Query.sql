--go 
--create procedure remove_employee @ssn int
--as
--	begin
--		delete from Company.Works_on where Ssn=@ssn;
--		delete from Company.Employee where Ssn=@ssn;
--		delete from Company.[Dependent] where Essn=@ssn;
--		update Company.Employee where Super_ssn=@ssn;
--		update Company.Department where Mge_ssn=@ssn;
--	end
--exec remove_employee 21312332;

--go
--create procedure set_dept_managers (@mgr_ssn int output, @years int output)
--as
--	begin
--		select Employee.* from Company.Employee inner join Company.Department 
--			on Company.Employee.Ssn = Company.Department.Mgr_ssn;
--		select @mgr_ssn = Department.Mgr_ssn, @years = Datediff(year, Mgr_start_date, getdate())
--			from Company.Department
--				where Mgr_start_date = (select min(Mgr_start_date) from Company.Department);

--	end

--declare @ssn int;
--declare @years int;
--exec set_dept_managers @ssn output, @years output;
--print @ssn;
--print @years;


--Alinea´C)
go
create function Company.ft_proj_info (@emp_ssn int) returns @table
table([name] varchar(45), [location] varchar(15))
as
	begin
		insert @table
			select Company.Project.Pname, Company.Project.Plocation from Company.Project
				inner join Company.Works_on on Company.Works_on.Pno = Company.Project.Pnumber
					where Works_on.Essn=@emp_ssn
		return;
	end
SELECT * FROM Company.Works_on;
SELECT * FROM Company.Project;
SELECT * FROM Company.ft_proj_info(21312332);
SELECT * FROM Company.ft_proj_info(183623612);
SELECT * FROM Company.ft_proj_info(342343434);
			


