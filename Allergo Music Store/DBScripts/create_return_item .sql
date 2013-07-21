create table returnItem
(
UPC VARCHAR2(10) ,
returnId number(7),
quantity NUMBER(7),
constraints returnitem_pk primary key(UPC,returnId),
constraints returnitem_upc_fk foreign key(UPC) references ITEM(UPC),
constraints returnitem_returnid_fk foreign key (returnId) references AMS_RETURN(returnId)
);
commit;
