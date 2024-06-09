-- SQL Query to create and import data from csv files:

-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);


-- 2. Create cc_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


-- 3. Copy csv data into SQL (remember to update the file name and file location in below query)

-- copy cc_detail table

COPY cc_detail
FROM 'S:\1.Study Folder\DATA Analyst\Practice Data\Power BI - Credit Card Customer Report\credit_card.csv' 
DELIMITER ',' 
CSV HEADER;

-- to view the table
SELECT * FROM cc_detail;

-- copy cust_detail table

COPY cust_detail
FROM 'S:\1.Study Folder\DATA Analyst\Practice Data\Power BI - Credit Card Customer Report\customer.csv' 
DELIMITER ',' 
CSV HEADER;

-- to view the table
SELECT * FROM cust_detail;

-- If you are getting below error, then use the below point:  
   -- ERROR:  date/time field value out of range: "0"
   -- HINT:  Perhaps you need a different "datestyle" setting.

-- Check the Data in Your CSV File: Ensure date column values are formatted correctly and are in a valid format that PostgreSQL can recognize (e.g., YYYY-MM-DD). And correct any incorrect or missing date values in the CSV file. 
   -- or
-- Update the Datestyle Setting: Set the datestyle explicitly for your session using the following command:
SET datestyle TO 'ISO, DMY';

-- Now, try to COPY the csv files!


-- 4. Insert additional data into SQL, using same COPY function

-- copy additional data (week-53) in cc_detail table

COPY cc_detail
FROM 'S:\1.Study Folder\DATA Analyst\Practice Data\Power BI - Credit Card Customer Report\cc_add.csv' 
DELIMITER ',' 
CSV HEADER;


-- copy additional data (week-53) in cust_detail table (remember to update the file name and file location in below query)

COPY cust_detail
FROM 'S:\1.Study Folder\DATA Analyst\Practice Data\Power BI - Credit Card Customer Report\cust_add.csv' 
DELIMITER ',' 
CSV HEADER;

-- creating another table for State_code
CREATE TABLE State_Details (
    State_Code VARCHAR(255),
    State_Name VARCHAR(255)
);
-- copy the state details table

COPY State_Details (State_Code, State_Name)
FROM 'S:\1.Study Folder\DATA Analyst\Practice Data\Power BI - Credit Card Customer Report\State_details.csv'
DELIMITER ',' 
CSV HEADER;

-- to view the table
SELECT * FROM State_Details;