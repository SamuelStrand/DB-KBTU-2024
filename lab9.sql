-- 1
create or replace function increase_value(a int)
returns int
as
    $$
    begin
        return a + 10;

    end;
    $$
language plpgsql;

select * from increase_value(10);

-- 2

create or replace function compare_numbers(a int, b int)
returns varchar
as
    $$
    begin
        if a > b then
            return 'Greater';
        elsif a < b then
            return 'Lesser';
        else
            return 'Equal';
        end if;
    end;
    $$
language plpgsql;

select * from compare_numbers(10, 10);
select * from compare_numbers(3, 10);
select * from compare_numbers(10, 9);

-- 3
create or replace function number_series(n integer)
    returns text as
$$
    declare res text := '';
    begin
        for i in 1..n loop
            res := res || i || ' ';
        end loop;
        return res;
    end;
$$
language plpgsql;

select * from number_series(10);


--  4
create or replace function find_employee(emp_name text)
returns table(employee_id integer, employee_name text, employee_position text) as $$
begin
    return query select id, name, position from employees where name = emp_name;
end;
$$ language plpgsql;

--  5
create or replace function list_products(category text)
returns table(product_id integer, product_name text, product_price numeric) as $$
begin
    return query select id, name, price from products where category = category;
end;
$$ language plpgsql;

--  6
create or replace function calculate_bonus(salary numeric)
returns numeric as $$
begin
    return salary * 0.1;
end;
$$ language plpgsql;

create or replace function update_salary(emp_id integer)
returns void as $$
declare
    current_salary numeric;
    bonus numeric;
begin
    select salary into current_salary from employees where id = emp_id;
    bonus := calculate_bonus(current_salary);
    update employees set salary = salary + bonus where id = emp_id;
end;
$$ language plpgsql;

--  7
create or replace function complex_calculation(num1 integer, str1 varchar)
returns text as $$
declare
    numeric_result integer;
    string_result varchar;
    final_result text;
begin
    numeric_result := num1 * 10;

    string_result := upper(str1) || ' processed';

    final_result := 'numeric: ' || numeric_result || ', string: ' || string_result;

    return final_result;
end;
$$ language plpgsql;





