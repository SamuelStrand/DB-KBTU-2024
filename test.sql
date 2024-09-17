create database test1;

create table test_users(
    id serial,
    name varchar(255),
    is_admin int
);

alter table test_users
add column bool_test integer;

alter table test_users
alter column bool_test type boolean
using bool_test::boolean;

alter table test_users
alter column bool_test
set default false;