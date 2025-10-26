-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: JANHAVI B
-- USN: 1RUA24BCA0037
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
/*'root@localhost', 'DESKTOP-4V4LRAE', '8.0.43', '2025-09-08 18:45:06'*/

create database Employee;
use Employee;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 

-- 2. Insert 10 records to employee;
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  

-- 4. Insert 10 records to Orders


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
CREATE TABLE Employee (
    EmpID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Salary decimal(10,2),
    BirthDate date,
    HireDate date
);
desc Employee;
/*'EmpID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(50)', 'YES', '', NULL, ''
'LastName', 'varchar(50)', 'YES', '', NULL, ''
'Salary', 'decimal(10,2)', 'YES', '', NULL, ''
'BirthDate', 'date', 'YES', '', NULL, ''
'HireDate', 'date', 'YES', '', NULL, ''*/

insert into  Employee (EmpID, FirstName, LastName, Salary, BirthDate, HireDate) values
(1, 'Amit', 'Sharma', 45000.00, '1990-03-12', '2015-02-21'),
(2, 'Priya', 'Verma', 50000.00, '1985-07-29', '2021-07-19'),
(3, 'Rahul', 'Kumar', 60000.00, '1980-12-18', '2017-08-10'),
(4, 'Neha', 'Gowda', 55000.00, '1991-10-15', '2018-12-12'),
(5, 'Rohit', 'Shetty', 47000.00, '1995-09-30', '2019-06-08'), 
(6, 'Anita', 'Jai', 65000.00, '1987-05-07', '2014-02-05'),
(7, 'Suresh', 'Gowda', 48000.00, '1983-08-16', '2020-04-05'),
(8, 'Kiran', 'Rao', 52000.00, '1985-04-23', '2021-12-06'),
(9, 'Vikas', 'Raj', 58000.00, '1990-06-09', '2013-05-08'),
(10,'Swati', 'Rao', 62000.00, '1986-01-01', '2012-08-20');

create table Orders (
    OrderID int primary key,
    OrderDate date,
    TotalAmount decimal(10,2),
    EmpID int,
    foreign key (EmpID) references Employee(EmpID)
);
desc Orders;
/*'OrderID', 'int', 'NO', 'PRI', NULL, ''
'OrderDate', 'date', 'YES', '', NULL, ''
'TotalAmount', 'decimal(10,2)', 'YES', '', NULL, ''
'EmpID', 'int', 'YES', 'MUL', NULL, ''*/

insert into Orders (OrderID, OrderDate, TotalAmount, EmpID) values
(101, '2023-01-05', 1200.50, 1),
(102, '2023-01-12', 2500.00, 2),
(103, '2023-02-01', 1800.75, 3),
(104, '2023-02-15', 3200.00, 4),
(105, '2023-03-10', 2100.20, 5),
(106, '2023-03-22', 4000.00, 6),
(107, '2023-04-05', 1500.60, 7),
(108, '2023-04-18', 2700.90, 8),
(109, '2023-05-02', 3500.00, 9),
(110, '2023-05-20', 2800.80, 10);

-- Output: 
select * from Employee;
/*'1', 'Amit', 'Sharma', '45000.00', '1990-03-12', '2015-02-21'
'2', 'Priya', 'Verma', '50000.00', '1985-07-29', '2021-07-19'
'3', 'Rahul', 'Kumar', '60000.00', '1980-12-18', '2017-08-10'
'4', 'Neha', 'Gowda', '55000.00', '1991-10-15', '2018-12-12'
'5', 'Rohit', 'Shetty', '47000.00', '1995-09-30', '2019-06-08'
'6', 'Anita', 'Jai', '65000.00', '1987-05-07', '2014-02-05'
'7', 'Suresh', 'Gowda', '48000.00', '1983-08-16', '2020-04-05'
'8', 'Kiran', 'Rao', '52000.00', '1985-04-23', '2021-12-06'
'9', 'Vikas', 'Raj', '58000.00', '1990-06-09', '2013-05-08'
'10', 'Swati', 'Rao', '62000.00', '1986-01-01', '2012-08-20'*/

