-- Creating and initialising database --
CREATE DATABASE IF NOT EXISTS uk_sanctions_data;
USE uk_sanctions_data;

-- Initialiising table in preparation for import via Import Wizard --
CREATE TABLE IF NOT EXISTS uk_sanctions_data(
	name_0 varchar(255),
	name_1 varchar(255), 
	name_2 varchar(255), 
	name_3 varchar(255),
	name_4 varchar(255),
	name_5 varchar(255),
	title varchar(255),
	name_non_latin_script varchar(255),
	non_latin_script_type varchar(255),
	non_latin_script_language varchar(255),
	date_of_birth date,
	town_of_birth text,
	country_of_birth varchar(255),
	nationality varchar(255),
	passport_number varchar(255),
	passport_details text,
	national_identification_number varchar(255),
	national_identification_details varchar(255),
	position text,
	address_1 varchar(255),
	address_2 varchar(255),
	address_3 varchar(255),
	address_4 varchar(255),
	address_5 varchar(255),
	address_6 varchar(255),
	post_zip_code varchar(255),
	country varchar(255),
	other_information text,
	group_type varchar(255),
	alias_type varchar(255),
	alias_quality varchar(255),
	regime varchar(255),
	listed_on date,
	uk_sanctions_list_date_designated date,
	last_updated date,
	group_id INT,
    target_id INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (target_id)
);

-- Quick check of data after having imported via table wizard --
SELECT * FROM uk_sanctions_data
LIMIT 10;