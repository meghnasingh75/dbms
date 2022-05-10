CREATE TABLE USER1(
    id number(10) PRIMARY KEY,
    Name VARCHAR2(100)
);
CREATE PROCEDURE INSERTUSER(
    id IN number, Name IN VARCHAR2
)
IS
BEGIN
INSERT INTO USER1 VALUES (id, Name);
END;

EXECUTE INSERTUSER(1, 'MEGHNASINGH');

EXECUTE INSERTUSER(1, 'MEGHNSINGH');

SELECT id, name FROM USER1;