-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Janhavi B
-- USN: 1RUAN24BCA0037 
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command

-- 'root@localhost', 'RVU-PC-007', '8.4.6', '2025-09-01 10:19:05'

create database BCALab003;
use BCALab003;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 
-- Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(25) NOT NULL,
    Author VARCHAR(25) NOT NULL,
    PublishedYear INT,
    CopiesAvailable INT, 
    TotalCopies INT
);
-- Create Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    MembershipType VARCHAR(10),
    JoinDate VARCHAR(20)
);
-- Paste the Output below for the given command ( DESC TableName;) 
desc Books;
/*'BookID', 'int', 'NO', 'PRI', NULL, ''
'Title', 'varchar(25)', 'NO', '', NULL, ''
'Author', 'varchar(25)', 'NO', '', NULL, ''
'PublishedYear', 'int', 'YES', '', NULL, ''
'CopiesAvailable', 'int', 'YES', '', NULL, ''
'TotalCopies', 'int', 'YES', '', NULL, ''
*/
desc Members;
/*'MemberID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(10)', 'YES', '', NULL, ''
'LastName', 'varchar(10)', 'YES', '', NULL, ''
'MembershipType', 'varchar(10)', 'YES', '', NULL, ''
'JoinDate', 'varchar(20)', 'YES', '', NULL, ''*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
insert into Books values 
(1, '1984_The Black Swan', 'George Orwell', 1949, 04, 10),
(2, '1985_The white Swan','George',1950, 05, 10),
(3, '1985_The brown Swan','Orwell',1951,  10, 20),
(4, '1985_The red Swan','George',1952, 20, 20),
(5, '1985_The pink Swan','Orwell',1953, 20 ,30);

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * from Books;
/*'1', '1984_The Black Swan', 'George Orwell', '1949', '4', '10'
'2', '1985_The white Swan', 'George', '1950', '5', '10'
'3', '1985_The brown Swan', 'Orwell', '1951', '10', '20'
'4', '1985_The red Swan', 'George', '1952', '20', '20'
'5', '1985_The pink Swan', 'Orwell', '1953', '20', '30'*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

insert into Members values 
(1, 'David', 'Lee','Platinum', 'joined 2024-04-15'),
(2, 'Emma', 'Wilson','Silver', 'joined 2024-05-22');
SELECT * from Members;
-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*'1', 'David', 'Lee', 'Platinum', 'joined 2024-04-15'
'2', 'Emma', 'Wilson', 'Silver', 'joined 2024-05-22'*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
ALTER TABLE Books 
ADD loc VARCHAR(50);

UPDATE Books SET loc='BANGALORE'





-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 