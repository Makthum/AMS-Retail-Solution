CREATE TABLE score (
UPC VARCHAR2(10) ,
tite VARCHAR2(50) ,
publisher VARCHAR2(50) ,
constraints score_pk primary key(UPC),
constraints score_upc_fk foreign key(UPC) references ITEM(UPC)
);
commit ;