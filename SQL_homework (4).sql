select * from "Employees" limit 10;
select * from "Salaries" limit 10;
select * from "Department_Employee" limit 10;
select * from "Department_Manager";
select * from "Departments" limit 10;
select * from "Titles" limit 10;

--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

select "Employees".emp_num, last_name, first_name, gender, salary
from "Salaries"
inner join "Employees" on 
"Employees".emp_num="Salaries".emp_num;

-- 2. List employees who were hired in 1986.
select emp_num, last_name, first_name, hire_date
from "Employees"
where hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select 
"Department_Manager".dept_num, "Departments".dept_name, "Department_Manager".emp_num, 
"Employees".first_name, "Employees".last_name,
"Department_Manager".from_date,"Department_Manager".to_date
from "Department_Manager"
inner join "Departments" on "Department_Manager".dept_num = "Departments".dept_num
inner join "Employees" on "Department_Manager".emp_num = "Employees".emp_num;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.
select
"Employees".emp_num,"Employees".last_name,"Employees".first_name,"Departments".dept_name
from "Employees"
inner join "Department_Employee" on "Department_Employee".emp_num = "Employees".emp_num
inner join "Departments" on "Departments".dept_num = "Department_Employee".dept_num;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

select 
"Employees".first_name, "Employees".last_name
from "Employees"
Where first_name = 'Hercules' and last_name like 'B%';


-- 6. List all employees in the Sales department, 
--    including their employee number, last name, first name, and department name.

select
"Employees".emp_num,"Employees".last_name,"Employees".first_name,"Departments".dept_name
from "Employees"
inner join "Department_Employee" on "Department_Employee".emp_num = "Employees".emp_num
inner join "Departments" on "Departments".dept_num = "Department_Employee".dept_num
where dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.

select
"Employees".emp_num,"Employees".last_name,"Employees".first_name,"Departments".dept_name
from "Employees"
inner join "Department_Employee" on "Department_Employee".emp_num = "Employees".emp_num
inner join "Departments" on "Departments".dept_num = "Department_Employee".dept_num
where dept_name = 'Sales' or dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names,
--    i.e., how many employees share each last name.

select 
"Employees".last_name,
count ("Employees".last_name)
from "Employees"
group by 
"Employees".last_name
order by count desc;
