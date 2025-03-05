/*

(1)


[new information]
1. if we create user defined DT with string dt you must put it in 'nchar(2)'
2. to drop new dt you have done use the sp --> Sp_droptype [type naem] like sp_droptype Loc2
3. how to add null constrain with  new way--> constraint  deptname check (DeptName is not null) 
4. We Write the name of constraint as the follwing Format for clean code [Table name]_[ColumnName with small letter]
5.
*/

-- [First Table]
					-- To create the user defined DT Loc as he nedded
					/*
					(1) sp_addtype Loc ,'nchar(2)'

					(2)create default df1 as 'NY' 
					   SP_bindefault df1 , Loc

					(3)create Rule R1 as @X in ('NY' , 'DS', 'KW')
						Sp_bindRule R1 , Loc
						
						*/

create Table Department 
(
DeptNo  varchar(5) ,
constraint deptno primary key(DeptNo),

DeptName varchar(20) ,
constraint  deptname check (DeptName is not null) ,

Location  Loc ,
)
-- insert inot Department table the required data
/*
d1	Research	NY
d2	Accounting	DS
d3	Markiting	KW
*/
insert into Department 
values('d3','Markiting','KW')


----[ Second Table]

create table  Employee
(
EmpNo int ,
constraint empno primary Key (EmpNo),

EmpFname varchar(20) Not null , 

EmpLname varchar(20) Not null , 

DeptNo  varchar(5) ,
constraint Employee_deptno foreign Key (DeptNo) references Department(DeptNo),

Salary int ,
constraint salary unique(Salary),

)

-- Creating rule for Salary
Create rule Employee_salaryRule as @x < 6000
Sp_bindRule Employee_salaryRule , 'Employee.Salary'

--> entering the required data  ...
25348	Mathew	Smith	d3	2500
10102	Ann		Jones	d3	3000
18316	John	Barrimore	d1	2400
29346	James	James	d2	2800

insert into  Employee 
values(29346,'James','James','d2',2800)

------[3rd Table ]

-- With Wizard so, do it buby 
--inserting the required date
insert into  Project 
values('p3','Mercury',185600)

------[4rth Table ]
-- With Wizard so, do it buby 
-- tip put the following as a default for EnterDate to store it with the required format
 format(getdate(), 'yyyy.MM.dd')
-- inserting the required date
10102	p1	Analyst	2006.10.1
10102	p3	Manager	2012.1.1
25348	p2	Clerk	2007.2.15
18316	p2	NULL	2007.6.1
25348	p1  NULL	default

insert into  Works_on 
values(18316,'p2',NULL,'2007.6.1')


--Testing Referential Integrity
(1)insert into Works_on (EmpNo , ProjectNo)
values(11111 ,'p2')
-- give you fuck error because you don't have 11111 this employee in employee table. therfore,this ensure on referentail integraity


(2)
update Works_on
set EmpNo = 11111   
where EmpNo = 10102

-- What do you do ? are you fool ? you didn't have employee with 11111 to change to it
(3)
update Employee
set EmpNo = 22222   
where EmpNo = 10102
-- it will conflict with F.K in Works_on and it won't be changed, so we took update Rule Cascade before to solve this problem . you should'nt do these i remember you only


(4)
delete from Employee 
where EmpNo = 10102
-- You should use Delete Rule with NULL to can use this Query

[Table Modfication ]
(1) Alter table Employee  add  TelephoneNumber  varchar(11)
(2) Alter table Employee drop Column  TelephoneNumber 
(3) i will provide you picture to my DataBase Diagram

