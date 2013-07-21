create table ams_return 
(
returnId number(7) constraints ams_return_pk primary key ,
retur_date DATE,
receiptid NUMBER(7) ,
store_name VARCHAR2(30),
constraints ams_return_recptid_fk foreign key(receiptid) references PURCHASE(receiptid),
 constraints ams_return_store_name foreign key(store_name) references "STORE"(store_name)
);
commit;