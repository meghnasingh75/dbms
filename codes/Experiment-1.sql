CREATE TABLE client_master
(
    client_no VARCHAR2(6),
    name      VARCHAR2(20),
    address1  VARCHAR2(30),
    address2  VARCHAR2(30),
    city      VARCHAR2(15),
    state     VARCHAR2(15),
    pincode   NUMBER(6),
    bal_due   NUMBER(10)
);

CREATE TABLE Product_master
(
    Product_no     VARCHAR2(6),
    Description    VARCHAR2(20),
    Profit_percent NUMBER(10),
    Unit_measure   VARCHAR2(30),
    Qty_on_hand    NUMBER(10),
    Sell_price     NUMBER(6),
    Cost_price     NUMBER(10)
);

INSERT INTO client_master
    (client_no, name, city, pincode, state, bal_due)
VALUES ('0001', 'Ivan', 'Bombay', 400054, 'Maharashtra', 15000);

INSERT INTO client_master
    (client_no, name, city, pincode, state, bal_due)
VALUES ('0002', 'Vandana', 'Madras', 780001, 'Tamilnadu', 0);

INSERT INTO client_master
    (client_no, name, city, pincode, state, bal_due)
VALUES ('0003', 'Pramada', 'Bombay', 400057, 'Maharashtra', 5000);

INSERT INTO client_master
    (client_no, name, city, pincode, state, bal_due)
VALUES ('0004', 'Basu', 'Bombay', 400056, 'Maharashtra', 0);

INSERT INTO client_master
    (client_no, name, city, pincode, state, bal_due)
VALUES ('0005', 'Ravi', 'Delhi', 100001, '', 2000);

INSERT INTO client_master
    (client_no, name, city, pincode, state, bal_due)
VALUES ('0006', 'Rukmini', 'Bombay', 400050, 'Maharashtra', 0);

SELECT *
FROM client_master;

INSERT INTO Product_master
VALUES ('P00001','1.44floppies', 5, 'piece', 100, 525, 500);

INSERT INTO Product_master
VALUES ('P03453','Monitors', 6, 'piece', 10, 12000, 11200);

INSERT INTO Product_master
VALUES ('P06734','Mouse', 5, 'piece', 20, 1050, 500);

INSERT INTO Product_master
VALUES ('P07865','1.22 floppies', 5, 'piece', 100, 525, 500);

INSERT INTO Product_master
VALUES ('P07868','Keyboards', 2, 'piece', 10, 3150, 3050);

INSERT INTO Product_master
VALUES ('P07885','CD Drive', 2.5, 'piece', 10, 5250, 5100);

INSERT INTO Product_master
VALUES ('P07965','540 HDD', 4, 'piece', 10, 8400, 8000);

INSERT INTO Product_master
VALUES ('P07975','1.44 Drive', 5, 'piece', 10, 1050, 1000);

INSERT INTO Product_master
VALUES ('P08865','1.22 Drive', 5, 'piece', 2, 1050, 1000);

SELECT * FROM Product_master;

-- QUES 3
-- i)
SELECT name FROM client_master;
-- ii)
SELECT name, city FROM client_master;
-- iii )
SELECT * FROM Product_master;
-- iv)
SELECT * FROM client_master WHERE city='Bombay';
-- v)
SELECT * FROM client_master WHERE client_no='0001' OR client_no='0002';
-- vi
SELECT * FROM Product_master WHERE Description='1.22 Drive' OR Description='1.44 Drive';
-- vii)
SELECT * FROM Product_master WHERE Sell_price>5000;
-- viii)
SELECT * FROM client_master WHERE city='Bombay' or city='Delhi' or city='Madras';
-- ix)
SELECT * FROM Product_master WHERE Sell_price > 2000 AND Sell_price <= 5000;
-- x)
SELECT name, city, state FROM client_master WHERE state != 'Maharashtra';