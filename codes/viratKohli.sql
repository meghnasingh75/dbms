CREATE TABLE client_master
( client_no VARCHAR(6),
name VARCHAR(20), address1 VARCHAR(30), address2 VARCHAR(30), city
VARCHAR(15), state VARCHAR(15), pincode integer(6), bal_due integer(10)
);

CREATE TABLE Product_master (
Product_no VARCHAR(6),
Description VARCHAR(20),
Profit_percent integer(10),
Unit_measure VARCHAR(30),
Qty_on_hand Int(10),
Sell_price Int(6),
Cost_price Int(10)
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



Select * from client_master;

Select " ";
-- Select " ";
-- Select " ";

Select * from Product_master;


CREATE TABLE Sales_master
(
Salesman_no VARCHAR(6) PRIMARY KEY CHECK ( Salesman_no LIKE 'S%' ),
Sal_name VARCHAR(20) NOT NULL,
Address VARCHAR(100) NOT NULL,
City VARCHAR(20),
State VARCHAR(20),
Pincode NUMERIC(6),
Sal_amt NUMERIC(8) NOT NULL CHECK ( Sal_amt NOT LIKE 0),
Tgt_to_get NUMERIC(6) NOT NULL CHECK ( Tgt_to_get NOT LIKE 0),
Ytd_sales NUMERIC(6) NOT NULL CHECK ( Ytd_sales NOT LIKE 0),
Remarks VARCHAR(30)
);


CREATE TABLE Sales_order
(
S_order_no VARCHAR(6) PRIMARY KEY CHECK ( S_order_no LIKE '0%' ),
S_order_date DATE,
Client_no VARCHAR(25),
Dely_add VARCHAR(6) DEFAULT 'f',
Salesman_no VARCHAR(6),
Dely_type CHAR(1),
Billed_yn CHAR(1),
Dely_date DATE,
Order_status VARCHAR(10),
CHECK ( Order_status LIKE 'Ip' OR Order_status LIKE'F'OR Order_status LIKE 'Bo' OR
Order_status LIKE 'C'),
CHECK ( Dely_date > S_order_date )
);


CREATE TABLE Sales_order_details
(
S_order_no VARCHAR(6),
Product_no VARCHAR(6),
Qty_order NUMERIC(8),
Qty_disp NUMERIC(8),
Product_rate NUMERIC(10),
FOREIGN KEY (S_order_no) REFERENCES Sales_order (S_order_no),
PRIMARY KEY (S_order_no, Product_no)
);


SELECT * FROM SALES_MASTER;
Select " ";
select * from SALES_ORDER;
Select " ";

-- Inserting data to Sales_Master
INSERT INTO SALES_MASTER(Salesman_no, Sal_name, Address, City, State, Pincode,
Sal_amt, Tgt_to_get, Ytd_sales, Remarks)
VALUES ('S00001', 'Kiran', 'A/14 worli', 'Bombay', 'Mah', 400002, 3000, 100,
50,'Good'),
('S00002', 'Manish', '65,nariman', 'Bombay', 'Mah', 400001, 3000, 200,
100,'Good'),
('S00003', 'Ravi', 'P-7 Bandra', 'Bombay', 'Mah', 400032, 3000, 200,
100,'Good'),
('S00004', 'Ashish', 'A/5 Juhu', 'Bombay', 'Mah', 400044, 3500, 200,
150,'Good');
select * from Sales_master;


Select " ";


-- Inserting data Sales_order table
INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type,
Billed_yn,Salesman_no, Dely_date,
Order_status)
VALUES ('019001', '1996-01-12', '0001', 'F', 'N', 'S00001', '1996-01-20', 'Ip'),
('019002', '1996-01-25', '0002', 'P', 'N', 'S00002', '1996-01-27', 'C'),
('016865', '1996-02-18', '0003', 'F', 'Y', 'S00003', '1996-02-20', 'F'),
('019003', '1996-04-03', '0001', 'F', 'Y', 'S00001', '1996-04-07', 'F'),
('046866', '1996-05-20', '0004', 'P', 'N', 'S00002', '1996-05-22', 'C'),
('010008', '1996-05-24', '0005', 'F', 'N', 'S00004', '1996-05-26', 'Ip');
select * from Sales_order;

Select " ";

-- Inserting data Sales_order_details table
INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp,
Product_rate)VALUES ('019001', 'P00001', 4, 4, 525),
('019001', 'P07965', 2, 1, 8400),
('019001', 'P07885', 2, 1, 5250),
('019002', 'P00001', 10, 0, 525),
('046866', 'P07868', 3, 3, 3150);
select * from SALES_ORDER_DETAILS;

Select "  Ques1";

select name, product_master.product_no, description
from client_master,
     product_master,
     sales_order,
     sales_order_details
where client_master.name = 'Ivan'
  and client_master.client_no = sales_order.client_no
  and sales_order.S_ORDER_NO = sales_order_details.S_ORDER_NO
  and sales_order_details.product_no = product_master.product_no;


Select "  Ques 2.";


-- Ques 2.
select dely_date, sales_order_details.product_no, QTY_ORDER, description
from sales_order,
     sales_order_details,
     product_master
where sales_order.S_ORDER_NO = sales_order_details.S_ORDER_NO
  and sales_order_details.product_no = product_master.product_no
  and to_char(sales_order.dely_date, 'MM') = to_char(sysdate, 'MM');


Select " Ques 3.";


-- Ques 3.
select PRODUCT_MASTER.PRODUCT_NO, DESCRIPTION
from sales_order_details,
     PRODUCT_MASTER
where product_rate = (select max(product_rate) from sales_order_details)
  AND SALES_ORDER_DETAILS.PRODUCT_NO = PRODUCT_MASTER.PRODUCT_NO;


Select " Ques 4.";


-- Ques 4.
select description, product_master.product_no, name
from product_master,
     client_master,
     sales_order,
     sales_order_details
where description = 'CD Drive'
  and product_master.product_no = sales_order_details.product_no
  and sales_order_details.S_ORDER_NO = sales_order.S_ORDER_NO
  and sales_order.client_no = client_master.client_no;


Select "  Ques 5";


-- Ques 5.
select product_master.product_no, S_ORDER_NO
from product_master,
     sales_order_details
where description = '1.44floppies'
  and product_master.product_no = sales_order_details.product_no
  and QTY_ORDER < 5;


Select "  Ques 6";


-- Ques 6
select name, description, QTY_ORDER
from client_master,
     product_master,
     sales_order,
     sales_order_details
where name in ('Ivan', 'Vandana')
  and client_master.client_no = sales_order.client_no
  and sales_order.S_ORDER_NO = sales_order_details.S_ORDER_NO
  and sales_order_details.product_no = product_master.product_no;


Select "  Ques 7";


-- Ques 7
select description, QTY_ORDER
from product_master,
     sales_order_details,
     sales_order
where product_master.product_no = sales_order_details.product_no
  and sales_order_details.S_ORDER_NO = sales_order.S_ORDER_NO
  and client_no in ('0001', '0002');


Select "  Ques 8";


-- Ques 8
SELECT CLIENT_NO, SALESMAN_NO, S_ORDER_NO FROM SALES_ORDER GROUP BY CLIENT_NO, SALESMAN_NO, S_ORDER_NO ORDER BY CLIENT_NO;



Select "  Ques 9";


-- Ques 9
SELECT TO_CHAR(S_ORDER_DATE, 'dd-mm-yy') FROM SALES_ORDER;


Select "  Ques 10";

-- Ques 10
SELECT ADD_MONTHS(S_ORDER_DATE, -6), S_ORDER_DATE FROM SALES_ORDER;
