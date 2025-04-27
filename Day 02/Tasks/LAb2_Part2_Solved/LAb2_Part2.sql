--(1) Create DB With ur self
------------------------------->
--[Second Task]
1.select * from Employee

2.select DName,Salary,Dnumber from Department

3.select Pname ,Plocation ,Dnum  from Project

4.Select Fname + ' '+ Lname [Full Name],'10%' as 'ANNUAL COMM'  from Employee

5.select SSn, Fname + ' '+ Lname [Full Name] from Employee where Salary > 1000 

6.select SSn, Fname + ' '+ Lname [Full Name] from Employee where Salary * 12 > 10000 

7.select Fname + ' '+ Lname [Full Name],Salary from Employee where Sex = 'F' 

8.Select Dnumber , DName  from Department where MGRSSN = 968574

9. select Pnumber , Pname ,Plocation from Project where Dnum  =10