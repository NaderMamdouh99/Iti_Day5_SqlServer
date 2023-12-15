use [SD32-Company]

-----------==============11111111111111111===============------------
go
create view empdata
  as 
   select CONCAT(e.EmpFname , ' ' , e.EmpLname) as 'full name'
     from HR.Employee e
  go

select * from empdata

---------===============22222222222222222===============------------
select * from HR.Project
select * from [dbo].[Works_on]

go
create view numofemp 
  as
select p.ProjectName , w.EmpNo as 'number' from HR.Project as p left join dbo.Works_on as w
    on p.ProjectNo = w.ProjectNo

go


select * from numofemp