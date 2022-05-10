-- CREATING FUNCTION
CREATE FUNCTION adder(n1 in number, n2 in number)
RETURN number
IS
n3 number(8);
BEGIN
n3:=n1+n2;
RETURN n3;
END;
/

-- CALLING FUNCTION
DECLARE
n3 number(2);
BEGIN
n3:= adder(11, 22);
dbms_output.put_line('Addition is: ' || n3);
END;
/
