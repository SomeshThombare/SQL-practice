-- 11/03/2026/Tue

-- Database Import and Export/

-- 1] IMPORT
-- 1)impot the data usign CLI  
-- step 1: create one database then imprort database in that --> ECOM --> IS DTAABSES NAME
-- step 2:   mysql -u root -p ecom < "C:\Users\somes\ecommercedump.sql"

-- 2) IMPORT THE DATA USING GUI
-- step 1: open server --> click on Import Data 
-- step 2: click self contain file option --> select file path (whre is your path )
-- step 3: crete oen databse --> select that one --> select structure and data
-- step 4: click one import

-- 2] ExPORT

-- 1) export the database usig CLI
-- step 1: mysqldump -u root -p joins > joinsdupm.sql
-- write the above query and database name and use '>' symbol and exportfile(dumpfile) name
-- step 2: open the path for findindg the file  'C:\Users\somes\filename.sql'

-- 2) export the database usign GUI
-- step 1:  open server --> click on Export Data
-- step 2: select database name
-- step 3: select self containt-file 
-- step 4 : give the path with filename
-- step 5:click on the checkbox on:--> create teh single self contain file
-- step 6: click on export data 
-- step 6: check teh file on given file path with filename

-- 3) export the multiple databse  usign CLI


  