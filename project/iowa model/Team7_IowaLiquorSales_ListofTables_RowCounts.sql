use IowaLiquorSalesModel;

Declare @SumVal1 varchar(10);
Select @SumVal1=Count(*) From dbo.dimCategory;;
Print N'Number of Rows in dimension Category is  ' + 
@SumVal1;

Declare @SumVal2 varchar(10);
Select @SumVal2=Count(*) From dbo.dimDate;;
Print N'Number of Rows in dimension Date is  ' + 
@SumVal2;

Declare @SumVal3 varchar(10);
Select @SumVal3=Count(*) From dbo.dimGeography;;
Print N'Number of Rows in dimension Geography is  ' + 
@SumVal3;

Declare @SumVal4 varchar(10);
Select @SumVal4=Count(*) From dbo.dimItems;;
Print N'Number of Rows in dimension Items is  ' + 
@SumVal4;

Declare @SumVal5 varchar(10);
Select @SumVal5=Count(*) From dbo.dimStore;;
Print N'Number of Rows in dimension Store is  ' + 
@SumVal5;

Declare @SumVal6 varchar(10);
Select @SumVal6=Count(*) From dbo.dimVendor;;
Print N'Number of Rows in dimension Vendor is  ' + 
@SumVal6;

Declare @SumVal7 varchar(10);
Select @SumVal7=Count(*) From dbo.factLiquorSales;;
Print N'Number of Rows in factLiquorSales is  ' + 
@SumVal7;