-- NYC.dbo.stg_parking_violations definition

-- Drop table

DROP TABLE if exists stg_parking_violations;

CREATE TABLE stg_parking_violations (
	stg_parking_violations_SK bigint NOT NULL IDENTITY(1,1),
	Summons_Number bigint NOT NULL,
	Plate_ID varchar(80) NULL,
	Registration_State varchar(80) NULL,
	Plate_Type varchar(80) NULL,
	Issue_Date datetime NULL,
	Violation_Code int NULL,
	Vehicle_Body_Type varchar(80) NULL,
	Vehicle_Make varchar(80) NULL,
	Issuing_Agency varchar(80) NULL,
	Street_Code1 int NULL,
	Street_Code2 int NULL,
	Street_Code3 int NULL,
	Vehicle_Expiration_Date int NULL,
	Violation_Location varchar(255) NULL,
	Violation_Precinct int NULL,
	Issuer_Precinct int NULL,
	Issuer_Code int NULL,
	Issuer_Command varchar(255) NULL,
	Issuer_Squad varchar(255) NULL,
	Violation_Time varchar(80) NULL,
	Time_First_Observed varchar(80) NULL,
	Violation_County varchar(255) NULL,
	Violation_In_Front_Of_Or_Opposite varchar(80) NULL,
	House_Number varchar(80) NULL,
	Street_Name varchar(255) NULL,
	Intersecting_Street varchar(255) NULL,
	Date_First_Observed int NULL,
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
	
	DI_SourceYear int NULL,
	DI_SOR_FILE varchar(255) NULL,
	DI_SOR_PATH varchar(255) NULL,
	DI_SOR_NUMBER int NULL,
	
	DI_PID varchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT GETDATE() ,
	
	-- PRIMARY KEY (Summons_Number)
	
	PRIMARY KEY (stg_parking_violations_SK)
);


-- NYC.dbo.stg_parking_violations_StructureInvalid definition

-- Drop table

-- DROP TABLE stg_parking_violations_StructureInvalid;

CREATE TABLE stg_parking_violations_REJECTS_Structure (
	DI_REJECT_SK bigint NOT NULL IDENTITY(1,1),
	Summons_Number bigint NOT NULL,
	
	errorCode varchar(255) NULL,
	errorMessage varchar(255) NULL,
	
	DI_Reject_Reason varchar(255) NULL DEFAULT 'ERROR: File Structure (see errorMessage)',
		
	DI_SourceYear int NULL,
	DI_SOR_FILE varchar(255) NULL,  -- DI_SOR varchar(255) NULL,
	DI_SOR_PATH varchar(255) NULL,
	DI_SOR_NUMBER int NULL,     -- DI_SOR_NB_LINE int NULL,

	DI_PID varchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT GETDATE() ,
	PRIMARY KEY (DI_REJECT_SK)
);
	

-- NYC.dbo.stg_parking_violations_rejects definition

-- Drop table

-- DROP TABLE stg_parking_violations_rejects;

CREATE TABLE stg_parking_violations_REJECTS_all (
	DI_REJECT_SK bigint NOT NULL IDENTITY(1,1),
	
	Summons_Number bigint NOT NULL,
	Plate_ID varchar(80) NULL,
	Registration_State varchar(80) NULL,
	Plate_Type varchar(80) NULL,
	Issue_Date datetime NULL,
	Issue_Date_char varchar(80) NULL,
	Violation_Code int NULL,
	Vehicle_Body_Type varchar(80) NULL,
	Vehicle_Make varchar(80) NULL,
	Issuing_Agency varchar(80) NULL,
	Street_Code1 int NULL,
	Street_Code2 int NULL,
	Street_Code3 int NULL,
	Vehicle_Expiration_Date int NULL,
	Vehicle_Expiration_Date_char varchar(80) NULL,
	Violation_Location varchar(255) NULL,
	Violation_Precinct int NULL,
	Issuer_Precinct int NULL,
	Issuer_Code int NULL,
	Issuer_Command varchar(255) NULL,
	Issuer_Squad varchar(255) NULL,
	Violation_Time varchar(80) NULL,
	Time_First_Observed varchar(80) NULL,
	Violation_County varchar(255) NULL,
	Violation_In_Front_Of_Or_Opposite varchar(80) NULL,
	House_Number varchar(80) NULL,
	Street_Name varchar(255) NULL,
	Intersecting_Street varchar(255) NULL,
	Date_First_Observed int NULL,
	Date_First_Observed_char varchar(80) NULL,
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
	
	DI_Reject_Reason varchar(255) NULL,
	
	DI_SourceYear int NULL,
	DI_SOR_FILE varchar(255) NULL,  -- DI_SOR varchar(255) NULL,
	DI_SOR_PATH varchar(255) NULL,
	DI_SOR_NUMBER int NULL,     -- DI_SOR_NB_LINE int NULL,

	DI_PID varchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT GETDATE() ,
	PRIMARY KEY (DI_REJECT_SK)
);
