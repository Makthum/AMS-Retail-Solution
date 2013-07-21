create table shipitem 
(
sid VARCHAR2(20) constraints shipitem_pk primary key ,
UPC VARCHAR2(10) ,
quantity number(7),
constraints shipitem_sid_fk foreign key(sid) references shipment(sid),
constraints shipitem_upc_fk foreign key(upc) references item(upc)
);
commit;