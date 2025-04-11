USE uk_sanctions_data;

SELECT * FROM sanctioned_individuals;

-- Checking for duplicate values in the name column -- 
SELECT name_0, name_1, name_2, name_3, name_4, name_5, COUNT(*) 
FROM sanctioned_individuals
GROUP BY name_0, name_1, name_2, name_3, name_4, name_5
HAVING COUNT(*) > 1;

-- Specifically checking 'ABDALLAH Mohamed Adam Brema' to see if the records are actually the same--
SELECT * FROM sanctioned_individuals
WHERE name_0 = 'ABDALLAH' 
AND name_1 = 'Mohamed' 
AND name_2 = 'Adam' 
AND name_3 = 'Brema';

-- Checking all records to see consistency across data --
SELECT * FROM sanctioned_individuals;
-- Data formatting looks consistent -- 