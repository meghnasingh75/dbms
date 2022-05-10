-- Ques 1
-- CREATING TABLE Challan_Header
CREATE TABLE Challan_Header
(
    Challan_no   VARCHAR2(6) PRIMARY KEY,
    s_order_no   VARCHAR2(6),
    challan_date DATE NOT NULL,
    billed_yn    CHAR(1) DEFAULT ('N'),
    FOREIGN KEY (s_order_no) REFERENCES sales_order (S_ORDER_NO),
    CHECK ( billed_yn in ('Y', 'N') )
);

-- CREATING TABLE Challan_Details
CREATE TABLE Challan_Details
(
    Challan_no VARCHAR2(6),
    Qty_disp   NUMBER(4, 2) NOT NULL,
    product_no VARCHAR2(6) REFERENCES product_master,
    Primary key (Challan_no, product_no)
);

-- Ques 2
-- Inserting values in Challan_Header
Insert into challan_header
values ('CH9001', '019001', '12‐DEC‐95', 'Y');
Insert into challan_header
values ('CH865', '046866', '12‐NOV‐95', 'Y');
Insert into challan_header
values ('CH3965', '010008', '12‐OCT‐95', 'Y');

-- Inserting values in Challan_Details
Insert into challan_details
values ('CH9001', 4, 'P00001');
Insert into challan_details
values ('CH9001', 1, 'P07965');
Insert into challan_details
values ('CH9001', 1, 'P07885');
Insert into challan_details
values ('CH6865', 3, 'P07868');
Insert into challan_details
values ('CH6865', 4, 'P03453');
Insert into challan_details
values ('CH6865', 10, 'P00001');
Insert into challan_details
values ('CH3965', 5, 'P00001');
Insert into challan_details
values ('CH3965', 2, 'P07975');

-- Objective
-- Ques1
ALTER TABLE CLIENT_MASTER
    MODIFY CLIENT_NO PRIMARY KEY;

-- Ques2
ALTER TABLE CLIENT_MASTER
    ADD Phone_no NUMBER(15);

-- Ques3
ALTER TABLE PRODUCT_MASTER
    MODIFY(DESCRIPTION NOT NULL, profit_percent NOT NULL, sell_price NOT NULL, cost_price NOT NULL);

-- Ques4
ALTER TABLE CLIENT_MASTER
    MODIFY CLIENT_NO VARCHAR2(10);

-- Ques5
SELECT PRODUCT_NO, DESCRIPTION
FROM PRODUCT_MASTER
WHERE PROFIT_PERCENT >= 2
  AND PROFIT_PERCENT <= 3;

-- DROP TABLE Challan_Details;