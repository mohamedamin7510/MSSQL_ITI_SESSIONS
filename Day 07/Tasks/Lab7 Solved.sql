-- Use iti DataBase 
--[1]
Create Function DateToMonth(@date Date)
returns varchar(20)
Begin 
   return  Format(@date, 'MMMM' )
End
--Testing
select dbo.DateToMonth(Getdate()) --March


--[2]
Create Function GetRange3 (@left int , @Right int )
returns @Rangetable table 
(
 Numbers int  
)
as
Begin 
--Loop
 while(@left < @Right - 1)
	Begin
		set @left += 1;
		insert into @Rangetable
		select @Left
	 End 
return
End
select *from GetRange3(10,30)


-- [3]
Drop Function StudentInfo
create Function StudentInfo (@StudentN int )
returns table
as return 
(
 select  Dept_Name,s.St_Fname +' '+ S.St_Lname as Full_name from Department D,Student S where D.Dept_Id = S.Dept_Id and s.St_Id = @StudentN 
)

select *from StudentInfo(2)


-- [4]
create Function CheckNull(@studID int)
returns varchar(50)
Begin
declare @Fname varchar(20)
declare @Lname varchar(20)
declare @Message varchar(50)
select @Fname =St_Fname , @Lname = St_Lname
from Student where St_Id = @studID

if @Fname is null and @Lname is null
	set @Message = 'First name & last name are null'
else if @Fname is null 
	set @Message = 'first name is null'
else if @Lname is null 
	set @Message ='last name is null'
else
	set @Message ='First name & last name are not null'
	return @message
End
select dbo.CheckNull(15)

--[5]
create function GetManagerInfo(@ManagerID int )
returns table 
as return 
(
 select  Dept_Name ,Ins_Name 'manager Name' ,Manager_hiredate 'hiring date' from  Department D ,Instructor ins where 
 D.Dept_Manager = ins.Ins_Id and d.Dept_Manager = @ManagerID
)
select * from GetManagerInfo(1)

--[6]
create Function GetsName(@Format Varchar(20))
returns @Container table 
(
Name varchar(20)
)
begin 
	if @Format = 'first name' 
	Begin
		insert into @Container
		select St_Fname firstName from Student
	 End

	else if @Format = 'last name'  
	Begin
		insert into @Container
		select St_Lname Lname from Student
	End

	 else if @Format = 'full name'  
	Begin
		insert into @Container
		select St_Fname + ' '+St_Lname FullName from Student
	 End

	 return
End 
select * from GetsName('full name')

--[7]
select St_Id STudent_Number , SUBSTRING(St_Fname,1,len(St_Fname) - 1)FirstName  from Student

--[8]
update Stud_Course set Grade = Null from Stud_Course SC , Student S, Department D
where SC.St_Id = S.St_Id and S.Dept_Id = D.Dept_Id

--[Bouns]
--[2]
declare @emp_no int = 1 
while(@emp_no < 3001)
Begin
	insert into Employee
	values(@emp_no,'Jane','Smith','d1')
set @emp_no +=1
End

