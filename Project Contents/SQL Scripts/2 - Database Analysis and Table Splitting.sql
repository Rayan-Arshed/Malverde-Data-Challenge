USE uk_sanctions_data;

-- Quick check of data, used at multiple stages to analyse results --
SELECT * FROM uk_sanctions_data
LIMIT 10;

SELECT COUNT(*) FROM uk_sanctions_data;

-- Looking at the non-latin script rows --
SELECT DISTINCT name_non_latin_script, non_latin_script_type, non_latin_script_language FROM uk_sanctions_data
WHERE name_non_latin_script IS NOT NULL;


-- Dropping non-Latin Script Rows --
ALTER TABLE uk_sanctions_data
DROP name_non_latin_script, DROP non_latin_script_language, DROP non_latin_script_type;


-- Checking value counts of each name column --
SELECT COUNT(DISTINCT name_0), 
	COUNT(DISTINCT name_1),
    COUNT(DISTINCT name_2),
    COUNT(DISTINCT name_3),
    COUNT(DISTINCT name_4),
    COUNT(DISTINCT name_5)
FROM uk_sanctions_data;


-- Looking into distribution of groups --
SELECT COUNT(name_0), group_type FROM uk_sanctions_data
GROUP BY group_type;


-- Analysing name distribution across groups --
SELECT group_type,
	COUNT(DISTINCT name_0), 
	COUNT(DISTINCT name_1),
    COUNT(DISTINCT name_2),
    COUNT(DISTINCT name_3),
    COUNT(DISTINCT name_4),
    COUNT(DISTINCT name_5)
FROM uk_sanctions_data
GROUP BY group_type;


-- Analysing unique identifiers across non-individuals --
SELECT COUNT(DISTINCT passport_number), 
	COUNT(DISTINCT date_of_birth), 
    COUNT(DISTINCT town_of_birth),
    COUNT(DISTINCT national_identification_number)
FROM uk_sanctions_data
WHERE group_type != 'Individual';


-- Creating new tables that better represent the data --
-- Individuals--
CREATE TABLE sanctioned_individuals AS 
SELECT target_id, name_0, name_1, name_2, name_3, name_4, name_5, title, date_of_birth, 
	town_of_birth, country_of_birth, nationality, passport_number, passport_details, 
    national_identification_number, national_identification_details, position, address_1,
    address_2, address_3, address_4, address_5, address_6, post_zip_code, country, other_information, 
    alias_type, alias_quality, regime, listed_on, uk_sanctions_list_date_designated, last_updated, group_id
FROM uk_sanctions_data
WHERE group_type = 'Individual';


-- Checking all Entities first to determine what columns to keep --
SELECT * FROM uk_sanctions_data WHERE group_type = 'Entity';


-- Entity --
CREATE TABLE sanctioned_entities AS 
SELECT target_id, name_0, address_1, address_2, address_3, address_4, 
	address_5, address_6, post_zip_code, country, other_information, 
    alias_type, alias_quality, regime, listed_on, uk_sanctions_list_date_designated, 
    last_updated, group_id
FROM uk_sanctions_data
WHERE group_type = 'Entity';


-- Same procedure with Ships--
SELECT * FROM uk_sanctions_data WHERE group_type = 'Ship';


-- Ships --
CREATE TABLE sanctioned_ships AS 
SELECT target_id, name_0, post_zip_code, other_information, 
    alias_type, alias_quality, regime, listed_on, uk_sanctions_list_date_designated, 
    last_updated, group_id
FROM uk_sanctions_data
WHERE group_type = 'Ship';


-- Checking all Results --
SELECT * FROM sanctioned_individuals
LIMIT 10;

SELECT * FROM sanctioned_entities
LIMIT 10;

SELECT * FROM sanctioned_ships
LIMIT 10;