/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Team7_GradStudentModel_v4.DM1
 *
 * Date Created : Tuesday, October 05, 2021 23:07:35
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: dimAvailableCourses 
 */
/*CREATE DATABASE team7_graduateStudentModel;*/
USE graduateStudentModel;
CREATE TABLE dimAvailableCourses(
    availableCoursesSK    int    NOT NULL,
    CRN                   int    NOT NULL,
    semesterSK            int    NOT NULL,
    departmentSK          int    NOT NULL,
    professorNUID         int    NOT NULL,
    CONSTRAINT PK4_1 PRIMARY KEY NONCLUSTERED (availableCoursesSK)
)

go


IF OBJECT_ID('dimAvailableCourses') IS NOT NULL
    PRINT '<<< CREATED TABLE dimAvailableCourses >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimAvailableCourses >>>'
go

/* 
 * TABLE: dimCalendar 
 */

CREATE TABLE dimCalendar(
    calendarSK         int            NOT NULL,
    Date               date           NOT NULL,
    month              int            NOT NULL,
    year               int            NOT NULL,
    semester           varchar(50)    NOT NULL,
    holidayBool        char(10)       NOT NULL,
    semesterWeek       int            NOT NULL,
    semesterMonth      int            NOT NULL,
    dayNameOfWeek      varchar(50)    NOT NULL,
    dayOfWeek          int            NOT NULL,
    monthOfYear        int            NOT NULL,
    monthNameOfYear    varchar(50)    NOT NULL,
    CONSTRAINT PK35 PRIMARY KEY NONCLUSTERED (calendarSK)
)

go


IF OBJECT_ID('dimCalendar') IS NOT NULL
    PRINT '<<< CREATED TABLE dimCalendar >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimCalendar >>>'
go

/* 
 * TABLE: dimCourse 
 */

CREATE TABLE dimCourse(
    courseNumber       int         NOT NULL,
    departmentSK       int              NOT NULL,
    courseName         varchar(50)      NOT NULL,
    lectureMode        varchar(50)      NOT NULL,
    numberOfCredits    varchar(1050)    NOT NULL,
    isCore             varchar(10)      NOT NULL,
    CONSTRAINT PK24 PRIMARY KEY NONCLUSTERED (courseNumber)
)

go
Alter Table dimCourse
Alter Column courseName varchar(100);


IF OBJECT_ID('dimCourse') IS NOT NULL
    PRINT '<<< CREATED TABLE dimCourse >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimCourse >>>'
go

/* 
 * TABLE: dimCourseOffering 
 */

CREATE TABLE dimCourseOffering(
    CRN                   int            NOT NULL,
    courseNumber          geometry       NOT NULL,
    semesterSK            int            NOT NULL,
    departmentSK          int            NOT NULL,
    professorNUID         int            NOT NULL,
    geagraphySK           int            NOT NULL,
    currentlyAvailable    varchar(10)    NULL,
    section               int            NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (CRN)
)

go
Alter Table dimCourseOffering
Drop Column courseNumber;
Alter Table dimCourseOffering
Add courseNumber int;


IF OBJECT_ID('dimCourseOffering') IS NOT NULL
    PRINT '<<< CREATED TABLE dimCourseOffering >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimCourseOffering >>>'
go

/* 
 * TABLE: dimDepartments 
 */

CREATE TABLE dimDepartments(
    departmentSK        int            NOT NULL,
    college             varchar(75)    NULL,
    departmentName      varchar(50)    NOT NULL,
    programName         varchar(25)    NOT NULL,
    programStartDate    date           NULL,
    programEndDate      date           NULL,
    numberOfCredits     int            NOT NULL,
    perCreditFee        int            NOT NULL,
    CONSTRAINT PK37 PRIMARY KEY NONCLUSTERED (departmentSK)
)

go
Alter Table dimDepartments 
Alter column programName varchar(100);


IF OBJECT_ID('dimDepartments') IS NOT NULL
    PRINT '<<< CREATED TABLE dimDepartments >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimDepartments >>>'
go

/* 
 * TABLE: dimGeographys 
 */

CREATE TABLE dimGeographys(
    geagraphySK    int             NOT NULL,
    homeAddress    varchar(150)    NOT NULL,
    state          varchar(30)     NOT NULL,
    city           varchar(50)     NOT NULL,
    zipcode        int             NOT NULL,
    country        varchar(50)     NOT NULL,
    CONSTRAINT PK30 PRIMARY KEY NONCLUSTERED (geagraphySK)
)

go


IF OBJECT_ID('dimGeographys') IS NOT NULL
    PRINT '<<< CREATED TABLE dimGeographys >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimGeographys >>>'
go

/* 
 * TABLE: dimProfessorHometownOutrigger 
 */

