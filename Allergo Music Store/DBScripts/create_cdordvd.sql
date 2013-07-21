CREATE TABLE cdordvd (
UPC VARCHAR2(10) ,
tite VARCHAR2(50) ,
year NUMBER(4),
ctype VARCHAR2(3) check (ctype in ('CD','DVD')),
category VARCHAR2(10),
constraints cdordvd_pk primary key(UPC),
constraints cdordvd_upc_fk foreign key(UPC) references ITEM(UPC)
);
commit ;