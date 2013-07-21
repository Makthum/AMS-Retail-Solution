CREATE TABLE hasSong (
UPC VARCHAR2(10) ,
title VARCHAR2(50) not null ,
constraints hasSong_pk primary key(UPC,title),
constraints hasSong_upc_fk foreign key(UPC) references ITEM(UPC)
);
commit ;