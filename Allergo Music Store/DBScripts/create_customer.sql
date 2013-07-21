create table customer
(
cid number(7) constraints customer_pk primary key ,
cust_name VARCHAR2(50),
address VARCHAR2(255),
city   VARCHAR2(30),
phone varchar2(13));
commit;

