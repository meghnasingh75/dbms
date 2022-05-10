CREATE TABLE customers(
    id number(5),
    name varchar2(15),
    age number(3),
    address varchar2(20),
    salary number(10)
);

INSERT INTO customers VALUES (1, 'Ramesh', 23, 'Allahbad', 20000);
INSERT INTO customers VALUES (2, 'Suresh', 22, 'Kanpur', 22000);
INSERT INTO customers VALUES (3, 'Mahesh', 24, 'Ghaziabad', 24000);
INSERT INTO customers VALUES (4, 'Chandan', 25, 'Noida', 26000);
INSERT INTO customers VALUES (5, 'Alex', 21, 'Paris', 28000);
INSERT INTO customers VALUES (6, 'Sunita', 20, 'Delhi', 30000);

SET serveroutput on;

declare
total_rows number(2);
begin
update customers
set salary = salary+5000;
if sql%notfound then
dbms_output.put_line(total_rows || ' customers updated ');
end if;
end;
/

SELECT * FROM customers;
