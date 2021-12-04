-- NYC Open Data - Parking Project
-- Part 2 
-- Updated: 2021-11-12, 2020-11-05
-- Rick sherman
--

-- STG_open_parking_and_camera_violations definition
/*
drop table STG_open_parking_and_camera_violations;

drop table STG_open_parking_and_camera_violations_rejects;

drop table stg_parking_violations_rejects;

drop table stg_parking_violations;
*/
/*
select * from STG_open_parking_and_camera_violations;


*/

CREATE TABLE STG_open_parking_and_camera_violations (
	Summons_Number bigint NOT NULL,

	Plate varchar(20) NULL,
	State varchar(20) NULL,
	License_Type varchar(20) NULL,

	Issue_Date datetime NULL,
	Issue_Date_sk int NULL,

	Violation_Time varchar(50) NULL,
	Violation_Time_SK int NULL,
	Violation_Time_char varchar(50) NULL,

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


-- STG_open_parking_and_camera_violations_rejects 

select * from STG_open_parking_and_camera_violations_rejects

CREATE TABLE STG_open_parking_and_camera_violations_rejects (
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

	DI_Reject_Reason varchar(80) NULL,
	DI_PID varchar(20) NULL,
	DI_Create_Date datetime DEFAULT (getdate()) NULL,

	PRIMARY KEY (Summons_Number))
;

-- stg_parking_violations 


CREATE TABLE stg_parking_violations (
	Summons_Number bigint NOT NULL,

	Plate_ID varchar(80) NULL,
	Registration_State varchar(80) NULL,
	Plate_Type varchar(80) NULL,

	Issue_Date datetime NULL,
	Issue_Date_sk int NULL,

	Violation_Code int NULL,
	Vehicle_Body_Type varchar(80) NULL,
	Vehicle_Make varchar(80) NULL,

	Issuing_Agency varchar(80) NULL,

	Street_Code1 int NULL,
	Street_Code2 int NULL,
	Street_Code3 int NULL,

	Vehicle_Expiration_Date datetime NULL,
	Vehicle_Expiration_Date_SK int NULL,

	Violation_Location  varchar(255) NULL,
	Violation_Precinct int NULL,
	Issuer_Precinct int NULL,
	Issuer_Code int NULL,
	Issuer_Command varchar(255) NULL,
	Issuer_Squad varchar(255) NULL,

	Violation_Time time NULL,
	Violation_Time_SK int NULL,
	Violation_Time_char varchar(20) NULL,

	Time_First_Observed time  NULL,
	Time_First_Observed_sk int NULL,
	Time_First_Observed_char varchar(20) NULL,

	Violation_County varchar(255) NULL,
	Violation_In_Front_Of_Or_Opposite varchar(80) NULL,
	House_Number varchar(80) NULL,
	Street_Name varchar(255) NULL,
	Intersecting_Street varchar(255) NULL,

	Date_First_Observed datetime NULL,
	Date_First_Observed_SK int NULL,

	Law_Section int NULL,
	Sub_Division varchar(80) NULL,
	Violation_Legal_Code varchar(80) NULL,
	Days_Parking_In_Effect varchar(80) NULL,
	From_Hours_In_Effect varchar(80) NULL,
	To_Hours_In_Effect varchar(80) NULL,
	Vehicle_Color varchar(80) NULL,
	Unregistered_Vehicle_ int NULL,
	Vehicle_Year int NULL,
	Meter_Number varchar(80) NULL,
	Feet_From_Curb int NULL,
	Violation_Post_Code varchar(255) NULL,
	Violation_Description varchar(255) NULL,
	No_Standing_or_Stopping_Violation varchar(255) NULL,
	Hydrant_Violation varchar(255) NULL,
	Double_Parking_Violation varchar(255) NULL,

	DI_PID varchar(20) NULL,
	DI_Create_Date datetime DEFAULT (getdate()) NULL,

	PRIMARY KEY (Summons_Number)
);

-- stg_parking_violations_rejects 


CREATE TABLE stg_parking_violations_rejects (
	Summons_Number bigint NOT NULL,

	Plate_ID varchar(80) NULL,
	Registration_State varchar(80) NULL,
	Plate_Type varchar(80) NULL,

	Issue_Date datetime NULL,
	Issue_Date_sk int NULL,

	Violation_Code int NULL,
	Vehicle_Body_Type varchar(80) NULL,
	Vehicle_Make varchar(80) NULL,

	Issuing_Agency varchar(80) NULL,

	Street_Code1 int NULL,
	Street_Code2 int NULL,
	Street_Code3 int NULL,

	Vehicle_Expiration_Date datetime NULL,
	Vehicle_Expiration_Date_SK int NULL,

	Violation_Location varchar(255) NULL,
	Violation_Precinct int NULL,
	Issuer_Precinct int NULL,
	Issuer_Code int NULL,
	Issuer_Command varchar(255) NULL,
	Issuer_Squad varchar(255) NULL,

	Violation_Time time NULL,
	Violation_Time_SK int NULL,
	Violation_Time_char varchar(20) NULL,

	Time_First_Observed time  NULL,
	Time_First_Observed_sk int NULL,
	Time_First_Observed_char varchar(20) NULL,

	Violation_County varchar(255) NULL,
	Violation_In_Front_Of_Or_Opposite varchar(80) NULL,
	House_Number varchar(80) NULL,
	Street_Name varchar(255) NULL,
	Intersecting_Street varchar(255) NULL,

	Date_First_Observed datetime NULL,
	Date_First_Observed_SK int NULL,

	Law_Section int NULL,
	Sub_Division varchar(80) NULL,
	Violation_Legal_Code varchar(80) NULL,
	Days_Parking_In_Effect varchar(80) NULL,
	From_Hours_In_Effect varchar(80) NULL,
	To_Hours_In_Effect varchar(80) NULL,
	Vehicle_Color varchar(80) NULL,
	Unregistered_Vehicle_ int NULL,
	Vehicle_Year int NULL,
	Meter_Number varchar(80) NULL,
	Feet_From_Curb int NULL,
	Violation_Post_Code varchar(255) NULL,
	Violation_Description varchar(255) NULL,
	No_Standing_or_Stopping_Violation varchar(255) NULL,
	Hydrant_Violation varchar(255) NULL,
	Double_Parking_Violation varchar(255) NULL,

	DI_Reject_Reason varchar(80) NULL,

	DI_PID varchar(20) NULL,
	DI_Create_Date datetime DEFAULT (getdate()) NULL,

	PRIMARY KEY (Summons_Number)
);





