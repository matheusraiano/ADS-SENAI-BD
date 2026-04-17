-- 1
select * from employees;
-- 2
select first_name, last_name from employees;
-- 3
select first_name, salary, job_id from employees;
-- 4
select * from departments;
-- 5
select department_name from departments;
-- 6
select * from jobs;
-- 7 
select job_title, min_salary from jobs;
-- 8
select employee_id, email from employees;
-- 9
select "Banco de Dados com MySQL";
-- 10
select current_date();
-- 11
select * from employees where salary > 5000;
-- 12
select * from employees where salary < 3000;
-- 13
select * from employees where salary = 2400;
-- 14
select * from employees where salary != 3000;
-- 15
select * from job_history where start_date > "2005/01/01";
-- 16
select * from employees where department_id = 90;
-- 17
select * from employees where manager_id = 100;
-- 18
select * from employees where salary >= 10000;
-- 19
select * from employees where salary <= 2500;
-- 20
select * from employees where job_id = "IT_PROG";
-- 21
select first_name as "Nome" from employees;
-- 22
select salary as "Salário" from employees;
-- 23
select first_name as "Nome", salary as "Salário" from employees;
-- 24
select * from employees ORDER BY salary;
-- 25
select * from employees ORDER BY salary desc;
-- 26
select * from employees order by first_name;
-- 27
select * from employees order by departament_id;
-- 28
select * from employees limit 5;
-- 29
select * from employees order by salary desc limit 10;
-- 30
select distinct salary from employees;
-- 31
select distinct job_id from employees;
-- 32
select * from employees order by hire_date;
-- 33
select * from employees order by hire_date desc limit 3;
-- 34
select * from employees where salary > 5000 and department_id = 50;
-- 35
select * from employees where salary > 5000 or department_id = 50;
-- 36
select * from employees where not department_id = 50;
-- 37
select * from employees where salary > 2000 and salary < 5000;
-- 38
select * from employees where department_id = 10 or department_id = 20;
-- 39
select * from employees where salary > 3000 and JOB_ID = 'SA_REP';
-- 40
select * from employees where not manager_id;
-- 41
select * from employees where first_name like "A%";
-- 42
select * from employees where first_name like "%n";
-- 43
select * from employees where first_name like "%ar%";
-- 44
select * from employees where email like "S%";
-- 45
select * from employees where DEPARTMENT_ID = '10, 20, 30';
-- 46
select * from employees where not DEPARTMENT_ID = "10, 20, 30";
-- 47
select * from employees where manager_id is null;
-- 48
select * from employees where COMMISSION_PCT is not null;
-- 49
insert into employees values ('207', '101', '110', 'Credo', 'Da Silva', 'Julianmail', '574.234.1234', '2006-06-07', 'HR_REP', '6700', 0.10);
-- 50
select * from employees where DEPARTMENT_ID = 50 and salary > 5000;
-- 51
select * from employees where DEPARTMENT_id = 140 or salary > 10000 order by first_name;
-- 52
select * from employees where not DEPARTMENT_ID = 50 or salary > 3000 and salary < 8000;
-- 53
select * from employees where COMMISSION_PCT > 4000 and salary > 4000;
-- 54
select * from employees where not manager_id or DEPARTMENT_ID = 90;
-- 55
select * from employees where first_name like 'A%' and salary > 3000;
-- 56
select * from employees where last_name like '%a' or LAST_NAME like '%son%';
-- 57
select * from employees where email like '%s%' and DEPARTMENT_ID = 80;
-- 58
select * from employees where email not like 'j%';
-- 59
select * from employees where FIRST_NAME like '%an%' and salary > 2000 and salary < 6000 order by FIRST_NAME;
-- 60
select * from employees where DEPARTMENT_ID = 10 and DEPARTMENT_ID = 20 and DEPARTMENT_ID = 30 order by DEPARTMENT_ID;


select * from departments;