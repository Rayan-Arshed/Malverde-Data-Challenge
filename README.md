# Malverde-Data-Challenge
 My work on the Malverde Data Challenge, done in Python & SQL

## Process
A full write-up of thought process, code used, and approaches is included in the Word doc alongside the project files.

A step-by-step process of running the scripts and code will be included below:

## Tools and Dependencies Used:
Jupyter Labs - For initial data transformations (Any Python Notebook service will work, just need Pandas as a library!)

MySQL Workbench and Server - For storing, running, and analysing the data

## Step 1 - Initial Data Cleansing
Download the dataset from: https://www.gov.uk/government/publications/financial-sanctions-consolidated-list-of-targets/consolidated-list-of-targets

Open a Python Notebook environment, and load up Project Contents/Python Files/Data Cleansing.ipynb

This script will walk you through the process of converting the source data to UTF-8, as well as standardising dates for MySQL Workbench Table Import Wizard to accept.

Place Raw Data into the Raw Data folder, and tweak the name of the file in Python if required:
![image](https://github.com/user-attachments/assets/b7875a8e-16c2-450e-9195-9658fff1aa98)

The code is already broken down into sections, feel free to run one cell at a time, or the whole file. This script will:
1. Read the data file and the hard-coded columns to clean and standardize.

2. Loop through the Text data and turn all data to alpha-numeric.

3. Loop through Date data and convert the data to YYYY-MM-DD format. If the data is invalid, but contains the years (EG 00/00/1990), it will convert that date to 1990/01/01.

4. Export the data into the Cleansed Data folder to be used for the next stage.

## Step 2 - Import Into MySQL Workbench
Open MySQL Workbench and open the SQL Script '1 - Database Initialization' included in the project under the SQL Scripts folder

This script will:
1. Create and use a new database for this project titled uk_sanctions_data
2. Create a table with the appropriate data types for each column

Before progressing, you will have to **manually** import data into the database using the MySQL Database Wizard. To do this:
1. Right Click the created table after refreshing the list -> Table Data Import Wizard
   
   ![image](https://github.com/user-attachments/assets/1649261a-2735-45ce-97ae-4f2d8c6f5a03)
   
2. Select the file in the cleansed data folder -> Use Existing Table -> Check Data Column Mapping (Name 6 in the CSV corresponds to Name 0 in the Table for easier understanding)
   
   ![image](https://github.com/user-attachments/assets/306db60b-14e8-4c76-a73c-1ae9303e8b91)

3. Import Data and wait for it to finish (should take about 5 minutes!)

4. Once complete, run the SQL command at the bottom of the file to check the data imported correctly, your result should look something like so:

   ![image](https://github.com/user-attachments/assets/1dcf267a-ea4d-4f8d-8370-3c7ef0197e96)

## Step 3 - Analysis and Splitting of Data
This section requires no user input, except loading the script titled '2 - Database Analysis and Table Splitting'. I document in my Word doc the process of understanding the data, and how I came to the conclusion of splitting the data into 3 tables on the Group Type column. Feel free to read my thought process and code, or execute the file as a whole. The result of this file, after refreshing the side schemas pane, should result in the creation of 3 new tables, one for each Group Type:

![image](https://github.com/user-attachments/assets/df67b2a9-afc4-47ef-aa1d-aed24f22e2bb)


## Step 4 - Analysis of Individuals Table
This section also requires no user input to execute. Feel free to read my analysis of the data in my doc, and my code, and run the script '3 - Individual Analysis', which will analyse the data, and provide statistics that I looked at, and queries to check for duplicates and data consistency.

## Step 5 - Export Individual Data
This step will require some user input. Open the script '4 - Individual Data Export', and run the first query. This will show your computer-specific folder where MySQL will have permissions to export data to. This will be used in the next query to export the Individual table as a CSV to that folder. Copy the path provided, and paste it in the 'INTO OUTFILE' line in the next query, and ensure the backslashes are changed to forward slashes -> "/" like so:

![image](https://github.com/user-attachments/assets/c7c21651-47b2-4ff2-bfc2-62b90b981609)

![image](https://github.com/user-attachments/assets/4994c77b-4621-46ac-be1a-cc7f992b6a0b)

This query will add column headings, and then export the contents of the table to that directory, which you can then move to this projects' Final Data folder for ease of access. This data can then be imported into any systems that support CSV files for data analysis, cleansing, or usage, such as creating a Watchlist of the UK sanctioned individuals. 
