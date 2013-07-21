CREATE TABLE leadSinger (
UPC VARCHAR2(10) ,
name VARCHAR2(50) not null ,
constraints leadsinger_pk primary key(UPC,name),
constraints leadsinger_upc_fk foreign key(UPC) references ITEM(UPC)
);
commit ;