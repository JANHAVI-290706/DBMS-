create database school;
use school;

create table Student (
    StudentID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    DOB date,
    Class varchar(50),
    Marks int,
    City varchar(50)
);
desc Student;
/*'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(50)', 'YES', '', NULL, ''
'LastName', 'varchar(50)', 'YES', '', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'Class', 'varchar(50)', 'YES', '', NULL, ''
'Marks', 'int', 'YES', '', NULL, ''
'City', 'varchar(50)', 'YES', '', NULL, ''*/

create table  Teacher (
    TeacherID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Subject varchar(50),
    HireDate date,
    Salary decimal(10, 2)
);
desc Teacher;
/*'TeacherID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(50)', 'YES', '', NULL, ''
'LastName', 'varchar(50)', 'YES', '', NULL, ''
'Subject', 'varchar(50)', 'YES', '', NULL, ''
'HireDate', 'date', 'YES', '', NULL, ''
'Salary', 'decimal(10,2)', 'YES', '', NULL, ''*/

create table Course (
    CourseID int primary key,
    CourseName varchar(50),
    Credits int
);
desc Course;
/*'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(50)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''*/

create table Enroll (
    EnrollID int primary key,
    StudentID int,
    CourseID int,
    Grade char(10),
    foreign key (StudentID) references Student(StudentID),
    foreign key (CourseID) references Course(CourseID)
);
desc Enroll;
/*'EnrollID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Grade', 'char(10)', 'YES', '', NULL, ''*/

insert into  Student (StudentID, FirstName, LastName, DOB, Class, Marks, City) values
(1, 'Aditya', 'Mehta', '2005-01-15', '10A', 85, 'Delhi'),
(2, 'Bhavna', 'Shah', '2004-12-30', '11B', 92, 'Mumbai'),
(3, 'Chirag', 'Nair', '2005-01-10', '10A', 78, 'Kochi'),
(4, 'Divya', 'Rao', '2003-06-25', '12C', 88, 'Hyderabad'),
(5, 'Esha', 'Iyer', '2005-07-14', '10B', 74, 'Bangalore');

insert into Teacher (TeacherID, FirstName, LastName, Subject, HireDate, Salary) values
(1, 'Ravi', 'Kumar', 'Maths', '2010-08-01', 52000.00),
(2, 'Sonal', 'Patel', 'Science', '2015-03-15', 48000.00),
(3, 'Manish', 'Desai', 'English', '2008-11-20', 55000.00);

insert into Course (CourseID, CourseName, Credits) values
(1, 'Mathematics', 4),
(2, 'Physics', 3),
(3, 'English', 2),
(4, 'Computer Science', 4);

insert into Enroll (EnrollID, StudentID, CourseID, Grade) values
(1, 1, 1, 'A'),
(2, 1, 4, 'B'),
(3, 2, 2, 'A'),
(4, 3, 1, 'C'),
(5, 4, 3, 'B'),
(6, 5, 4, 'A');

select * from Student;
/*'1', 'Aditya', 'Mehta', '2005-01-15', '10A', '85', 'Delhi'
'2', 'Bhavna', 'Shah', '2004-12-30', '11B', '92', 'Mumbai'
'3', 'Chirag', 'Nair', '2005-01-10', '10A', '78', 'Kochi'
'4', 'Divya', 'Rao', '2003-06-25', '12C', '88', 'Hyderabad'
'5', 'Esha', 'Iyer', '2005-07-14', '10B', '74', 'Bangalore'*/

select CourseName, right(CourseName, 3) as Last3Chars from Course;
/*'Mathematics', 'ics'
'Physics', 'ics'
'English', 'ish'
'Computer Science', 'nce'*/

select concat(FirstName, ' ', LastName) as FullName from Teacher;
/*'Ravi Kumar'
'Sonal Patel'
'Manish Desai'*/

select StudentID, FirstName, LastName, length(FirstName) + length(LastName) as NameLength from Student;
/*'1', 'Aditya', 'Mehta', '11'
'2', 'Bhavna', 'Shah', '10'
'3', 'Chirag', 'Nair', '10'
'4', 'Divya', 'Rao', '8'
'5', 'Esha', 'Iyer', '8'*/

select CourseID, replace(CourseName, 'Maths', 'Mathematics') as UpdatedCourseName from Course;
/*'1', 'Mathematics'
'2', 'Physics'
'3', 'English'
'4', 'Computer Science'*/

select abs(max(Marks) - min(Marks)) as MarksDifference from Student;
/*'18'*/

select TeacherID, round(Salary, -3) as RoundedSalary from Teacher;
/*'1', '52000'
'2', '48000'
'3', '55000'*/

select CourseID, CourseName, sqrt(Credits) as CreditSqrt from Course;
/*'1', 'Mathematics', '2'
'2', 'Physics', '1.7320508075688772'
'3', 'English', '1.4142135623730951'
'4', 'Computer Science', '2'*/

select Marks, ceiling(Marks) as CeilingValue, floor(Marks) as FloorValue from Student;
/*'85', '85', '85'
'92', '92', '92'
'78', '78', '78'
'88', '88', '88'
'74', '74', '74'*/

select StudentID, Marks, mod(Marks, 5) as Modulus from Student;
/*'1', '85', '0'
'2', '92', '2'
'3', '78', '3'
'4', '88', '3'
'5', '74', '4'*/

select now() as CurrentDateTime;
/*'2025-09-10 06:39:51'*/

select TeacherID, year(HireDate) as HireYear, month(HireDate) as HireMonth from Teacher;
/*'1', 2010, '8'
'2', 2015, '3'
'3', 2008, '11'*/

select * FROM Student where month(DOB) = 1;
/*'1', 'Aditya', 'Mehta', '2005-01-15', '10A', '85', 'Delhi'
'3', 'Chirag', 'Nair', '2005-01-10', '10A', '78', 'Kochi'*/

select TeacherID, datediff(curdate(), HireDate) as DaysSinceHire from Teacher;
/*'1', '5519'
'2', '3832'
'3', '6138'*/

select count(*) as TotalStudents from Student;
/*'5'*/

select avg(Salary) as AverageSalary from Teacher;
/*'51666.666667'*/

select max(Marks) AS HighestMark, min(Marks) as LowestMark from Student;
/*'92', '74'*/
