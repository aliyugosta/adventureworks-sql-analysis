SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE gender = 'F'


SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE [birthdate] <= '1980-01-01'

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE gender = 'F' and [birthdate] <= '1980-01-01'

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE MaritalStatus = 'M' and JobTitle = 'Marketing Assistant'

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE JobTitle in ('Design Engineer', 'Marketing Assistant', 'Tool Designer')

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE JobTitle not in ('Design Engineer', 'Marketing Assistant', 'Tool Designer')

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE SickLeaveHours between 60 and 80

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE HireDate between '2009-01-01' and '2010-12-31'


SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE HireDate not between '2009-01-01' and '2010-12-31'

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE VacationHours between 60 and 80

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE JobTitle not like '%Design%'

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]
WHERE JobTitle like '%Designer'

SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee]

SELECT * 
	FROM [AdventureWorks2014].[Sales].[SalesOrderHeader]
	where salespersonid != 279

SELECT * , (OrderQty * UnitPrice) as Price
	FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]
	where UnitPrice <= 2000;

SELECT sum(linetotal) as sum_of_price 
	FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]

SELECT min(linetotal) as min_of_price 
	FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]

SELECT max(linetotal) as max_of_price 
	FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]

SELECT avg(linetotal) as avg_of_price 
	FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]

SELECT *
	FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]
	ORDER BY LineTotal DESC

SELECT *
	FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]
	ORDER BY LineTotal ASC

SELECT SalesOrderID, SUM(LineTotal) AS count_of_orders
	FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]
	GROUP BY SalesOrderID
	ORDER BY SalesOrderID 


SELECT *
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE BirthDate < '01-01-1980'


SELECT *
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE gender = 'f' and BirthDate <= '01-01-1980'

SELECT *
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE JobTitle = 'Marketing Assistant' AND MaritalStatus = 'M'


SELECT *
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE sickleavehours between 60 AND 80

SELECT *
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE sickleavehours not between 60 AND 80


SELECT *
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE sickleavehours between 60 AND 80 AND JobTitle = 'Marketing Assistant'


SELECT *
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE VacationHours between 20 AND 50


SELECT *
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE MaritalStatus = 'M' or JobTitle = 'Marketing Assistant'

SELECT * 
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE JobTitle like '%Design%'

SELECT * 
	FROM [AdventureWorks2014].[HumanResources].[Employee]
	WHERE JobTitle not like '%engineer%'



SELECT TOP (100) [BusinessEntityID]
		
		,[FirstName]
	FROM [AdventureWorks2014]. [Person]. [Person]
	where firstname not like 'a%'

select firstName, Lastname


SELECT * FROM [AdventureWorks2014].[HumanResources].[Employee] as emp
inner join [AdventureWorks2014].[Person].[Person] as per on emp.BusinessEntityID= per.BusinessEntityID


SELECT * FROM [AdventureWorks2014].[HumanResources].[EmployeeDepartmentHistory]


SELECT emp.BusinessEntityID, emp.jobTitle, emp.birthdate, emp.maritalStatus, emp.gender, eph.RateChangeDate, eph.modifiedDate 
		FROM [AdventureWorks2014].[HumanResources].[Employee] as emp
		inner join [AdventureWorks2014].[HumanResources].[EmployeePayHistory] as eph on emp.BusinessEntityID= eph.BusinessEntityID

SELECT * FROM [HumanResources].[Employee] as emp
SELECT * FROM [HumanResources].[JobCandidate] JC
	RIGHT JOIN [HumanResources].[Employee] on emp.BusinessEntityID=jc.BusinessEntityID

SELECT BusinessEntityID, title, firstname, lastname, middlename from Person.Person where title is not null
	union
	Select BusinessEntityID, title,firstname, lastname, middlename from Person.Person where lastName like 'a%'
	Order by LastName

SELECT * FROM HumanResources.Employee WHERE JobTitle like '%manager%'
	union all
SELECT * FROM HumanResources.Employee WHERE JobTitle like '%design%'

SELECT JobTitle, gender, MaritalStatus FROM HumanResources.Employee WHERE JobTitle like '%manager%'
	union 
SELECT JobTitle, gender, MaritalStatus  FROM HumanResources.Employee WHERE JobTitle like '%design%'

select emp.jobtitle, emp.maritalstatus, emp.gender, emp.hiredate, per.AddressLine1, per.city from humanresources.employee emp 
	left join person.BusinessEntityAddress ad on emp.BusinessEntityID= ad.BusinessEntityID 
	left join person.address per on per.AddressID=ad.AddressID where emp.hiredate < '2008-12-31' 
	union select emp.jobtitle, emp.maritalstatus, emp.gender, emp.hiredate, per.AddressLine1, per.city from humanresources.employee emp 
	left join person.BusinessEntityAddress ad on emp.BusinessEntityID= ad.BusinessEntityID 
	left join person.address per on per.AddressID=ad.AddressID where per.city = 'Redmond'