CREATE TABLE dimProfessorHometownOutrigger(
    hometownProfessorSK    int             NOT NULL,
    homeAddress            varchar(150)    NOT NULL,
    state                  varchar(30)     NOT NULL,
    city                   varchar(50)     NOT NULL,
    zipcode                int             NOT NULL,
    country                varchar(50)     NOT NULL,
    CONSTRAINT PK30_1_1 PRIMARY KEY NONCLUSTERED (hometownProfessorSK)
)

go


IF OBJECT_ID('dimProfessorHometownOutrigger') IS NOT NULL
    PRINT '<<< CREATED TABLE dimProfessorHometownOutrigger >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimProfessorHometownOutrigger >>>'
go

/* 
 * TABLE: dimProfessors 
 */

CREATE TABLE dimProfessors(
    professorNUID          int            NOT NULL,
    geagraphySK            int            NOT NULL,
    hometownProfessorSK    int            NOT NULL,
    firstName              varchar(50)    NOT NULL,
    lastName               varchar(50)    NOT NULL,
    email                  varchar(50)    NOT NULL,
    gender                 varchar(25)    NOT NULL,
    officeNumber           int            NOT NULL,
    CONSTRAINT PK31 PRIMARY KEY NONCLUSTERED (professorNUID)
)

go
Alter Table dbo.dimProfessors
Alter Column officeNumber bigint;


IF OBJECT_ID('dimProfessors') IS NOT NULL
    PRINT '<<< CREATED TABLE dimProfessors >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimProfessors >>>'
go

/* 
 * TABLE: dimSemester 
 */

CREATE TABLE dimSemester(
    semesterSK           int            NOT NULL,
    semesterName         varchar(50)    NOT NULL,
    semesterStartDate    date           NOT NULL,
    semesterEndDate      date           NOT NULL,
    CONSTRAINT PK36 PRIMARY KEY NONCLUSTERED (semesterSK)
)

go


IF OBJECT_ID('dimSemester') IS NOT NULL
    PRINT '<<< CREATED TABLE dimSemester >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimSemester >>>'
go

/* 
 * TABLE: dimStudentHometownOutrigger 
 */

CREATE TABLE dimStudentHometownOutrigger(
    hometownStudentSK    int             NOT NULL,
    homeAddress          varchar(150)    NOT NULL,
    state                varchar(30)     NOT NULL,
    city                 varchar(50)     NOT NULL,
    zipcode              int             NOT NULL,
    country              varchar(50)     NOT NULL,
    CONSTRAINT PK30_1 PRIMARY KEY NONCLUSTERED (hometownStudentSK)
)

go


IF OBJECT_ID('dimStudentHometownOutrigger') IS NOT NULL
    PRINT '<<< CREATED TABLE dimStudentHometownOutrigger >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimStudentHometownOutrigger >>>'
go

/* 
 * TABLE: dimStudents 
 */
 Drop Table dimStudents;
CREATE TABLE dimStudents(
    studentNUID                int            NOT NULL,
    geagraphySK                int            NOT NULL,
    hometownStudentSK          int            NOT NULL,
    calendarSK                 int            NOT NULL,
    numberOfCreditsObtained    int            NULL,
    firstName                  varchar(50)    NOT NULL,
    lastName                   varchar(50)    NOT NULL,
    dateOfBirth                date           NOT NULL,
    email                      varchar(50)    NOT NULL,
    gender                     varchar(10)    NOT NULL,
    nationality                varchar(50)    NULL,
    livingOnCampus             binary(10)     NOT NULL,
    numberOfCreditCompleted    int            NOT NULL,
    numberOfCreditsToDegree    int            NOT NULL,
    CONSTRAINT PK32 PRIMARY KEY NONCLUSTERED (studentNUID)
)

go
Alter Table dimStudents
Add graduationDate Date;
Alter Table dbo.dimstudents
Drop Column numberOfCreditsObtained;
Alter Table dbo.dimstudents
Alter Column firstName varchar(100);
Alter Table dbo.dimStudents
Alter Column lastName varchar(100);
Alter Table dbo.dimstudents
Alter Column nationality varchar(100);
Alter Table dbo.dimStudents
Alter Column email varchar(100);
Alter Table dbo.dimStudents
Alter Column livingOnCampus varchar(100);






IF OBJECT_ID('dimStudents') IS NOT NULL
    PRINT '<<< CREATED TABLE dimStudents >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dimStudents >>>'
go

/* 
 * TABLE: factStudentEnrollment 
 */

CREATE TABLE factStudentEnrollment(
    sutdentEnrollmentSK    int            NOT NULL,
    studentNUID            int            NOT NULL,
    CRN                    int            NOT NULL,
    departmentSK           int            NOT NULL,
    professorNUID          int            NOT NULL,
    calendarSK             int            NOT NULL,
    dropDate               date           NULL,
    grades                 varchar(10)    NOT NULL,
    CONSTRAINT PK34 PRIMARY KEY NONCLUSTERED (sutdentEnrollmentSK)
)

