-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/xmI6VE
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_num" varchar(30)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_num"
     )
);

CREATE TABLE "Department_Employee" (
    "emp_num" int   NOT NULL,
    "dept_num" varchar(30)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" datetime   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "dept_num" varchar(30)   NOT NULL,
    "emp_num" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" datetime   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_num" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(30)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "Salaries" (
    "emp_num" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_num" int   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Departments_dept_num" FOREIGN KEY("dept_num")
REFERENCES "Departments" ("dept_num");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_num" FOREIGN KEY("emp_num")
REFERENCES "Employees" ("emp_num");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Employees_emp_num" FOREIGN KEY("emp_num")
REFERENCES "Employees" ("emp_num");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_num" FOREIGN KEY("emp_num")
REFERENCES "Employees" ("emp_num");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_num" FOREIGN KEY("emp_num")
REFERENCES "Employees" ("emp_num");

