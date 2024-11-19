-- 1
select * from countries
where name = 'Japan';

create index country_index on countries(name);

select * from employees;
-- 2
select * from employees
    where name = 'Alice' and surname = 'Johnson';

create index name_lastname_index on employees(name, surname);


-- 3
select * from employees
where salary < 90000
and salary > 70000;


create unique index salary_index on employees (salary);

--4
select * from employees where substring(name from 1 for 4) = 'Caro';

create index name_substring_index on employees (substring(name from 1 for 4));

--5
SELECT * FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > 1000000 AND e.salary < 90000;

create index departments_budget_index on departments(budget);
create index employees_salary_index on employees(salary);
create index employees_department_index on employees(department_id);
create index departments_department_index on departments(department_id);
