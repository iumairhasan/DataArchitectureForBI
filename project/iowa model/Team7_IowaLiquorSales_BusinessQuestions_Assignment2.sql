use IowaLiquorSalesModel;
CREATE VIEW top20Vendor AS
Select Top 20 di.vendorSK, sum(saleDollars) as TotalSales
From factLiquorSales ls
Join dimItems di
On ls.itemNumber = di.itemNumber
Join dimVendor dv
On di.vendorSK = dv.vendorSK
Group by di.vendorSK

CREATE VIEW top50Items AS
Select Top 50 di.itemNumber, sum(saleDollars) as TotalSales
From factLiquorSales ls
Join dimItems di
On ls.itemNumber = di.itemNumber
Group By di.itemNumber

CREATE VIEW top20Categories AS
Select Top 20 dc.categoryNumber, sum(saleDollars) as TotalSales
From factLiquorSales ls
Join dimItems di
On ls.itemNumber = di.itemNumber
Join dimCategory dc
On di.categorySK = dc.categorySK
Group by dc.categoryNumber

Create View yearSales as
Select sum(saleDollars) as "Yearly Sales", dd.year as "Year"
From factLiquorSales ls
Join dimDate dd
On ls.orderDateSK = dd.orderDateSK
Group By dd.year

Create View top20Stores as
Select Top 20 ds.storeNumber, ds.storeName, sum(saleDollars) as TotalSales
From factLiquorSales ls
Join dimStore ds
On ls.storeNumber = ds.storeNumber
Group By ds.storeNumber, ds.storeName

Create View top20Cities as
Select Top 20 dg.city ,sum(saleDollars) as TotalSales
From factLiquorSales ls
Join dimStore ds
On ls.storeNumber = ds.storeNumber
Join dimGeography dg
On ds.geographySK = dg.geographySK
Group By dg.city

Create View top20Counties as
Select Top 10 dg.county ,sum(saleDollars) as TotalSales
From factLiquorSales ls
Join dimStore ds
On ls.storeNumber = ds.storeNumber
Join dimGeography dg
On ds.geographySK = dg.geographySK
Group By dg.county




