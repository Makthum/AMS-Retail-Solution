create table supplies(
supp_name VARCHAR2(50) ,
UPC VARCHAR2(20) ,
supprice number(10,2), 
constraints supplies_supp_name_fk foreign key(supp_name) references SUPPLIER(supp_name),
constraints supplies_upc_fk foreign key(upc) references item(upc),
constraints supplies_pk primary key(supp_name,UPC)
);
commit;