select * from Orders;
/*'101', '2023-01-05', '1200.50', '1'
'102', '2023-01-12', '2500.00', '2'
'103', '2023-02-01', '1800.75', '3'
'104', '2023-02-15', '3200.00', '4'
'105', '2023-03-10', '2100.20', '5'
'106', '2023-03-22', '4000.00', '6'
'107', '2023-04-05', '1500.60', '7'
'108', '2023-04-18', '2700.90', '8'
'109', '2023-05-02', '3500.00', '9'
'110', '2023-05-20', '2800.80', '10'*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
Select Round(Salary) As RoundSalary From Employee;
-- Output: 
/*'45000'
'50000'
'60000'
'55000'
'47000'
'65000'
'48000'
'52000'
'58000'
'62000'*/

/* b. Absolute Values: Show absolute values of salaries */
Select Abs(Salary) As AbsoluteSalary From Employee;
-- Output: 
/*'45000.00'
'50000.00'
'60000.00'
'55000.00'
'47000.00'
'65000.00'
'48000.00'
'52000.00'
'58000.00'
'62000.00'*/

/* c. Ceiling Values: Get ceiling values of order amounts */
Select Ceil(TotalAmount) as CeilingAmount from Orders;
-- Output: 
/*'1201'
'2500'
'1801'
'3200'
'2101'
'4000'
'1501'
'2701'
'3500'
'2801'*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
Select count(*) as TotalEmployees from Employee;
-- Output: 
/*'10'*/

/* b. Sum of Salaries: Calculate total salary expense */
Select sum(Salary) as TotalSalaryExpense from Employee;
-- Output: 
/*'542000.00'*/

/* c. Average Order Amount: Find average order value */
Select Avg(TotalAmount) as AverageOrderValue from Orders;
-- Output: 
/*'2530.375000'8*/

/* d. Max/Min Salary: Find highest and lowest salaries */
Select Min(Salary) As MinSalary from Employee;
Select Max(Salary) As MaxSalary from Employee;
-- Output: 
/*'45000.00'*/
/*'65000.00'*/

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select upper(FirstName) as UpperName, lower(FirstName) as LowerName from Employee;
-- Output: 
/*'AMIT', 'amit'
'PRIYA', 'priya'
'RAHUL', 'rahul'
'NEHA', 'neha'
'ROHIT', 'rohit'
'ANITA', 'anita'
'SURESH', 'suresh'
'KIRAN', 'kiran'
'VIKAS', 'vikas'
'SWATI', 'swati'*/

/* b. Concatenate Names: Create full names */
select concat(FirstName, ' ', LastName) as FullName from Employee;
-- Output: 
/*'Amit Sharma'
'Priya Verma'
'Rahul Kumar'
'Neha Gowda'
'Rohit Shetty'
'Anita Jai'
'Suresh Gowda'
'Kiran Rao'
'Vikas Raj'
'Swati Rao'*/

/* c. Extract Substring: Get first 3 characters of first names */
Select substr(FirstName, 1, 3) from Employee; 
-- Output: 
/*'Ami'
'Pri'
'Rah'
'Neh'
'Roh'
'Ani'
'Sur'
'Kir'
'Vik'
'Swa'*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */

-- Output: 

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
Select Cast(OrderDate AS Char) As ConvertedDate from Orders;
-- Output: 
/*'2023-01-05'
'2023-01-12'
'2023-02-01'
'2023-02-15'
'2023-03-10'
'2023-03-22'
'2023-04-05'
'2023-04-18'
'2023-05-02'
'2023-05-20'*/
Select now();
/*'2025-09-08 19:29:58'*/

/* b. Extract Year: Get year from order dates */
Select Extract(Year From OrderDate) As OrderYear from Orders;
-- Output: 
/*'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'*/

/* c. Add Months: Add 3 months to order dates */
Select Date_Add(OrderDate, Interval 3 Month) as FinalDate from Orders;
-- Output: 
/*'2023-04-05'
'2023-04-12'
'2023-05-01'
'2023-05-15'
'2023-06-10'
'2023-06-22'
'2023-07-05'
'2023-07-18'
'2023-08-02'
'2023-08-20'*/

/* d. Days Since Order: Calculate days between order date and now */
Select OrderID, datediff(Now(), OrderDate) As DaysSinceOrder from Orders;
-- Output: 
/*'101', '977'
'102', '970'
'103', '950'
'104', '936'
'105', '913'
'106', '901'
'107', '887'
'108', '874'
'109', '860'
'110', '842'*/

-- END of the Task -- 