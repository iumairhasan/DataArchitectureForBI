/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Midterm.DM1
 *
 * Date Created : Wednesday, November 10, 2021 20:41:10
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: dimApplicant 
 */

CREATE TABLE dimApplicant(
    applicantSK     int             NOT NULL,
    firstName       varchar(100)    NULL,
    lastName        varchar(100)    NULL,
    summary         varchar(150)    NULL,
    phone           int             NULL,
    email           char(50)        NULL,
    documentLink    char(200)       NULL,
    coverLetter     varchar(50)     NULL,
    dateSK          int             NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (applicantSK)
)

go


IF OBJECT_ID('dimApplicant') IS NOT NULL
    PRINT '<<< CREATED TABLE dimApplicant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimApplicant >>>'
go

/* 
 * TABLE: dimCompany 
 */

CREATE TABLE dimCompany(
    companySK            int         NOT NULL,
    companyName          char(10)    NULL,
    companySector        char(10)    NULL,
    numberofEmployees    char(10)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (companySK)
)

go


IF OBJECT_ID('dimCompany') IS NOT NULL
    PRINT '<<< CREATED TABLE dimCompany >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimCompany >>>'
go

/* 
 * TABLE: dimDate 
 */

CREATE TABLE dimDate(
    dateSK    int     NOT NULL,
    datte     date    NULL,
    month     int     NULL,
    day       int     NULL,
    year      int     NULL,
    quater    int     NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (dateSK)
)

go


IF OBJECT_ID('dimDate') IS NOT NULL
    PRINT '<<< CREATED TABLE dimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimDate >>>'
go

/* 
 * TABLE: dimJobs 
 */

CREATE TABLE dimJobs(
    jobID              int         NOT NULL,
    jobCode            char(10)    NULL,
    employeesNeeded    char(10)    NULL,
    companyName        char(10)    NULL,
    companySector      char(10)    NULL,
    jobDescription     char(10)    NULL,
    joblink            char(10)    NULL,
    jobType            char(10)    NULL,
    dateSK             int         NOT NULL,
    startDate          int         NOT NULL,
    postedDate         int         NOT NULL,
    recruiterSk        char(10)    NOT NULL,
    companySK          int         NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (jobID)
)

go


IF OBJECT_ID('dimJobs') IS NOT NULL
    PRINT '<<< CREATED TABLE dimJobs >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimJobs >>>'
go

/* 
 * TABLE: dimRecruiter 
 */

CREATE TABLE dimRecruiter(
    recruiterSk      char(10)    NOT NULL,
    recruiterName    char(10)    NULL,
    companyName      char(10)    NULL,
    companySector    char(10)    NULL,
    companySK        int         NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (recruiterSk)
)

go


IF OBJECT_ID('dimRecruiter') IS NOT NULL
    PRINT '<<< CREATED TABLE dimRecruiter >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimRecruiter >>>'
go

/* 
 * TABLE: dimTest 
 */

CREATE TABLE dimTest(
    testID              int         NOT NULL,
    testName            char(10)    NULL,
    maxScore            int         NULL,
    maxDuration         int         NULL,
    createDate          int         NULL,
    testLink            char(10)    NULL,
    isActive            int         NULL,
    testDescription     char(10)    NULL,
    testStartTime       char(10)    NULL,
    testEndTime         char(10)    NULL,
    Score               char(10)    NULL,
    dateSK              int         NOT NULL,
    SOR_ID              char(10)    NULL,
    SOR_LoadDate        char(10)    NULL,
    SOR_UpdateDate      char(10)    NULL,
    DI_Job_ID           char(10)    NULL,
    DI_Create_Date      char(10)    NULL,
    DI_Modified_Date    char(10)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (testID)
)

go


IF OBJECT_ID('dimTest') IS NOT NULL
    PRINT '<<< CREATED TABLE dimTest >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimTest >>>'
go

/* 
 * TABLE: factApplication 
 */

CREATE TABLE factApplication(
    applicationID         int         NOT NULL,
    testID                int         NOT NULL,
    jobID                 int         NOT NULL,
    applicantSK           int         NOT NULL,
    applicationStates     int         NULL,
    applicationTime       int         NULL,
    applicationDetails    char(10)    NULL,
    applicationDate       int         NOT NULL,
    dateSK                int         NOT NULL,
    recruiterSk           char(10)    NOT NULL,
    SOR_ID                char(10)    NULL,
    SOR_DAate             char(10)    NULL,
    SOR_LoadDate          char(10)    NULL,
    SOR_UpdateDate        char(10)    NULL,
    DI_Job_ID             char(10)    NULL,
    DI_Create_Date        char(10)    NULL,
    DI_Modified_Date      char(10)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (applicationID)
)

go


IF OBJECT_ID('factApplication') IS NOT NULL
    PRINT '<<< CREATED TABLE factApplication >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE factApplication >>>'
go

/* 
 * TABLE: dimApplicant 
 */

ALTER TABLE dimApplicant ADD CONSTRAINT RefdimDate1 
    FOREIGN KEY (dateSK)
    REFERENCES dimDate(dateSK)
go


/* 
 * TABLE: dimJobs 
 */

ALTER TABLE dimJobs ADD CONSTRAINT RefdimDate3 
    FOREIGN KEY (dateSK)
    REFERENCES dimDate(dateSK)
go

ALTER TABLE dimJobs ADD CONSTRAINT RefdimDate4 
    FOREIGN KEY (postedDate)
    REFERENCES dimDate(dateSK)
go

ALTER TABLE dimJobs ADD CONSTRAINT RefdimDate5 
    FOREIGN KEY (startDate)
    REFERENCES dimDate(dateSK)
go

ALTER TABLE dimJobs ADD CONSTRAINT RefdimRecruiter14 
    FOREIGN KEY (recruiterSk)
    REFERENCES dimRecruiter(recruiterSk)
go

ALTER TABLE dimJobs ADD CONSTRAINT RefdimCompany17 
    FOREIGN KEY (companySK)
    REFERENCES dimCompany(companySK)
go


/* 
 * TABLE: dimRecruiter 
 */

ALTER TABLE dimRecruiter ADD CONSTRAINT RefdimCompany16 
    FOREIGN KEY (companySK)
    REFERENCES dimCompany(companySK)
go


/* 
 * TABLE: dimTest 
 */

ALTER TABLE dimTest ADD CONSTRAINT RefdimDate2 
    FOREIGN KEY (dateSK)
    REFERENCES dimDate(dateSK)
go


/* 
 * TABLE: factApplication 
 */

ALTER TABLE factApplication ADD CONSTRAINT RefdimTest7 
    FOREIGN KEY (testID)
    REFERENCES dimTest(testID)
go

ALTER TABLE factApplication ADD CONSTRAINT RefdimJobs8 
    FOREIGN KEY (jobID)
    REFERENCES dimJobs(jobID)
go

ALTER TABLE factApplication ADD CONSTRAINT RefdimApplicant9 
    FOREIGN KEY (applicantSK)
    REFERENCES dimApplicant(applicantSK)
go

ALTER TABLE factApplication ADD CONSTRAINT RefdimDate11 
    FOREIGN KEY (applicationDate)
    REFERENCES dimDate(dateSK)
go

ALTER TABLE factApplication ADD CONSTRAINT RefdimDate12 
    FOREIGN KEY (dateSK)
    REFERENCES dimDate(dateSK)
go

ALTER TABLE factApplication ADD CONSTRAINT RefdimRecruiter13 
    FOREIGN KEY (recruiterSk)
    REFERENCES dimRecruiter(recruiterSk)
go


