-- Finding directory where I can export data --
SHOW VARIABLES LIKE "secure_file_priv";
-- Copy the path variable but change the backslashes to forward slashes in the next part --


-- Exporting the Data --
-- First SELECT is for column name definitions, then it adds the rest of the data underneath-- 
SELECT 'target_id','name_0', 'name_1', 'name_2', 'name_3', 'name_4',
'name_5', 'title', 'date_of_birth', 'town_of_birth', 'country_of_birth',
'nationality', 'passport_number', 'passport_details', 'national_identification_number',
'national_identification_details', 'position', 'address_1', 'address_2', 'address_3',
'address_4', 'address_5', 'address_6', 'post_zip_code', 'country', 'other_information', 
'alias_type', 'alias_quality', 'regime', 'listed_on', 'uk_sanctions_list_date_designated',
'last_updated','group_id'
UNION ALL
-- Adding the actual table data next --
SELECT * FROM sanctioned_individuals
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/final_data.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

