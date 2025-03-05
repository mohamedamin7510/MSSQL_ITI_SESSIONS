
/*
[First Query]
 You had better do a union All  between A and B
 you should Use The Join to do A query , and B the same thing  
*/
--(A)
select D.Dependent_Name , D.Sex from  Dependent D , Employee E 
where (D.ESSN = E.SSN )and (D.Sex = 'F' and E.Sex = 'F')
union ALL
--(B)
select D.Dependent_Name , D.Sex from  Dependent D , Employee E 
where (D.ESSN = E.SSN )and (D.Sex = 'M' and E.Sex = 'M')


/*
[Second Query]
he wants to calc number of hours in every project 
*/
select Pname , Sum(Hours) as [Total Hours] From Project P left outer join Works_on WO 
on p.Pnumber = WO.PNo 
Group by Pname

/*
[3rd Query]
he wants to calc number of hours in every project 
*/
select D.* from Department D ,  Employee E 
where D.Dnumber = E.Dno and E.SSN in (Select min(E.SSN) from Employee E)
--Another Way
select D.* from Department D ,  Employee E 
where D.Dnumber = E.Dno and E.SSN in (Select top 1 SSN from Employee E)



/*
[Fourth Query]
for every department need to calc min and max Salary of employees inside it 
*/
select Dname, max(Salary) [Max Salary] , min(Salary) [Min Salary] ,AVG(Salary) [Avg Salary] from Employee E ,Department D
where E.Dno = D.Dnumber
group by Dname


/*
[Fifth query]
Exists , not exists are two func you should learn them as a self study
here link of  video that i learned from him
https://youtu.be/HM6Jc5YGubQ?si=XH70YfgQ2COsNajU
*/


select   Fname+''+ Lname as [Fulll Name]from Employee E inner join Department D
on E.SSN = D.MGRSSN and not exists(select ESSn from Dependent D where  E.SSN = D.ESSN )


/*
[Sixth Query]
- in every department show number of employee in it and name of department and numer it '(Dnumber)'
but you need to be average salary for each department is less than average salary for all table. 
*/

select   Dnumber 'N of D' , Dname 'Name Of D', count(*)[number of epmloyee], AVG(Salary) [Average Salary for each D]
from  Department D left outer Join Employee E 
on D.Dnumber = E.Dno 
Group by Dnumber, Dname
having  AVG(Salary) < (select Avg(Salary )from Employee )

/*
[Seventh Query]
 - select every employee and own project with ordering in order Dnum and Lname and Fname for employee  
*/

select E.Fname + '	'+E.Lname as full_name,   E.Dno as 'Department number',P.Pname as 'Project name' from Employee E  inner join Department D
on E.Dno = D.Dnumber 
left outer Join Project P
on D.Dnumber = P.Dnum
order by Dnumber ,Lname ,Fname 


/*
[Eighth Query ]
-->  
get max 2 Salaries but use subquery
*/ 
select  Salary from Employee where salary in (select top 2 Salary from Employee order by Salary desc) order by Salary desc
-- another way 
select top(2)salary as maxSalary from Employee 
where salary in (select max(salary) from Employee group by Dno )   order by maxSalary desc 



/*
[Ninth]
he needs aemployee that similar to any dependent not only depentent on them so join cond with equaling names not equals p.k and F.k 
*/
select Fname + '	' +Lname as [full name] from Employee E , Dependent D where  E.Fname like '%'+ D.Dependent_Name +'%' 


/*
[Tenth]
Update + multiple Join
*/

update  Employee
set Salary += .3 * Salary
from Employee E,Department D,Project P
where E.Dno =D.Dnumber and D.Dnumber = P.Dnum and Pname = 'Al Rabwah'

/*
[Eleventh]

*/


select SSn,Fname +'	'+Lname  from Employee E where exists(select ESSn from Dependent D where E.SSN = D.ESSN  )

---------------------------------------------------------------------------->
--> [DML]
/*
[First Query]
- add new record in departments
*/
insert into Department 
values(100,'DEPT IT',112233,'1-11-2006')


/*
[Second Query]
add you First with this SSN and that girl then do the next
*/
update Department 
set MGRSSN = 968574 , Mgrstartdate = getdate()
where Dnumber = 100
update Department 
set MGRSSN = 102672 , Mgrstartdate = GETDATE()
where Dnumber = 20

update Employee 
set SUPERSSN = 102672, Dno =20
where SSN = 102660 

/*
[third query and last and important one]

First, 
check first if he matches with dependents or not 
-> yes, so you need delete dependents from dependent first

second,
check f he is manager for ant Dept
->No

3rd,
Check if anyone was supervised with him or not  
-> yes in my case there are two men  so overwrite on them with your SSN (102672) in their SuperSSN 

fourth ,
check if has a project or not 
Yes , overwrite on it 

finally,
delete that employee with SSn 223344 from the employee table

*/

--first
select SSN,Fname ,Lname  from Employee E,Dependent D where E.SSN = D.ESSN   and Fname = 'kamel'
delete From dependent  
where ESSN = 223344
--Second
select distinct Fname + '	' + Lname as [Full name]from Employee E , Department D  where E.SSN = D.MGRSSN and Fname = 'kamel'

--3rd
select SSN, Fname, Lname from Employee where SUPERSSN = 223344
update Employee 
set SUPERSSN = 102672
where SUPERSSN = 223344


--4th
select fname 'Name' ,SSn 'ID' from Employee E, Works_on W where  E.SSN = W.ESSN and  fname = 'Kamel'
update Works_On
set ESSn = 102672
where ESSn =223344

delete from Employee
where SSN = 223344

