USE AdventureWorks2019;
Select cr.Name, sum(soh.TotalDue) as "Total Sales"
from Sales.SalesOrderHeader soh
join Person.Address ad
on soh.BillToAddressID = ad.AddressID
join Person.StateProvince sp
on ad.StateProvinceID = sp.StateProvinceID
join Person.CountryRegion cr
on sp.CountryRegionCode = cr.CountryRegionCode
group by cr.Name
order by 2 desc

USE AdventureWorks2019;
Select cr.Name, sum(soh.TotalDue) as "Total Sales"
from Sales.SalesOrderHeader soh
join Sales.SalesTerritory st
on soh.TerritoryID = st.TerritoryID
join Person.CountryRegion cr
on st.CountryRegionCode = cr.CountryRegionCode
group by cr.Name
order by 2 desc

USE AdventureWorksDW2019;
select dd.CalendarYear, sum(isales.salesamount) as "Yearly Sales" from
dbo.FactInternetSales isales
join dbo.DimDate dd
on isales.OrderDateKey = dd.DateKey
group by dd.CalendarYear
order by 2