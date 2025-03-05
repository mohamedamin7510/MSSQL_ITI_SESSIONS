use AdventureWorks2012
go 
--> Part2
--[First Query]
/*
[tips]
-- Format Takes a DateTime dt and  returns nvarchar()
-- Cast take an Expression and return any type
***************

*/
select SalesOrderID, ShipDate, OrderDate
from Sales.SalesOrderHeader 
where OrderDate between format(cast ('7-28-2002' as datetime),'yyyy-MM-dd')
and format(cast('7-29-2014' as datetime),'yyyy-MM-dd') 

--Another Way

select SalesOrderID, ShipDate, OrderDate
from Sales.SalesOrderHeader 
where OrderDate between '7-28-2002' and '7-29-2014'
------------------------------------------------------------------->
/*
[Second Query]
*/
select ProductID, Name, StandardCost  from Production.Product
where StandardCost < 110 
------------------------------------------------------------->
/*
[Third Query]
*/
select ProductID,Name ,Weight  from Production.Product
where Weight is  null
---------------------------------------->
/*
[Fourth Query]
*/
Select * From Production.product
where  color in ('Black', 'Silver', 'Red')
------------------------------>
/*
[5]
*/
Select * From Production.product
where  name like 'B%'

------------------------------------->
/*
[6]
*/
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

Select *from Production.ProductDescription 
where Description like '%[_]%'
/*
[7]
*/
select sum(TotalDue),OrderDate
from Sales.SalesOrderHeader 
where OrderDate  between '7/1/2001'  and '7/31/2014'
group by OrderDate
/*
[8]
*/
select  distinct HireDate 
from HumanResources.Employee
/*
[9]
*/
SELECT  avg(distinct ListPrice) from Production.Product

/*
[10]
we can use Convert(varchar(10),listprice) || concat method instead of that.
*/
select 'The '+ Name +' is only! '+cast(Listprice as varchar(10))
from   Production.Product
where ListPrice between 100 and 120 
order by ListPrice

select CONCAT('The ', Name ,' is only! ',Listprice)
from   Production.Product
where ListPrice between 100 and 120 
order by ListPrice

/*
[11]
*/
--a)
select   rowguid ,Name, SalesPersonID, Demographics into sstore_Archive 
from Sales.Store --701 Rows are effected 
-------------
--b)
select   rowguid ,Name, SalesPersonID, Demographics  
from Sales.Store 
where 1>2
--[12]
select format (GETDATE(),'yyy-MMM-dd:hh:mm')
union all
select format (GETDATE(),'MMMM-dd-yyyy:hh:mm')
union all
select format (GETDATE(),'yyy-MMM-dd')
union all
select format (GETDATE(),'yyyy-MMMM-dddd:hh:mm')

---------------->another understanding
select GETDATE()
union all
select SYSDATETIME()
union all
select SYSDATETIMEOFFSET()

