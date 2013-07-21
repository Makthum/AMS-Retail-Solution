create TABLE store (
store_name VARCHAR2(30) constraints store_pk primary key ,
address VARCHAR2(255),
city VARCHAR2(30),
phone VARCHAR2(10),
storeType VARCHAR2(15)check ( storeType in ('Regular','Warehouse'))
);
commit;