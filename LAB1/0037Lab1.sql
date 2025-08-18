-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: JANHAVI B
-- USN: 1RUA24BCA0037
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 'root@localhost', 'RVU-PC-007', '8.4.6', '2025-08-18 11:37:17'


-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

 create database BCALab001;
 use BCALab001;
 
-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:

create table student 
(StudentID varchar(10) Primary Key,
FirstName varchar(15),
LastName varchar(10),
Email varchar(15) unique,
DOB date
);

DESC student; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(15)', 'YES', '', NULL, ''
'LastName', 'varchar(10)', 'YES', '', NULL, ''
'Email', 'varchar(15)', 'YES', 'UNI', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''*/

-- Alter the table and 2 new columns
alter table student add(gender varchar(2),age int);
desc student;

-- Modify a column data type
alter table student modify Lastname varchar(15);
desc student;

-- Rename a column
alter table student rename column Lastname to Surname;
desc student;
-- Drop a column
alter table student drop Email;
-- Rename the table
alter table student rename to StudentDetails;



-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits
 
-- Write your SQL query below Codespace:

create table course
(CourseID varchar(15) Primary Key,
CourseName varchar(15),
Credits int
);

DESC Course; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
/*'CourseID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(15)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''*/

-- Alter the table and 2 new columns
alter table course add (FACULTY VARCHAR(10),BRANCH VARCHAR(10));
-- Modify a column data type
alter table course modify FACULTY varchar(20); 
-- Rename a column
alter table course rename column FACULTY to Faculty;
-- Drop a column
alter table course drop Faculty;
-- Rename the table
alter table course rename to COURSE;
desc COURSE; 


-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table Enrollments
(EmailID varchar(10) Primary Key,
StudentID varchar(10),
CourseID varchar(15),
foreign key (StudentID) references student(StudentID),
foreign key (CourseID) references COURSE(CourseID),
EnrollmentDate date
);


DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :

-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:

DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