go


IF OBJECT_ID('factStudentEnrollment') IS NOT NULL
    PRINT '<<< CREATED TABLE factStudentEnrollment >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE factStudentEnrollment >>>'
go

/* 
 * TABLE: dimAvailableCourses 
 */

ALTER TABLE dimAvailableCourses ADD CONSTRAINT RefdimSemester5 
    FOREIGN KEY (semesterSK)
    REFERENCES dimSemester(semesterSK)
go

ALTER TABLE dimAvailableCourses ADD CONSTRAINT RefdimDepartments7 
    FOREIGN KEY (departmentSK)
    REFERENCES dimDepartments(departmentSK)
go

ALTER TABLE dimAvailableCourses ADD CONSTRAINT RefdimProfessors8 
    FOREIGN KEY (professorNUID)
    REFERENCES dimProfessors(professorNUID)
go

ALTER TABLE dimAvailableCourses ADD CONSTRAINT RefdimCourseOffering13 
    FOREIGN KEY (CRN)
    REFERENCES dimCourseOffering(CRN)
go


/* 
 * TABLE: dimCourse 
 */

ALTER TABLE dimCourse ADD CONSTRAINT RefdimDepartments21 
    FOREIGN KEY (departmentSK)
    REFERENCES dimDepartments(departmentSK)
go


/* 
 * TABLE: dimCourseOffering 
 */

ALTER TABLE dimCourseOffering ADD CONSTRAINT RefdimGeographys6 
    FOREIGN KEY (geagraphySK)
    REFERENCES dimGeographys(geagraphySK)
go

ALTER TABLE dimCourseOffering ADD CONSTRAINT RefdimCourse9 
    FOREIGN KEY (courseNumber)
    REFERENCES dimCourse(courseNumber)
go

ALTER TABLE dimCourseOffering ADD CONSTRAINT RefdimSemester10 
    FOREIGN KEY (semesterSK)
    REFERENCES dimSemester(semesterSK)
go

ALTER TABLE dimCourseOffering ADD CONSTRAINT RefdimDepartments11 
    FOREIGN KEY (departmentSK)
    REFERENCES dimDepartments(departmentSK)
go

ALTER TABLE dimCourseOffering ADD CONSTRAINT RefdimProfessors12 
    FOREIGN KEY (professorNUID)
    REFERENCES dimProfessors(professorNUID)
go


/* 
 * TABLE: dimProfessors 
 */

ALTER TABLE dimProfessors ADD CONSTRAINT RefdimProfessorHometownOutrigger16 
    FOREIGN KEY (hometownProfessorSK)
    REFERENCES dimProfessorHometownOutrigger(hometownProfessorSK)
go

ALTER TABLE dimProfessors ADD CONSTRAINT RefdimGeographys19 
    FOREIGN KEY (geagraphySK)
    REFERENCES dimGeographys(geagraphySK)
go


/* 
 * TABLE: dimStudents 
 */

ALTER TABLE dimStudents ADD CONSTRAINT RefdimCalendar4 
    FOREIGN KEY (calendarSK)
    REFERENCES dimCalendar(calendarSK)
go

ALTER TABLE dimStudents ADD CONSTRAINT RefdimStudentHometownOutrigger15 
    FOREIGN KEY (hometownStudentSK)
    REFERENCES dimStudentHometownOutrigger(hometownStudentSK)
go

ALTER TABLE dimStudents ADD CONSTRAINT RefdimGeographys1 
    FOREIGN KEY (geagraphySK)
    REFERENCES dimGeographys(geagraphySK)
go


/* 
 * TABLE: factStudentEnrollment 
 */

ALTER TABLE factStudentEnrollment ADD CONSTRAINT RefdimProfessors2 
    FOREIGN KEY (professorNUID)
    REFERENCES dimProfessors(professorNUID)
go

ALTER TABLE factStudentEnrollment ADD CONSTRAINT RefdimDepartments3 
    FOREIGN KEY (departmentSK)
    REFERENCES dimDepartments(departmentSK)
go

ALTER TABLE factStudentEnrollment ADD CONSTRAINT RefdimCourseOffering14 
    FOREIGN KEY (CRN)
    REFERENCES dimCourseOffering(CRN)
go

ALTER TABLE factStudentEnrollment ADD CONSTRAINT RefdimStudents17 
    FOREIGN KEY (studentNUID)
    REFERENCES dimStudents(studentNUID)
go

ALTER TABLE factStudentEnrollment ADD CONSTRAINT RefdimCalendar18 
    FOREIGN KEY (calendarSK)
    REFERENCES dimCalendar(calendarSK)
go


