-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: JANHAVI B
-- USN: 1RUA24BCA0037
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'RVU-PC-007', '8.4.6', '2025-08-25 11:21:43'

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:

create database BCALab002;
use BCALab002;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating

-- Write your SQL query below Codespace:

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(20),
    HOD VARCHAR(20),
    ContactEmail VARCHAR(20),
    PhoneNumber VARCHAR(20),
    Location VARCHAR(20)
);

DESC Departments; 
/*'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(20)', 'YES', '', NULL, ''
'HOD', 'varchar(20)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(20)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(20)', 'YES', '', NULL, ''
'Location', 'varchar(20)', 'YES', '', NULL, ''*/

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(20),
    Credits INT,
    DepartmentID INT,
    Duration VARCHAR(50),
    Fee DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

DESC Course;
/*'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(20)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Duration', 'varchar(50)', 'YES', '', NULL, ''
'Fee', 'decimal(10,2)', 'YES', '', NULL, ''*/

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    Email VARCHAR(10),
	DateOfBirth DATE,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

DESC Student;
/*'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(10)', 'YES', '', NULL, ''
'LastName', 'varchar(10)', 'YES', '', NULL, ''
'Email', 'varchar(10)', 'YES', '', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''*/

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(20),
    DepartmentID INT,
    Qualification VARCHAR(20),
    Email VARCHAR(10),
    PhoneNumber VARCHAR(20),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

DESC Faculty;
/*'FacultyID', 'int', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(20)', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(20)', 'YES', '', NULL, ''
'Email', 'varchar(10)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(20)', 'YES', '', NULL, ''*/

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(10),
    Year INT,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

DESC Enrollments;
/*'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Semester', 'varchar(10)', 'YES', '', NULL, ''
'Year', 'int', 'YES', '', NULL, ''
'Grade', 'varchar(2)', 'YES', '', NULL, ''*/

-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
--  describe the structure of each table and copy paste the Output 


-- Perform the following operations on the each of the tables

-- 01: add 2 new columns for each table
-- 02: Modify the existing column from each table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table

-- Departments
ALTER TABLE Departments ADD COLUMN FaxNumber VARCHAR(20), ADD COLUMN EstablishedYear INT;
ALTER TABLE Departments MODIFY COLUMN PhoneNumber VARCHAR(30);
ALTER TABLE Departments MODIFY COLUMN FaxNumber VARCHAR(10);
ALTER TABLE Departments RENAME COLUMN HOD TO HeadOfDepartment;
ALTER TABLE Departments DROP COLUMN FaxNumber;
ALTER TABLE Departments RENAME TO Department;
DESC department;
/*'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(20)', 'YES', '', NULL, ''
'HeadOfDepartment', 'varchar(20)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(20)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(30)', 'YES', '', NULL, ''
'Location', 'varchar(20)', 'YES', '', NULL, ''
'EstablishedYear', 'int', 'YES', '', NULL, ''*/

-- Course
ALTER TABLE Course ADD COLUMN CourseDescription TEXT, ADD COLUMN Branch varchar(20);
ALTER TABLE Course MODIFY COLUMN Duration VARCHAR(100);
ALTER TABLE Course RENAME COLUMN Fee TO CourseFee;
ALTER TABLE Course DROP COLUMN Branch;
ALTER TABLE Course RENAME TO Courses;
DESC Courses;
/*'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(20)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Duration', 'varchar(100)', 'YES', '', NULL, ''
'CourseFee', 'decimal(10,2)', 'YES', '', NULL, ''
'CourseDescription', 'text', 'YES', '', NULL, ''*/

-- Student
ALTER TABLE Student ADD COLUMN EnrollmentDate DATE, ADD COLUMN Gender VARCHAR(10);
ALTER TABLE Student MODIFY COLUMN Email VARCHAR(150);
ALTER TABLE Student RENAME COLUMN DateOfBirth TO DOB;
ALTER TABLE Student  DROP COLUMN Gender;
ALTER TABLE Student RENAME TO Students;
DESC Students;
/*'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(10)', 'YES', '', NULL, ''
'LastName', 'varchar(10)', 'YES', '', NULL, ''
'Email', 'varchar(150)', 'YES', '', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''*/

-- Faculty
ALTER TABLE Faculty ADD COLUMN DateOfJoining DATE, ADD COLUMN ADDRESS VARCHAR(20);
ALTER TABLE Faculty MODIFY COLUMN PhoneNumber VARCHAR(30);
ALTER TABLE Faculty RENAME COLUMN FacultyName TO Name;
ALTER TABLE Faculty DROP COLUMN ADDRESS;
ALTER TABLE Faculty RENAME TO FacultyMembers;
DESC  FacultyMembers;
/*'FacultyID', 'int', 'NO', 'PRI', NULL, ''
'Name', 'varchar(20)', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(20)', 'YES', '', NULL, ''
'Email', 'varchar(10)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(30)', 'YES', '', NULL, ''
'DateOfJoining', 'date', 'YES', '', NULL, ''*/

-- Enrollments
ALTER TABLE Enrollments ADD COLUMN EnrollmentStatus VARCHAR(20), ADD COLUMN Remarks TEXT;
ALTER TABLE Enrollments MODIFY COLUMN Semester VARCHAR(15);
ALTER TABLE Enrollments RENAME COLUMN Grade TO FinalGrade;
ALTER TABLE Enrollments DROP COLUMN Remarks;
ALTER TABLE Enrollments RENAME TO StudentEnrollments;
DESC StudentEnrollments;
/*'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Semester', 'varchar(15)', 'YES', '', NULL, ''
'Year', 'int', 'YES', '', NULL, ''
'FinalGrade', 'varchar(2)', 'YES', '', NULL, ''
'EnrollmentStatus', 'varchar(20)', 'YES', '', NULL, ''*/



/*Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

ALTER TABLE Students ADD COLUMN Address VARCHAR(100);
ALTER TABLE Students ADD COLUMN Gender VARCHAR(1);
ALTER TABLE FacultyMembers ADD COLUMN JoiningDate DATE;
ALTER TABLE Courses MODIFY COLUMN CourseName VARCHAR(100);
ALTER TABLE department MODIFY COLUMN Location VARCHAR(80);
ALTER TABLE FacultyMembers RENAME COLUMN Qualification TO Degree;
ALTER TABLE FacultyMembers RENAME TO Teachers;
ALTER TABLE department DROP COLUMN PhoneNumber;
ALTER TABLE Students DROP COLUMN Email;
ALTER TABLE Courses DROP COLUMN Duration;

SHOW TABLES; -- Before dropping the table
/*'courses'
'department'
'studentenrollments'
'students'
'teachers'*/

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
DROP TABLE StudentEnrollments;
DROP TABLE  Courses;

SHOW TABLES; -- After dropping the table Enrollement and Course
/*'department'
'students'
'teachers'*/

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01
