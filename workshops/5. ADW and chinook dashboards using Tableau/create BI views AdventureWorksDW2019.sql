--
-- create views to use fo BI workshops
-- rick sherman
-- last update: 2021-10-282021-07-03, 2020-03-19
--

use AdventureWorksDW2019
go 

create view DimCurrency_qvw
as
SELECT
  CurrencyKey
 ,CurrencyAlternateKey
 --,CurrencyName
FROM DimCurrency  
go 

create view DimCustomer_qvw
as
SELECT
  CustomerKey
 ,GeographyKey
 --,CustomerAlternateKey
  ,LastName + ', ' + FirstName as CustomerName
 ,Title
 ,FirstName
 ,MiddleName
 ,LastName
 ,NameStyle
 ,BirthDate
 ,MaritalStatus
 ,Suffix
 ,Gender
 --,EmailAddress
 ,YearlyIncome
 ,TotalChildren
 ,NumberChildrenAtHome
 ,EnglishEducation as Education
 ,EnglishOccupation as Occupation
 ,HouseOwnerFlag
 ,NumberCarsOwned
 ,AddressLine1
 ,AddressLine2
 --,Phone
 ,DateFirstPurchase
 ,CommuteDistance
FROM DimCustomer  
go 

Create View DimDate_qvw
as
SELECT
  DateKey as DateKey
 ,FullDateAlternateKey as FullDate
 ,DayNumberOfWeek 
 ,EnglishDayNameOfWeek as DayNameOfWeek
 ,DayNumberOfMonth 
 ,DayNumberOfYear 
 ,WeekNumberOfYear 
 ,EnglishMonthName as  MonthName
 ,MonthNumberOfYear as Month
 ,CalendarQuarter as Quarter
 ,CalendarYear as Year
-- ,CalendarSemester 
 --,FiscalQuarter
 --,FiscalYear
-- ,FiscalSemester
FROM DimDate  
go 

Create View DimDueDate_qvw
as
SELECT
  DateKey as DueDateKey
 ,FullDateAlternateKey as DueDate
 ,DayNumberOfWeek as Due_DayNumberOfWeek
 ,EnglishDayNameOfWeek as Due_DayNameOfWeek
 ,DayNumberOfMonth as Due_DayNumberOfMonth
 ,DayNumberOfYear as Due_DayNumberOfYear
 ,WeekNumberOfYear Due_WeekNumberOfYear
 ,EnglishMonthName as  Due_MonthName
 ,MonthNumberOfYear as Due_Month
 ,CalendarQuarter as Due_Quarter
 ,CalendarYear as Due_Year
-- ,CalendarSemester 
 --,FiscalQuarter
 --,FiscalYear
-- ,FiscalSemester
FROM DimDate  
go 

create view DimEmployee_qvw
as
SELECT
  EmployeeKey
 ,ParentEmployeeKey
 ,EmployeeNationalIDAlternateKey
 ,ParentEmployeeNationalIDAlternateKey
-- ,SalesTerritoryKey
 ,LastName + ', ' + FirstName as EmployeeName
 ,FirstName
 ,LastName
 ,MiddleName
 ,NameStyle
 ,Title
 ,HireDate
 ,BirthDate
 --,LoginID
 --,EmailAddress
 --,Phone
 ,MaritalStatus
-- ,EmergencyContactName
-- ,EmergencyContactPhone
 ,SalariedFlag
 ,Gender
 ,PayFrequency
 ,BaseRate
 ,VacationHours
 ,SickLeaveHours
 ,CurrentFlag
 ,SalesPersonFlag
 ,DepartmentName
 ,StartDate
 ,EndDate
 ,Status
-- ,EmployeePhoto
FROM DimEmployee  
go 

create view DimGeography_qvw
as
SELECT GeographyKey,
       City,
       StateProvinceCode,
       StateProvinceName as StateProvince,
       CountryRegionCode,
       EnglishCountryRegionName as CountryRegion,
       PostalCode,
       SalesTerritoryKey
      -- IpAddressLocator
  FROM DimGeography  
go 

Create View DimOrderDate_qvw
as
SELECT
  DateKey as OrderDateKey
 ,FullDateAlternateKey as OrderDate
 ,DayNumberOfWeek as Order_DayNumberOfWeek
 ,EnglishDayNameOfWeek as Order_DayNameOfWeek
 ,DayNumberOfMonth as Order_DayNumberOfMonth
 ,DayNumberOfYear as Order_DayNumberOfYear
 ,WeekNumberOfYear Order_WeekNumberOfYear
 ,EnglishMonthName as  Order_MonthName
 ,MonthNumberOfYear as Order_Month
 ,CalendarQuarter as Order_Quarter
 ,CalendarYear as Order_Year
-- ,CalendarSemester 
 --,FiscalQuarter
 --,FiscalYear
-- ,FiscalSemester
FROM DimDate 
go

