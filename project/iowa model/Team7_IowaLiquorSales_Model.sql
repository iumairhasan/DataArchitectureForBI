/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Team7_IowaLiquorSales_DataModel_v2.DM1
 *
 * Date Created : Sunday, October 10, 2021 20:07:23
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: dimCategory 
 */

CREATE TABLE dimCategory(
    categoryNumber    int         NOT NULL,
    categoryName      char(10)    NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (categoryNumber)
)

go


IF OBJECT_ID('dimCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE dimCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimCategory >>>'
go

/* 
 * TABLE: dimCustomer 
 */

CREATE TABLE dimCustomer(
    customerSK       int             NOT NULL,
    geographySK      int             NOT NULL,
    firstName        varchar(100)    NOT NULL,
    lastName         varchar(100)    NOT NULL,
    contactNumber    int             NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (customerSK)
)

go


IF OBJECT_ID('dimCustomer') IS NOT NULL
    PRINT '<<< CREATED TABLE dimCustomer >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimCustomer >>>'
go

/* 
 * TABLE: dimDate 
 */

CREATE TABLE dimDate(
    orderDateSK    varchar(50)    NOT NULL,
    date           date           NOT NULL,
    month          varchar(50)    NOT NULL,
    year           int            NOT NULL,
    CONSTRAINT PK3_1 PRIMARY KEY NONCLUSTERED (orderDateSK)
)

go


IF OBJECT_ID('dimDate') IS NOT NULL
    PRINT '<<< CREATED TABLE dimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimDate >>>'
go

/* 
 * TABLE: dimGeography 
 */

CREATE TABLE dimGeography(
    geographySK      int              NOT NULL,
    countyNumber     int              NOT NULL,
    streetAddress    varchar(50)      NULL,
    city             varchar(50)      NOT NULL,
    county           varchar(1050)    NOT NULL,
    zipcode          varchar(50)      NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (geographySK)
)

go


IF OBJECT_ID('dimGeography') IS NOT NULL
    PRINT '<<< CREATED TABLE dimGeography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimGeography >>>'
go

/* 
 * TABLE: dimItems 
 */

CREATE TABLE dimItems(
    itemNumber                varchar(150)    NOT NULL,
    vendorNumber              varchar(50)     NOT NULL,
    categoryNumber            int             NOT NULL,
    SCC                       int             NOT NULL,
    UPC                       int             NOT NULL,
    itemDescription           varchar(50)     NOT NULL,
    pack                      int             NOT NULL,
    bottleVolume              int             NULL,
    stateBottleCost           money           NOT NULL,
    stateBottleRetailPrice    money           NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (itemNumber)
)

go


IF OBJECT_ID('dimItems') IS NOT NULL
    PRINT '<<< CREATED TABLE dimItems >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimItems >>>'
go

/* 
 * TABLE: dimSales 
 */

CREATE TABLE dimSales(
    salesSK              varchar(50)    NOT NULL,
    bottlesSold          int            NOT NULL,
    salesDollars         money          NOT NULL,
    volumeSoldLitres     int            NOT NULL,
    volumeSoldDollars    money          NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (salesSK)
)

go


IF OBJECT_ID('dimSales') IS NOT NULL
    PRINT '<<< CREATED TABLE dimSales >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimSales >>>'
go

/* 
 * TABLE: dimStore 
 */

CREATE TABLE dimStore(
    storeNumber      int             NOT NULL,
    geographySK      int             NOT NULL,
    storeStatus      varchar(100)    NULL,
    storeLocation    varchar(50)     NOT NULL,
    storeName        varchar(50)     NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (storeNumber)
)

go


IF OBJECT_ID('dimStore') IS NOT NULL
    PRINT '<<< CREATED TABLE dimStore >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimStore >>>'
go

/* 
 * TABLE: dimVendor 
 */

CREATE TABLE dimVendor(
    vendorNumber    varchar(50)    NOT NULL,
    vendorName      varchar(50)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (vendorNumber)
)

go


IF OBJECT_ID('dimVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE dimVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimVendor >>>'
go

/* 
 * TABLE: factLiquorSales 
 */

CREATE TABLE factLiquorSales(
    invoiceNumber    varchar(150)    NOT NULL,
    storeNumber      int             NOT NULL,
    orderDateSK      varchar(50)     NOT NULL,
    salesSK          varchar(50)     NOT NULL,
    itemNumber       varchar(150)    NOT NULL,
    customerSK       int             NOT NULL,
    orderDate        date            NOT NULL,
    bottlesSold      int             NOT NULL,
    saleValue        int             NOT NULL,
    volumeGallon     int             NOT NULL,
    volumeGallons    int             NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (invoiceNumber)
)

go


IF OBJECT_ID('factLiquorSales') IS NOT NULL
    PRINT '<<< CREATED TABLE factLiquorSales >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE factLiquorSales >>>'
go

/* 
 * TABLE: dimCustomer 
 */

ALTER TABLE dimCustomer ADD CONSTRAINT RefdimGeography12 
    FOREIGN KEY (geographySK)
    REFERENCES dimGeography(geographySK)
go


/* 
 * TABLE: dimItems 
 */

ALTER TABLE dimItems ADD CONSTRAINT RefdimVendor14 
    FOREIGN KEY (vendorNumber)
    REFERENCES dimVendor(vendorNumber)
go

ALTER TABLE dimItems ADD CONSTRAINT RefdimCategory16 
    FOREIGN KEY (categoryNumber)
    REFERENCES dimCategory(categoryNumber)
go


/* 
 * TABLE: dimStore 
 */

ALTER TABLE dimStore ADD CONSTRAINT RefdimGeography8 
    FOREIGN KEY (geographySK)
    REFERENCES dimGeography(geographySK)
go


/* 
 * TABLE: factLiquorSales 
 */

ALTER TABLE factLiquorSales ADD CONSTRAINT RefdimStore3 
    FOREIGN KEY (storeNumber)
    REFERENCES dimStore(storeNumber)
go

ALTER TABLE factLiquorSales ADD CONSTRAINT RefdimDate5 
    FOREIGN KEY (orderDateSK)
    REFERENCES dimDate(orderDateSK)
go

ALTER TABLE factLiquorSales ADD CONSTRAINT RefdimSales7 
    FOREIGN KEY (salesSK)
    REFERENCES dimSales(salesSK)
go

ALTER TABLE factLiquorSales ADD CONSTRAINT RefdimItems11 
    FOREIGN KEY (itemNumber)
    REFERENCES dimItems(itemNumber)
go

ALTER TABLE factLiquorSales ADD CONSTRAINT RefdimCustomer13 
    FOREIGN KEY (customerSK)
    REFERENCES dimCustomer(customerSK)
go


