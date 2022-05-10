-- Ques 1.
INSERT INTO client_master
    (client_no, name, city, pincode, state, bal_due)
VALUES ('0001', 'Ivan', 'Bombay', 400054, 'Maharashtra', 15000);

select name, product_master.product_no, description
from client_master,
     product_master,
     sales_order,
     sales_order_details
where client_master.name = 'Ivan'
  and client_master.client_no = sales_order.client_no
  and sales_order.S_ORDER_NO = sales_order_details.S_ORDER_NO
  and sales_order_details.product_no = product_master.product_no;

-- Ques 2.
select dely_date, sales_order_details.product_no, QTY_ORDER, description
from sales_order,
     sales_order_details,
     product_master
where sales_order.S_ORDER_NO = sales_order_details.S_ORDER_NO
  and sales_order_details.product_no = product_master.product_no
  and to_char(sales_order.dely_date, 'MM') = to_char(sysdate, 'MM');

-- Ques 3.
select PRODUCT_MASTER.PRODUCT_NO, DESCRIPTION
from sales_order_details,
     PRODUCT_MASTER
where product_rate = (select max(product_rate) from sales_order_details)
  AND SALES_ORDER_DETAILS.PRODUCT_NO = PRODUCT_MASTER.PRODUCT_NO;

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

-- Ques 5.
select product_master.product_no, S_ORDER_NO
from product_master,
     sales_order_details
where description = '1.44floppies'
  and product_master.product_no = sales_order_details.product_no
  and QTY_ORDER < 5;

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

-- Ques 7
select description, QTY_ORDER
from product_master,
     sales_order_details,
     sales_order
where product_master.product_no = sales_order_details.product_no
  and sales_order_details.S_ORDER_NO = sales_order.S_ORDER_NO
  and client_no in ('0001', '0002');

-- Ques 8
SELECT CLIENT_NO, SALESMAN_NO, S_ORDER_NO FROM SALES_ORDER GROUP BY CLIENT_NO, SALESMAN_NO, S_ORDER_NO ORDER BY CLIENT_NO;

-- Ques 9
SELECT TO_CHAR(S_ORDER_DATE, 'dd-mm-yy') FROM SALES_ORDER;

-- Ques 10
SELECT ADD_MONTHS(S_ORDER_DATE, -6), S_ORDER_DATE FROM SALES_ORDER;