create database Student;
use Student;

create table student(
USN varchar(10) primary key,
Name varchar(50),
Age int,
Combination varchar(20),
M1 int,
M2 int,
M3 int
);

desc student;
/*'USN', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Name', 'varchar(50)', 'YES', '', NULL, ''
'Age', 'int', 'YES', '', NULL, ''
'Combination', 'varchar(20)', 'YES', '', NULL, ''
'M1', 'int', 'YES', '', NULL, ''
'M2', 'int', 'YES', '', NULL, ''
'M3', 'int', 'YES', '', NULL, ''*/

insert into student values
('101','Raj',19,'DBMS',80,87,67),
('102','Sema',19,'ST',40,35,22),
('103','Seetha',19,'CN',87,44,35),
('104','Prateek',19,'OS',80,87,99),
('105','Achal',19,'DBMS',99,92,88),
('106','Ramya',19,'ST',33,22,35),
('107','Daksh',19,'CN',89,98,99),
('108','Shruthi',19,'OS',23,45,65),
('109','Varsha',19,'DBMS',80,87,97),
('110','Janhavi',19,'CN',89,98,99);


alter table student add Total int;
alter table student add Avg float;
alter table student add Result varchar(20);

desc student;
/*'USN', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Name', 'varchar(50)', 'YES', '', NULL, ''
'Age', 'int', 'YES', '', NULL, ''
'Combination', 'varchar(20)', 'YES', '', NULL, ''
'M1', 'int', 'YES', '', NULL, ''
'M2', 'int', 'YES', '', NULL, ''
'M3', 'int', 'YES', '', NULL, ''
'Total', 'int', 'YES', '', NULL, ''
'Avg', 'float', 'YES', '', NULL, ''
'Result', 'varchar(20)', 'YES', '', NULL, ''*/

update student set Total = M1+M2+M3 , Avg = (M1+M2+M3)/3;

update student set result = 'Pass' where M1>= 35 AND M2>=35 AND M3>=35;
update student set result = 'Fail' where M1<35 OR M2<35 OR M3<35;

select * from student;
/*'101', 'Raj', '19', 'DBMS', '80', '87', '67', '234', '78', 'Pass'
'102', 'Sema', '19', 'ST', '40', '35', '22', '97', '32.3333', 'Fail'
'103', 'Seetha', '19', 'CN', '87', '44', '35', '166', '55.3333', 'Pass'
'104', 'Prateek', '19', 'OS', '80', '87', '99', '266', '88.6667', 'Pass'
'105', 'Achal', '19', 'DBMS', '99', '92', '88', '279', '93', 'Pass'
'106', 'Ramya', '19', 'ST', '33', '22', '35', '90', '30', 'Fail'
'107', 'Daksh', '19', 'CN', '89', '98', '99', '286', '95.3333', 'Pass'
'108', 'Shruthi', '19', 'OS', '23', '45', '65', '133', '44.3333', 'Fail'
'109', 'Varsha', '19', 'DBMS', '80', '87', '97', '264', '88', 'Pass'
'110', 'Janhavi', '19', 'CN', '89', '98', '99', '286', '95.3333', 'Pass'*/