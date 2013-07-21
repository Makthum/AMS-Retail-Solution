create table stored (
UPC NUMBER(10,2) ,
store_name VARCHAR2(30) ,
stock number(10) ,
constraints stored_pk primary key(UPC,store_name),
constraints stored_storename_fk foreign key(store_name) references store(store_name)
);
commit;
