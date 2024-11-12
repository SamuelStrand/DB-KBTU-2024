-- 1
select * from countries
where country_name = 'Japan';

create index country_index on countries(country_name);

-- 2
select * from employees
where name = 'Michael' and lastname = 'Rogers';

create index name_lastname_index on employees(name, lastname);


-- 3
select * from employees
where salary < value1
and salary > value2;

create unique index salary_index on employees (salary);

--4
create index name_substring_index on employees (substring(name from 1 for 4));

--5
create index departments_budget_index on departments(budget);
create index employees_salary_index on employees(salary);
create index employees_department_index on employees(department_id);
create index departments_department_index on departments(department_id);
