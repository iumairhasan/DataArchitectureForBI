use AdventureWorksDW2019;
/*What are the sales, discount amounts, product costs, profit, quantity ordered, number of orders & average 
order size (sales amount) of reseller sales by Product Hierarchy (Category, Subcategory, Model & 
Product) and ranked by sales?*/
Select d.ProductCategory, d.ProductSubcategory, d.ProductModel, d.ProductName, sum(SalesAmount) as Sales, sum(DiscountAmount) as discountAmount, TotalProductCost as productCost, 
		sum(TotalProductCost - SalesAmount) as Profit, sum(OrderQuantity) as orderQuantity, count(SalesOrderNumber) as "Number of Orders",
		AVG(SalesAmount) as "Average Order Size"
From dbo.FactResellerSales_qvw f
Join dbo.DimProduct_qvw d
On f.ProductKey = d.ProductKey
Group by d.ProductCategory, d.ProductSubcategory, d.ProductModel, d.ProductName, TotalProductCost
Order By Sales Desc, d.ProductCategory, d.ProductSubcategory, d.ProductModel ;

/*What are the sales, discount amounts, product costs, profit, quantity ordered, number of orders & average 
order size (sales amount) of reseller sales by reseller hierarchy (business type, reseller name)?*/
Select d.BusinessType, d.ResellerName, sum(SalesAmount) as Sales, sum(DiscountAmount) as discountAmount, TotalProductCost, 
		sum(TotalProductCost - SalesAmount) as Profit, sum(OrderQuantity) orderQuantity, count(SalesOrderNumber) as "Number of Orders",
		AVG(SalesAmount) as "Average Order Size"
From dbo.FactResellerSales_qvw f
Join dbo.DimReseller_qvw d
On f.ResellerKey = d.ResellerKey
Group By d.BusinessType, d.ResellerName, f.TotalProductCost
Order By d.BusinessType, d.ResellerName, Sales Desc;

/*What are the sales, discount amounts, product costs, profit, quantity ordered, number of orders & average 
order size (sales amount) of reseller sales by Geo Hierarchy (Country, State/Province & City of Reseller)?*/
Select d.BusinessType, d.ResellerName, g.CountryRegion, g.StateProvince, g.City, f.TotalProductCost, sum(SalesAmount) as Sales, sum(DiscountAmount) as discountAmount, 
		sum(TotalProductCost - SalesAmount) as Profit, sum(OrderQuantity) as orderQuantity, count(SalesOrderNumber) as "Number of Orders",
		AVG(SalesAmount) as "Average Order Size"
From dbo.FactResellerSales_qvw f
Join dbo.DimReseller_qvw d
On f.ResellerKey = d.ResellerKey
Join dbo.DimGeography_qvw g
On d.GeographyKey = g.GeographyKey
Group By d.BusinessType, d.ResellerName, g.CountryRegion, g.StateProvince, g.City, f.TotalProductCost
Order By d.BusinessType, d.ResellerName, g.CountryRegion, g.StateProvince, g.City, Sales Desc;

/*Who are the top salespeople?*/

Select Top 10 e.EmployeeName, sum(f.SalesAmount) as Sales
From dbo.FactResellerSales_qvw f
Join dbo.DimEmployee_qvw e
On f.EmployeeKey = e.EmployeeKey
Group By e.EmployeeName
Order By Sales Desc;

/*Product Contribution of Sales*/
Select d.ProductName, sum(f.SalesAmount) As Sales
From dbo.FactResellerSales_qvw f
Join dbo.DimProduct_qvw d
On f.ProductKey = d.ProductKey
Group by d.ProductName
Order By Sales Desc;

/*Sales Promotion & Discounts*/

Select p.PromotionType, p.PromotionName,sum(f.DiscountAmount) as Discount, sum(f.SalesAmount) as Sales
From dbo.FactResellerSales_qvw f
Join dbo.DimPromotion_qvw p
On f.PromotionKey = p.PromotionKey
Group By p.PromotionType, p.PromotionName
Order By p.PromotionType, p.PromotionName, Sales Desc;

