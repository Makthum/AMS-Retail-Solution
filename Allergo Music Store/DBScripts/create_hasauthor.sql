CREATE TABLE hasAuthor (
UPC VARCHAR2(10) ,
author_name VARCHAR2(50) not null ,
constraints hasAuthor_pk primary key(UPC,author_name),
constraints hasAuthor_upc_fk foreign key(UPC) references ITEM(UPC)
);
commit ;