use ITI
-------------1-----------
create view FullNameCOURSE 
as
select [St_Fname]+' '+[St_Lname]as FullName ,[Crs_Name]
from [newschema].[Student] inner join [dbo].[Stud_Course]
on [dbo].[Stud_Course].[St_Id]=[newschema].[Student].St_Id
inner join [dbo].[Course]	
on[dbo].[Stud_Course].[Crs_Id]=[dbo].[Course].[Crs_Id]
where [grade]>50


select * from FullNameCOURSE

--------------------------2-------------------------
create view manger_name_topic(is_Na,To_Na)
as
select [Ins_Name],[Top_Name]
from [dbo].[Instructor] inner join [dbo].[Course]
on [dbo].[Instructor].Ins_Id=[dbo].[Course].Ins_Id
inner join [dbo].[Topic]
on [dbo].[Course].Top_Id=[dbo].[Topic].Top_Id

select is_Na,To_Na from  manger_name_topic
------------------3-----------------------
create view INS_Name_Dep_Name
as 
select [Ins_Name],[Dept_Name]
from [dbo].[Instructor]inner join [dbo].[Department]
on [dbo].[Instructor].Ins_Id=[dbo].[Department].Dept_Manager
where [Dept_Name]= 'Java'

select * from INS_Name_Dep_Name
----------------4-------------------------
create view V1
as
select * from 	[newschema].[Student]
where [St_Address]= 'Cairo' or [St_Address]= 'Alex'
 ------------------5----------------------------
 use MyCompany
 go
 create view proj_number
 as
 select [Pname],[Pnumber]
 from[dbo].[Project]
 
 select * from proj_number
 -------------------6----------------------------------
 create Schema Com

  alter Schema Com
 transfer [dbo].[Departments]

 create schema Hrs

 alter schema Hrs 
 transfer [HR].[Employee]
 ----------------9----------------------------------
create table #Employee (
    id int not null,
    name VARCHAR(50),
    today_task date 
	)