create table supplier 
(
supp_name varchar2(50) constraints supplier_pk primary key,
status VARCHAR2(8) check( status in ('Active','Inactive')),
address varchar2(255),
city VARCHAR2(30) );
commit;