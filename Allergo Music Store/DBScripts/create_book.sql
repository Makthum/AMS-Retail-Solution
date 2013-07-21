CREATE TABLE book (
UPC VARCHAR2(10) ,
tite VARCHAR2(50) ,
publisher VARCHAR2(50) ,
constraints book_pk primary key(UPC),
constraints book_upc_fk foreign key(UPC) references ITEM(UPC)
);
commit ;