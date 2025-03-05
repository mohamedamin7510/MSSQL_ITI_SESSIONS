use iti
go 
--> Part1
--[1]
select count(St_Id) [sum OF number of student] from Student
where st_Age is not null

--[2] 
select  distinct Ins_Name as instructor_Names from Instructor

--[3]
select ST_ID [Student ID],	isnull( ST_Fname+ST_lname ,'Mohamed Amin')[Student Full Name], dept_name [Department name]
from student S inner join Department D
on s.Dept_Id = D.Dept_Id


--[4]
select ins.Ins_Name , Dept_Name from Instructor ins left  join Department D
on  ins.Dept_Id = D.Dept_Id

--[5]
select  St_Fname + St_Lname [Full name ] ,Crs_Name 
from student S , Course C ,Stud_Course SC
where S.St_Id = SC.ST_id  and  C.Crs_Id  = SC.Crs_Id and sc.Grade is not null

--[6]
select count(Crs_Id) ,Top_Name  
from Course inner join Topic 
on Course.Top_Id = Topic.Top_Id 
group by Top_Name

--[7]
select max(Salary) as MaxSalary , min(Salary) as MinSalary from Instructor 

--[8]
select *from Instructor 
where  Salary <(Select AVG(Salary) from Instructor)

--[9]
select top(2) Salary From Instructor 
order by Salary desc 

--[10]
Select Ins_Name 'ins_Name: ',coalesce(cast(Salary AS varchar(10) ),'instructor bonus' )  from Instructor

--[11]
Select avg(Salary) 'Average Salary' From Instructor 

--[12]
select S1.St_Fname 'Student: ', S2.* from Student S1, Student S2
where s1.St_super = S2.St_Id

--[13]
select  * FRom (
select Salary,Dept_Id,ROW_NUMBER () over (partition by Dept_Id order by salary desc) RN from Instructor
) as NewTable
where Rn in (1,2)

--[14]
select   St_Fname + ' ' + ST_Lname AS 'Random Names',R,Dept_Id from 
(Select * ,Rank() over( partition by Dept_id order by newID() ) As R from Student) As newwTable
where R <=2

--[15]
--9.	Display the Department name that contains the instructor who receives the minimum salary.
select Dept_Name ' Department name' From Department inner join instructor
on Department.Dept_Id = Instructor.Dept_Id
where Salary = (Select min(Salary) from Instructor)