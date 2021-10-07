use graduateStudentModel;
Create View coreRequirements as 
Select dep.departmentName, dep.programName, dc.courseName, dc.courseNumber, dc.lectureMode, dc.numberOfCredits, dc.isCore
From dimDepartments dep
Join dimCourse dc
on dep.departmentSk = dc.departmentSK
Where dc.isCore = 'Yes';

Select dep.departmentName, dep.programName, dc.courseName, dc.courseNumber, dc.lectureMode, dc.numberOfCredits, dc.isCore
From dimDepartments dep
Join dimCourse dc
on dep.departmentSk = dc.departmentSK
Where dc.isCore = 'No';

CREATE VIEW studentCourseDetailSemWise AS
Select fse.studentNUID, ds.firstName, ds.lastName, dsem.semesterName, dc.courseName, dc.courseNumber, fse.grades, fse.dropDate
From factStudentEnrollment fse
Join dimStudents ds
On fse.StudentNUID = ds.studentNUID
Join dimCourseOffering dco
On fse.CRN = dco.CRN
Join dimCourse dc
On dco.courseNumber = dc.courseNumber
Join dimSemester dsem
On dco.semesterSK = dsem.semesterSK;

Create View studentEnrollmentDropDates as
Select ds.firstName, ds.lastName, ds.studentNUID, dc.courseName, dc.courseNumber ,dcal.date as "EnrollmentDate", fse.dropDate as "DropDate"
From factStudentEnrollment fse
Join dimCalendar dcal
On fse.calendarSK = dcal.calendarSK
Join dimStudents ds
On fse.studentNUID = ds.studentNUID
Join dimCourseOffering dco
On fse.CRN = dco.CRN
Join dimCourse dc
On dco.courseNumber = dc.courseNumber;

Create View teachersEnrolledCourses as
Select t.CRN, dp.professorNUID, dp.firstName, dp.lastName, t.semesterName, t.courseNumber, t.courseName
From (Select dco.professorNUID, dsem.semesterName, dc.courseNumber, dc.courseName, dco.CRN
From factStudentEnrollment fse
Join dimCalendar dcal
On fse.calendarSK = dcal.calendarSK
Join dimStudents ds
On fse.studentNUID = ds.studentNUID
Join dimCourseOffering dco
On fse.CRN = dco.CRN
Join dimCourse dc
On dco.courseNumber = dc.courseNumber
Join dimSemester dsem
On dco.semesterSK = dsem.semesterSK)
as t
Join dimProfessors dp
On t.professorNUID = dp.professorNUID;

Create View classesTaughtSemester as
Select dco.CRN, dc.courseNumber, dc.courseName, dsem.semesterName
From dimCourseOffering dco
Join dimCourse dc
On dco.courseNumber = dc.courseNumber
Join dimSemester dsem
On dco.semesterSK = dsem.semesterSK
Where dco.currentlyAvailable = 'Yes';

Create View studentDetails as 
Select dep.departmentName, dep.programName, ds.studentNUID, ds.firstName, ds.lastName, ds.email, 
		ds.dateOfBirth, dho.city as "HomeTown", dho.state as "HomeState", dho.country as "HomeCountry", 
		dg.homeAddress, dg.city, dg.state, dg.country, dg.zipcode
From factStudentEnrollment fse
Join dimStudents ds
On fse.studentNUID = ds.studentNUID
Join dimStudentHometownOutrigger dho
On ds.hometownStudentSK = dho.hometownStudentSK
Join dimDepartments dep
On fse.departmentSK = dep.departmentSK
Join dimGeographys dg
On ds.geagraphySK = dg.geagraphySK

Create View teachersInASemester as
Select dp.professorNUID, dp.firstName, dp.lastName, dep.programName, dc.courseNumber, dc.CourseName
From dimCourseOffering dco
Join dimProfessors dp
On dco.professorNUID = dp.professorNUID
Join dimDepartments dep
On dep.departmentSK = dco.departmentSK
Join dimCourse dc
On dco.courseNumber = dc.courseNumber
Where dco.currentlyAvailable = 'Yes'

Create View professorGeography as 
Select dp.professorNUID, dp.firstName, dp.lastName, dg.city, dg.state, dg.country, dg.zipcode
From dimProfessors dp
Join dimGeographys dg
On dp.geagraphySK = dg.geagraphySK
