
/*
First Query
-- here you wanna display the Department id, name from Department table ,and display id and name of  the manager From Employee table so you have two diff table .
 you must use the join  to combine it in one table one query . i choosed Inner goin  because each value from  Department id nust match with name of  the manager
*/
select Dnumber 'Department Number: '  ,Dname 'Department Name: ' , SSn 'Id Of Manager: ' , Fname +'	'+ Lname [full Name Manager: ] 
from Department D inner join Employee E  on E.SSN = D.MGRSSN 


/*
[Second Query]
here you wanna display the name of the departments  from Department table ,and display 
the name of the projects  From Project table so you have two diff table . you must use the join  to combine it in one table one query   
*/
select Dname 'Department Name' , Pname 'Project Name' from Department D inner join Project P  on D.Dnumber =P.Dnum


/*
[third Query]
 you need the name from  Employee  and all contents of dependent and both them in  one table .Use Inner Join
 i used Right outer join because i need all of dependencies until employee name isn't there 
*/
Select Fname +' '+ Lname [Full name], D.*from Employee E Right outer join Dependent D on E.SSN = D.ESSN


/*
[Fourth query]
normalQuery
*/
select Pnumber,Pname , Plocation from  Project  where Plocation in ('Cairo','Alex')


/*
[Fifth Query]
direcy Query but use like to match specific value 
*/
select *from Project where Pname like 'a%'


/*
[Sixth Query]
display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
*/
select * from  Employee where Dno = 30 and Salary between 1000 and 2000 
 

 /*
 [Seventh Project]
  you need to filter the rows with conditions from diff tables so you need join From three tables [Employee , Works_On , Project] 
 */
 -- First Way
 select E.*from Employee E , Works_On WO , Project P   
 where  E.SSN =WO.ESSN and P.Pnumber = Wo.PNo and Dno = 10 and  Wo.Hours >=10 and p.Pname = 'AL Rabwah'
 -- Second Way 
 select E.* from Employee E inner join Works_On WO  on E.SSN = WO.ESSN and Hours >=10
 inner join Project P on WO.PNo = P.Pnumber and p.Pname = 'AL Rabwah'


 /*
8----> Let''''''''''''''s Go
 this is a Self Join 
 */
 select A.Fname  from Employee A ,Employee B   where B.SSN = A.SUPERSSN and b.Fname +' ' + b.Lname = 'Kamel Mohamed'



 /*
 9-------->
 Join the next three tables Employee ,and Works_on and Project  and it will be ordered by Pname column in Project table
 */
 select E.Fname + ' '+ Lname [names: ], P.Pname  from Employee E, Works_On WO ,Project P
 where E.SSN =WO.ESSN and P.Pnumber = Wo.PNo order by P.Pname



 /*
 10----->
 */
 select Pnumber , Dname ,  Lname, Bdate , Address  from Project P inner join Department D on D.Dnumber = p.Dnum and p.Plocation = 'Cairo '
 inner join Employee E on E.SSN = D.MGRSSN 

 /*
 11-------------------->
Display All Data of the managers 
we used Distincit because of Mgrstartdate may be  repeated
 */
 select distinct  E.*from Employee E , Department D where E.SSN = D.MGRSSN
 --> another solution
 select distinct  A.*from Employee A , Employee B where b.SSN = A.SUPERSSN 



 /*
 12----------------> 
here must use [Left Outer Join ] because he said that even if they didn't have dependents

 */
 select Fname+'	'+ Lname , D.*from Employee E left  outer Join  Dependent D  on E.SSN = D.ESSN 

 <-------------------------------------------------------------------------------->
-- [DML]

-->[1]
insert into Employee (Fname,Dno, SSN, SUPERSSN, Salary)
values('Eslam',30,102672,112233,3000 )


--[2]

insert into Employee (Fname,Dno, SSN)
values('ali',30,102660 )

--[3]
update Employee
set Salary += 0.2 * Salary 

