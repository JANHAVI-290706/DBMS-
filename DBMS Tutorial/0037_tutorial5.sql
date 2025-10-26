create database tutorial;
use tutorial;

create table department (
    dept_id int primary key,
    dept_name varchar(50),
    location varchar(50)
);

create table employee (
    emp_id int primary key,
    emp_name varchar(50),
    age int,
    salary decimal(10,2),
    designation varchar(50),
    address varchar(100),
    doj date,
    dept_id int,
    foreign key (dept_id) references department(dept_id)
);
desc department;

/*'dept_id', 'int', 'NO', 'PRI', NULL, ''
'dept_name', 'varchar(50)', 'YES', '', NULL, ''
'location', 'varchar(50)', 'YES', '', NULL, ''*/

desc employee;
/*'emp_id', 'int', 'NO', 'PRI', NULL, ''
'emp_name', 'varchar(50)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
'salary', 'decimal(10,2)', 'YES', '', NULL, ''
'designation', 'varchar(50)', 'YES', '', NULL, ''
'address', 'varchar(100)', 'YES', '', NULL, ''
'doj', 'date', 'YES', '', NULL, ''
'dept_id', 'int', 'YES', 'MUL', NULL, ''*/

insert into department values
(1, 'IT', 'Bangalore'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Sales', 'Chennai');

insert into employee values
(101, 'Ananya Rao', 28, 55000, 'HR Executive', 'Mumbai', '2020-06-15', 2),
(102, 'Rohit Mehta', 32, 70000, 'Developer', 'Bangalore', '2019-03-10', 1),
(103, 'Priya Nair', 26, 45000, 'Developer', 'Bangalore', '2022-07-01', 1),
(104, 'Sanjay Verma', 40, 90000, 'Manager', 'Delhi', '2018-11-20', 3),
(105, 'Karan Singh', 30, 38000, 'Sales Executive', 'Chennai', '2021-01-12', 4);

update employee
set salary = salary + 5000
where designation = 'Developer';

select d.dept_name,
    count(e.emp_id) as total_employees,
    avg(e.salary) as avg_salary,
    max(e.salary) as highest_salary,
    min(e.salary) as lowest_salary
from department d
join employee e on d.dept_id = e.dept_id
group by d.dept_name;
/*'IT', '2', '62500.000000', '75000.00', '50000.00'
'HR', '1', '55000.000000', '55000.00', '55000.00'
'Finance', '1', '90000.000000', '90000.00', '90000.00'
'Sales', '1', '38000.000000', '38000.00', '38000.00'*/

select upper(emp_name) as employee_name,
       upper(designation) as job_title,
       concat(emp_name, ' works as ', designation) as employee_info from employee;
/*'ANANYA RAO', 'HR EXECUTIVE', 'Ananya Rao works as HR Executive'
'ROHIT MEHTA', 'DEVELOPER', 'Rohit Mehta works as Developer'
'PRIYA NAIR', 'DEVELOPER', 'Priya Nair works as Developer'
'SANJAY VERMA', 'MANAGER', 'Sanjay Verma works as Manager'
'KARAN SINGH', 'SALES EXECUTIVE', 'Karan Singh works as Sales Executive'*/

select emp_name,
    year(doj) as joining_year,
    timestampdiff(year, doj, curdate()) as years_worked from employee;
/*'Ananya Rao', '2020', '5'
'Rohit Mehta', '2019', '6'
'Priya Nair', '2022', '3'
'Sanjay Verma', '2018', '6'
'Karan Singh', '2021', '4'*/

select e.emp_name, e.salary
from employee e
join department d on e.dept_id = d.dept_id
where salary between 40000 and 80000
  and d.dept_name <> 'Sales';
/*'Ananya Rao', '55000.00'
'Rohit Mehta', '75000.00'
'Priya Nair', '50000.00'*/

select e.emp_name,
    e.designation,
    d.dept_name,
    d.location
from employee e
inner join department d on e.dept_id = d.dept_id;
/*'Rohit Mehta', 'Developer', 'IT', 'Bangalore'
'Priya Nair', 'Developer', 'IT', 'Bangalore'
'Ananya Rao', 'HR Executive', 'HR', 'Mumbai'
'Sanjay Verma', 'Manager', 'Finance', 'Delhi'
'Karan Singh', 'Sales Executive', 'Sales', 'Chennai'*/

select e.emp_name,
    e.designation,
    d.dept_name
from employee e
left join department d on e.dept_id = d.dept_id;
/*'Ananya Rao', 'HR Executive', 'HR'
'Rohit Mehta', 'Developer', 'IT'
'Priya Nair', 'Developer', 'IT'
'Sanjay Verma', 'Manager', 'Finance'
'Karan Singh', 'Sales Executive', 'Sales'*/

select d.dept_name,
    d.location,
    e.emp_name,
    e.designation
from employee e
right join department d on e.dept_id = d.dept_id;
/*'IT', 'Bangalore', 'Rohit Mehta', 'Developer'
'IT', 'Bangalore', 'Priya Nair', 'Developer'
'HR', 'Mumbai', 'Ananya Rao', 'HR Executive'
'Finance', 'Delhi', 'Sanjay Verma', 'Manager'
'Sales', 'Chennai', 'Karan Singh', 'Sales Executive'*/

delimiter //
create procedure insertemployee (
    in p_emp_id int,
    in p_emp_name varchar(50),
    in p_age int,
    in p_salary decimal(10,2),
    in p_designation varchar(50),
    in p_address varchar(100),
    in p_doj date,
    in p_dept_id int
)
begin
    insert into employee values (p_emp_id, p_emp_name, p_age, p_salary, p_designation, p_address, p_doj, p_dept_id);
end //
delimiter ;


delimiter //
create procedure updatesalary (
    in p_emp_id int,
    in p_new_salary decimal(10,2)
)
begin
    update employee
    set salary = p_new_salary
    where emp_id = p_emp_id;
end //
delimiter ;







