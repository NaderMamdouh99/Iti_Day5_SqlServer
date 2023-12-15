-------------------1---------------------------
use AdventureWorks2022

create function Calculate (@First_num int ,@Last_num int )
returns @t table 
(
	betweenNum int
)
as 
	begin
	if @First_num< @Last_num
	declare @n1 int ,@n2 int 
	set @n1 =@First_num
	set @n2 =@Last_num
		while (@n1< @n2)
			begin 
			set @n1= @n1 + 1
			insert into @t (betweenNum)
			values (@n1)
			end
	if @Last_num<@First_num
		set @n1 =@First_num
		set @n2 =@Last_num
			while (@n2< @n1)
				begin 
				set @n2= @n2 + 1
				insert into @t (betweenNum)
				values (@n2)
				end
	return
	end

select * from Calculate(15,20)

select * from Calculate(20,15)



------------2--------------------------
create function EmployesData()
returns table 
as 
return
(
	select [FirstName],[LastName], ISNULL([JobTitle],'Not provided') as 'Tittle',
	case 
		when [MaritalStatus]= 'S' then 'Single'
		when [MaritalStatus]= 'M' then 'Maired'
		else 'Not provided'
	end as 'MaritalStatus',
	case 
		when [Gender]= 'M' then 'Male'
		when [Gender]= 'F' then 'Female'
		else 'Not provided'
	end as 'Gender'
	from [HumanResources].[Employee] inner join [Person].[Person]
	on [Person].[Person].[BusinessEntityID] = [HumanResources].[Employee].BusinessEntityID 

)

select * from EmployesData()

---------------------3-----------------------
alter  function tabled_valued ()
returns table 
as
return
(
	select 
	PP.[FirstName]+ ' ' + PP.[LastName] as 'Full Name',
	He.[JobTitle] as 'Job Tittle',
	DATEDIFF(YEAR,[HireDate],GETDATE()) as 'HireDate',
	YEAR([BirthDate])+21 as 'Graduation Year'
	from [HumanResources].[Employee] He inner join [Person].[Person] PP
	on He.BusinessEntityID=PP.BusinessEntityID
)
select * from tabled_valued ()
---------------4-------------------------------
create function bouns_salary (@salary int,@experience int)
returns int
as begin
	if(@experience>7 )
		return @salary*.7+@salary
	else 
	return @salary+(@salary*.1*@experience)

	return 0
end



print dbo.bouns_salary(100,5)

----------------5------------------------------
use [ITI]
create function highest10(@id smallint)
returns table 
as 
return
(
	 select top(10)[Salary],[Dept_Id],[Ins_Name]
	 from [dbo].[Instructor] Ins
	 where [Dept_Id] = @id 

)

select * from  highest10(10)
