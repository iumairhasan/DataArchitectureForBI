-- Big Query 2021-09-23 workshop
-- rick sherman

SELECT
	`date`,
	county,
	state_name,
	county_fips_code,
	confirmed_cases,
	deaths
FROM    `bigquery-public-data`.covid19_nyt.us_counties
;

SELECT
	`date`,
	state_name,
	state_fips_code,
	confirmed_cases,
	deaths
FROM   `bigquery-public-data`.covid19_nyt.us_states
;

SELECT
	geo_id,
	region_code,
	division_code,
	state_fips_code,
	state_gnis_code,
	state,
	state_name,
	lsad_code,
	mtfcc_feature_class_code,
	functional_status,
	area_land_meters,
	area_water_meters,
	int_point_lat,
	int_point_lon,
	int_point_geom,
	state_geom
FROM
	`bigquery-public-data`.geo_us_boundaries.states;

SELECT
	geo_id,
	state_fips_code,
	county_fips_code,
	county_gnis_code,
	county_name,
	lsad_name,
	lsad_code,
	fips_class_code,
	mtfcc_feature_class_code,
	csa_fips_code,
	cbsa_fips_code,
	met_div_fips_code,
	functional_status,
	area_land_meters,
	area_water_meters,
	int_point_lat,
	int_point_lon,
	int_point_geom,
	county_geom
FROM
	`bigquery-public-data`.geo_us_boundaries.counties;

---  -----------------------------------------------------------------------------------------------------

-- `CREATE `trillium_folder`.covid_nyt_us_states

CREATE TABLE  `paris_folder`.covid_nyt_us_states (
                  recordID INT64,
	`date` DATE,
	state_name STRING(255),
	state_fips_code STRING(255),
	confirmed_cases INT64,
	deaths INT64,
                  DI_CreateDate datetime
);

-- create `trillium_folder`.covid_nyt_us_counties 

CREATE TABLE  `paris_folder`.covid_nyt_us_counties (
                  recordID INT64,
	`date` DATE,
	county STRING(255),
	state_name STRING(255),
	county_fips_code STRING(255),
	confirmed_cases INT64,
	deaths INT64,
                  DI_CreateDate datetime
);

-- `bigquery-public-data`.geo_us_boundaries.states definition

CREATE TABLE  `paris_folder`.dim_states (
                  recordID INT64,
	geo_id STRING(255),
	region_code STRING(255),
	division_code STRING(255),
	state_fips_code STRING(255),
	state_gnis_code STRING(255),
	state STRING(255),
	state_name STRING(255),
	lsad_code STRING(255),
	mtfcc_feature_class_code STRING(255),
	functional_status STRING(255),
	area_land_meters INT64,
	area_water_meters INT64,
	--  int_point_lat FLOAT64,
	-- int_point_lon FLOAT64,
	-- int_point_geom GEOGRAPHY(255),
	-- state_geom GEOGRAPHY(255),
                  DI_CreateDate datetime
);

-- CREATE TABLE  `trillium_folder`.counties

CREATE TABLE  `paris_folder`.dim_counties (
                  recordID INT64,
	geo_id STRING(255),
	state_fips_code STRING(255),
	county_fips_code STRING(255),
	county_gnis_code STRING(255),
	county_name STRING(255),
	lsad_name STRING(255),
	lsad_code STRING(255),
	fips_class_code STRING(255),
	mtfcc_feature_class_code STRING(255),
	csa_fips_code STRING(255),
	cbsa_fips_code STRING(255),
	met_div_fips_code STRING(255),
	functional_status STRING(255),
	area_land_meters INT64,
	area_water_meters INT64,
	-- int_point_lat FLOAT64,
	-- int_point_lon FLOAT64,
	-- int_point_geom GEOGRAPHY(255),
	-- county_geom GEOGRAPHY(255),
                  DI_CreateDate datetime
);

-- `CREATE `trillium_folder`.covid_nyt_us_states

CREATE TABLE  `paris_folder`.covid_nyt_us_states_bi (
                  recordID INT64,
	`date` DATE,
	state_name STRING(255),
	state_fips_code STRING(255),
	confirmed_cases INT64,
	deaths INT64,
	geo_id STRING(255),
	region_code STRING(255),
	division_code STRING(255),
	state_gnis_code STRING(255),
	state STRING(255),
	lsad_code STRING(255),
	mtfcc_feature_class_code STRING(255),
	functional_status STRING(255),
	area_land_meters INT64,
	area_water_meters INT64,
                  DI_CreateDate datetime
);