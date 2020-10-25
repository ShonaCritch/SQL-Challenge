-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/JdKXRd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Dept_no" VARCHAR (255)   NOT NULL,
    "Deptarment_Name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Employees" (
    "Emp_no" INTEGER  NOT NULL,
    "Emp_Title_id" VARCHAR(255)   NOT NULL,
    "Birth_date" DATE  NOT NULL,
    "First_Name" VARCHAR(255)   NOT NULL,
    "Last_Name" VARCHAR (255)   NOT NULL,
    "Sex" VARCHAR (255)   NOT NULL,
    "Hire_date" DATE  NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Titles" (
    "Title_id" VARCHAR   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_id"
     )
);

CREATE TABLE "Salaries" (
    "Salary_ID" VARCHAR   NOT NULL,
    "Emp_no" INTEGER   NOT NULL,
    "Salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Salary_ID"
     )
);

CREATE TABLE "Dept_Emp" (
    "Dept_Emp_ID" VARCHAR   NOT NULL,
    "Emp_no" INTEGER   NOT NULL,
    "Dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "Dept_Emp_ID"
     )
);

CREATE TABLE "Dept_Manager" (
    "Manager_ID" VARCHAR   NOT NULL,
    "Dept_no" VARCHAR   NOT NULL,
    "Emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "Manager_ID"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_Title_id" FOREIGN KEY("Emp_Title_id")
REFERENCES "Titles" ("Title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