create view DimProduct_qvw
as
SELECT
  ProductKey
 --,ProductAlternateKey
 ,pro.ProductSubcategoryKey
 --,sub.ProductSubcategoryAlternateKey
 ,sub.ProductCategoryKey
 --,ProductCategoryAlternateKey
  ,EnglishProductName as ProductName
  ,EnglishDescription as ProductDescription
  ,EnglishProductSubcategoryName as ProductSubcategory
  ,EnglishProductCategoryName as ProductCategory
  ,ModelName as ProductModel
  ,ProductLine
 ,WeightUnitMeasureCode
 ,SizeUnitMeasureCode
 ,StandardCost
 ,FinishedGoodsFlag
 ,Color
 ,SafetyStockLevel
 ,ReorderPoint
 ,ListPrice
 ,[Size]
 ,SizeRange
 ,Weight
 ,DaysToManufacture
 ,DealerPrice
 ,Class
 ,Style
 --,LargePhoto
 ,StartDate as ProductStartDate
 ,EndDate as ProductEndDate
 ,Status as ProductStatus
FROM DimProduct pro
left outer join DimProductSubcategory sub
on pro.ProductSubcategoryKey = sub.ProductSubcategoryKey
left outer join DimProductCategory cat
on sub.ProductCategoryKey = cat.ProductCategoryKey 
 go 

create view DimPromotion_qvw
as
SELECT
  PromotionKey
 --,PromotionAlternateKey
 ,EnglishPromotionName as PromotionName
 ,DiscountPct
 ,EnglishPromotionType as PromotionType
 ,EnglishPromotionCategory as PromotionCategory
 ,StartDate as PromotionStartDate
 ,EndDate as PromotionEndDate
 ,MinQty
 ,MaxQty
FROM DimPromotion  
go 

create view DimReseller_qvw
as
SELECT  
  ResellerKey
 ,GeographyKey
 --,ResellerAlternateKey
 --,Phone
 ,BusinessType
 ,ResellerName
 ,NumberEmployees
 ,OrderFrequency
 ,OrderMonth
 ,FirstOrderYear
 ,LastOrderYear
 ,ProductLine
 ,AddressLine1
 ,AddressLine2
 ,AnnualSales
 ,BankName
 ,MinPaymentType
 ,MinPaymentAmount
 ,AnnualRevenue
 ,YearOpened
FROM DimReseller  
go 

create VIEW DimSalesTerritory_gvw
as
SELECT
  SalesTerritoryKey
 --,SalesTerritoryAlternateKey
 ,SalesTerritoryRegion
 ,SalesTerritoryCountry
 ,SalesTerritoryGroup
 --,SalesTerritoryImage
FROM DimSalesTerritory  
go 

Create View DimShipDate_qvw
as
SELECT
  DateKey as ShipDateKey
 ,FullDateAlternateKey as ShipDate
 ,DayNumberOfWeek as Ship_DayNumberOfWeek
 ,EnglishDayNameOfWeek as Ship_DayNameOfWeek
 ,DayNumberOfMonth as Ship_DayNumberOfMonth
 ,DayNumberOfYear as Ship_DayNumberOfYear
 ,WeekNumberOfYear Ship_WeekNumberOfYear
 ,EnglishMonthName as  Ship_MonthName
 ,MonthNumberOfYear as Ship_Month
 ,CalendarQuarter as Ship_Quarter
 ,CalendarYear as Ship_Year
-- ,CalendarSemester 
 --,FiscalQuarter
 --,FiscalYear
-- ,FiscalSemester
FROM DimDate  
go 

create view FactInternetSales_qvw
as

SELECT
  ProductKey
 ,OrderDateKey
 ,DueDateKey
 ,ShipDateKey
 ,CustomerKey
 ,PromotionKey
 ,CurrencyKey
-- ,SalesTerritoryKey
,SalesOrderNumber
,SalesOrderLineNumber
-- ,RevisionNumber
 ,OrderQuantity
-- ,UnitPrice
 ,ExtendedAmount
-- ,UnitPriceDiscountPct
 ,DiscountAmount
-- ,ProductStandardCost
 ,TotalProductCost
 ,SalesAmount
 ,TaxAmt
 ,Freight
 -- ,CarrierTrackingNumber
 -- ,CustomerPONumber
 ,OrderDate
 ,DueDate
 ,ShipDate
FROM FactInternetSales  
go 

create VIEW FactResellerSales_qvw
as
SELECT
  ProductKey
 ,OrderDateKey
 ,DueDateKey
 ,ShipDateKey
 ,ResellerKey
 ,EmployeeKey
 ,PromotionKey
 ,CurrencyKey
 --,SalesTerritoryKey
,SalesOrderNumber
,SalesOrderLineNumber
--,RevisionNumber
 ,OrderQuantity
 --,UnitPrice
 ,ExtendedAmount
 ,UnitPriceDiscountPct
 ,DiscountAmount
 --,ProductStandardCost
 ,TotalProductCost
 ,SalesAmount
 ,TaxAmt
 ,Freight
-- ,CarrierTrackingNumber
--,CustomerPONumber
 ,OrderDate
 ,DueDate
 ,ShipDate
FROM FactResellerSales 
go 
