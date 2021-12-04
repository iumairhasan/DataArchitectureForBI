

--select * from STG_open_parking_and_camera_violations

--select max(Issue_Date) from STG_open_parking_and_camera_violations

drop table if exists STG_open_parking_and_camera_violations

CREATE TABLE STG_open_parking_and_camera_violations (
	Summons_Number bigint NOT NULL,

	Plate varchar(20) NULL,
	State varchar(20) NULL,
	License_Type varchar(20) NULL,

	Issue_Date datetime NULL,
	Issue_Date_sk int NULL,

	Violation_Time varchar(20) NULL,
	Violation_Time_SK int NULL,
	Violation_Time_char varchar(20) NULL,

	Violation varchar(255) NULL,

	Judgment_Entry_Date datetime NULL,
	Judgment_Entry_Date_SK int NULL,

	Fine_Amount decimal(17,2) NULL,
	Penalty_Amount decimal(17,2) NULL,
	Interest_Amount decimal(17,2) NULL,
	Reduction_Amount decimal(17,2) NULL,
	Payment_Amount decimal(17,2) NULL,
	Amount_Due decimal(17,2) NULL,

	Precinct int NULL,
	County varchar(20) NULL,
	Issuing_Agency varchar(255) NULL,
	Violation_Status varchar(255) NULL,
	Summons_Image varchar(255) NULL,

	DI_PID varchar(20) NULL,
	DI_Create_Date datetime DEFAULT getdate() NULL,

	PRIMARY KEY (Summons_Number)
);