/*Product Sales by Geo*/
Select p.ProductName, sum(f.SalesAmount) as Sales, g.CountryRegion, g.StateProvince, g.City
From dbo.FactResellerSales_qvw f
Join dbo.DimReseller_qvw d
On f.ResellerKey = d.ResellerKey
Join dbo.DimGeography_qvw g
On d.GeographyKey = g.GeographyKey
Join dbo.DimProduct_qvw p
On f.ProductKey = p.ProductKey
Group By g.CountryRegion, g.StateProvince, g.City, p.ProductName, f.SalesAmount
Order By Sales Desc;

/*Product Profits by Sales Territory*/

Select  sum(f.SalesAmount - f.TotalProductCost - 0) as Profit, st.SalesTerritoryRegion, st.SalesTerritoryGroup, st.SalesTerritoryCountry
From dbo.FactResellerSales_qvw f
Join dbo.DimReseller_qvw d
On f.ResellerKey = d.ResellerKey
Join dbo.DimGeography_qvw g
On d.GeographyKey = g.GeographyKey
Join dbo.DimProduct_qvw p
On f.ProductKey = p.ProductKey
Join dbo.DimSalesTerritory_gvw st
On g.SalesTerritoryKey = st.SalesTerritoryKey
Group By st.SalesTerritoryKey, st.SalesTerritoryRegion,st.SalesTerritoryGroup, st.SalesTerritoryCountry
Order by st.SalesTerritoryKey, st.SalesTerritoryRegion,st.SalesTerritoryGroup, st.SalesTerritoryCountry, Profit Desc;

/*Top Salespeople ranked*/
Select top 3 e.EmployeeName, sum(f.SalesAmount) as Sales, Dense_RANK() Over (Order By sum(f.SalesAmount) Desc) as Rank
From dbo.FactResellerSales_qvw f
Join dbo.DimEmployee_qvw e
On f.EmployeeKey = e.EmployeeKey
Group By e.EmployeeName
Order By Sales Desc;

/*Top Resellers (Stores) ranked*/
Select Dense_RANK() Over (Order By sum(f.SalesAmount) Desc) as Rank, d.ResellerName, sum(f.SalesAmount) as Sales 
From dbo.FactResellerSales_qvw f
Join dbo.DimReseller_qvw d
On f.ResellerKey = d.ResellerKey
Group By d.ResellerName
Order by Sales Desc;


/*Geo Contribution to Sales*/
Select g.CountryRegion, g.StateProvince, g.City, p.ProductCategory , p.ProductSubcategory, p.ProductName, sum(f.SalesAmount) as Sales
From dbo.FactResellerSales_qvw f
Join dbo.DimReseller_qvw d
On f.ResellerKey = d.ResellerKey
Join dbo.DimGeography_qvw g
On d.GeographyKey = g.GeographyKey
Join dbo.DimProduct_qvw p
On p.ProductKey = f.ProductKey
Group By p.ProductCategory, p.ProductSubcategory, g.CountryRegion, g.StateProvince, g.City, p.ProductName
Order by  g.CountryRegion, g.StateProvince, g.City, p.ProductCategory , p.ProductSubcategory, p.ProductName, Sales Desc;

/*Salespeople’s report with sales, profit and various person’s attributes*/
Select e.EmployeeName, e.Gender, e.MaritalStatus, e.BirthDate, e.DepartmentName, sum(f.SalesAmount) as Sales, sum(f.TotalProductCost - f.SalesAmount) as Profit
From dbo.FactResellerSales_qvw f
Join dbo.DimEmployee_qvw e
On f.EmployeeKey = e.EmployeeKey
Group By e.EmployeeName, e.Gender, e.MaritalStatus, e.BirthDate, e.DepartmentName
Order by Profit Desc;

/*Resellers’ report with sales, profit and various person’s attributes*/
Select d.ResellerName, d.BusinessType, d.YearOpened, sum(f.SalesAmount) as Sales, sum(f.TotalProductCost - f.SalesAmount) as Profit
From dbo.FactResellerSales_qvw f
Join dbo.DimReseller_qvw d
On f.ResellerKey = d.ResellerKey
Group By d.ResellerName, d.BusinessType, d.YearOpened
Order by Profit Desc;
