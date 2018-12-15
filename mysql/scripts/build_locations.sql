# Create the database
CREATE database Locations;
USE Locations;

# create the adwords table
create table locations
(
	criteria_id bigint primary key,
    name_str varchar(100),
    canonical_name varchar(100),
    country_code char(2),
    target_type char(40),
    status_s char(35)
);

# load in the csv
LOAD DATA INFILE '/csv/locations.csv'
INTO TABLE locations
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'  
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

