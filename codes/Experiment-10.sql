CREATE TABLE customers(
    id number(5),
    name varchar2(15),
    age number(3),
    address varchar2(20),
    salary number(10)
);

INSERT ALL
INTO customers VALUES (1, 'Ramesh', 23, 'Allahbad', 20000)
INTO customers VALUES (2, 'Suresh', 22, 'Kanpur', 22000)
INTO customers VALUES (3, 'Mahesh', 24, 'Ghaziabad', 24000)
INTO customers VALUES (4, 'Chandan', 25, 'Noida', 26000)
INTO customers VALUES (5, 'Alex', 21, 'Paris', 28000)
INTO customers VALUES (6, 'Sunita', 20, 'Delhi', 30000)
SELECT 1 FROM DUAL;

set linesize 300;

SELECT * FROM customers;

CREATE OR REPLACE trigger display_salary_changes
before delete or insert or update on customers
for each row
when (new.id > 0)
declare
sal_diff number;
begin
sal_diff:= new.salary - old.salary;
dbms_output.put_line('Old Salary:'||old.salary);
dbms_output.put_line('New Salary:'||new.salary);
dbms_output.put_line('Salary Difference:'||sal_diff);
end;

set serveroutput on;

declare
total_rows number(2);
begin
update customers
set salary = salary + 5000;
if sql%notfound then
dbms_output.put_line('No customers updated')
elsif sql%found then
total_rows:= sql%rowcount;
dbms_output.put_line(total_rows || ' customers updated');
end if;
end;
