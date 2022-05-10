-- Question.2 Create the following tables:

-- i) Sales_master
CREATE TABLE Sales_master
(
    Salesman_no VARCHAR2(6) PRIMARY KEY CHECK ( Salesman_no LIKE 'S%' ),
    Sal_name    VARCHAR2(20)  NOT NULL,
    Address     VARCHAR2(100) NOT NULL,
    City        VARCHAR2(20),
    State       VARCHAR2(20),
    Pincode     NUMBER(6),
    Sal_amt     NUMBER(8)     NOT NULL CHECK ( Sal_amt NOT LIKE 0),
    Tgt_to_get  NUMBER(6)     NOT NULL CHECK ( Tgt_to_get NOT LIKE 0),
    Ytd_sales   NUMBER(6)     NOT NULL CHECK ( Ytd_sales NOT LIKE 0),
    Remarks     VARCHAR2(30)
);

-- ii Sales_order
CREATE TABLE Sales_order
(
    S_order_no   VARCHAR2(6) PRIMARY KEY CHECK ( S_order_no LIKE '0%' ),
    S_order_date DATE,
    Client_no    VARCHAR2(25),
    Dely_add     VARCHAR2(6) DEFAULT 'f',
    Salesman_no  VARCHAR2(6),
    Dely_type    CHAR(1),
    Billed_yn    CHAR(1),
    Dely_date    DATE,
    Order_status VARCHAR2(10) CHECK ( Order_status LIKE 'Ip' OR Order_status LIKE 'F' OR Order_status LIKE 'Bo' OR
                                      Order_status LIKE 'C'),
    CHECK ( Dely_date > S_order_date )
);

-- iii Sales_order_details
-- WE HAVE TO MAKE A ROW PRIMARY IN PRODUCT_MASTER
-- ALTER TABLE PRODUCT_MASTER
--     ADD PRIMARY KEY (PRODUCT_NO);
CREATE TABLE Sales_order_details
(
    S_order_no   VARCHAR2(6),
    Product_no   VARCHAR2(6),
    Qty_order    NUMBER(8),
    Qty_disp     NUMBER(8),
    Product_rate NUMBER(10),
    FOREIGN KEY (S_order_no) REFERENCES Sales_order (S_order_no),
    PRIMARY KEY (S_order_no, Product_no)
);
SELECT *
FROM SALES_MASTER;

select * from SALES_ORDER;

-- Inserting data to Sales_Master
INSERT INTO SALES_MASTER
VALUES ('S00001', 'Kiran', 'A/14 worli', 'Bombay', 'Mah', 400002, 3000, 100, 50, 'Good');

INSERT INTO SALES_MASTER
VALUES ('S00002', 'Manish', '65,nariman', 'Bombay', 'Mah', 400001, 3000, 200, 100, 'Good');

INSERT INTO SALES_MASTER
VALUES ('S00003', 'Ravi', 'P-7 Bandra', 'Bombay', 'Mah', 400032, 3000, 200, 100, 'Good');

INSERT INTO SALES_MASTER
VALUES ('S00004', 'Ashish', 'A/5 Juhu', 'Bombay', 'Mah', 400044, 3500, 200, 150, 'Good');

select *
from Sales_master;

-- Inserting data Sales_order table
INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('019001', '12-jan-96', '0001', 'F', 'N', 'S00001', '20-jan-96', 'Ip');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('019002', '25-jan-96', '0002', 'P', 'N', 'S00002', '27-jan-96', 'C');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('016865', '18-feb-96', '0003', 'F', 'Y', 'S00003', '20-feb-96', 'F');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('019003', '03-apr-96', '0001', 'F', 'Y', 'S00001', '07-apr-96', 'F');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('046866', '20-may-96', '0004', 'P', 'N', 'S00002', '22-may-96', 'C');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('010008', '24-may-96', '0005', 'F', 'N', 'S00004', '26-may-96', 'Ip');


-- Inserting data Sales_order_details table
INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019001', 'P00001', 4, 4, 525);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019001', 'P07965', 2, 1, 8400);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019001', 'P07885', 2, 1, 5250);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019002', 'P00001', 10, 0, 525);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('046866', 'P07868', 3, 3, 3150);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('046866', 'P07885', 10, 10, 5250);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019003', 'P00001', 4, 4, 1050);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019003', 'P03453', 2, 2, 1050);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('046866', 'P06734', 1, 1, 12000);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('046866', 'P07965', 1, 0, 8400);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('010008', 'P07975', 1, 0, 1050);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('010008', 'P00001', 10, 5, 525);

SELECT * FROM Sales_order;
