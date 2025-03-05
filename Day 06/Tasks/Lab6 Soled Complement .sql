(2)

(a)
 create schema Company 
(I)alter schema Company transfer  Department 
(II)Right click on Project -> Design -> Right Click -> Proprities -> Schema and ckoose Company Schema

(b)
Create schema HumanResources
alter schema HumanResources transfer Employee


(3)   -- Write query to display the constraints for the Employee table.
-- this still take it in next sessions so try it take a look about it now  
[
SELECT 
    tc.CONSTRAINT_NAME,
    tc.CONSTRAINT_TYPE,
    cc.COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
JOIN 
    INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE cc
    ON tc.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
WHERE 
    tc.TABLE_NAME = 'Employee';
/*
[Explanation from copilot]

INFORMATION_SCHEMA.TABLE_CONSTRAINTS: This view contains information about table constraints.

INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE: This view contains information about columns used in constraints.

tc.CONSTRAINT_NAME: The name of the constraint.

tc.CONSTRAINT_TYPE: The type of constraint (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, etc.).

cc.COLUMN_NAME: The name of the column that the constraint is applied to.

tc.TABLE_NAME = 'Employee': Filters the results to show constraints for the Employee table.

*/]

(4)
create synonym Emp for HumanResources.Employee
(a)
Select *from Employee
-- you must put the schema name before table name to access the object 
(b)
Select * from HumanResources.Employee
-- Put it
(C)
Select * from Emp
--Emp =  HumanResources.Employee
(d)
select *from  [HumanResources].EmpPro
----[HumanResources].Emp =  [HumanResources].HumanResources.Employee This is an invalid object name .


(5)-- Increase the budget of the project where the manager number is 10102 by 10%.
-- will use Join With update statemnt 
update Cp set Budget += Budget*.10
from Company.Project Cp Join Works_on WO
on Cp.ProjectNo = WO.ProjectNo
where Wo.EmpNo = 10102 and Wo.Job = 'Manager' 


(6)
update d set DeptName = 'Sales'
from Company.Department d  Join HumanResources.Employee E 
on d.DeptNo = E.DeptNo 
where E.EmpFname = 'James '

(7)
-- Will merge three table by Join to make this query and them are Works_On,Employee and Departmrnt
update W set Enter_Date = '12.12.2007'  
from Works_on W 
Join Emp on w.EmpNo = Emp.EmpNo
Join Company.Department CD on Emp.DeptNo = CD.DeptNo 
where W.ProjectNo = 'P1' and Cd.DeptName = 'Sales' 

(8)
-- same the above but using Delete not update
Delete W from Works_on W Join Emp on w.EmpNo = Emp.EmpNo
Join Company.Department CD on Emp.DeptNo = CD.DeptNo 
where Cd.Location = 'KW'

(9) --you should do it with ur self hahahahaahaaha