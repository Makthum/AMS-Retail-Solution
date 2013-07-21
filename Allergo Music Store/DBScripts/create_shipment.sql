create table shipment(
sid VARCHAR2(20) constraints shipment_pk primary key ,
ship_date DATE,
supp_name varchar2(50), 
store_name VARCHAR2(30), 
constraints shipment_supp_name_fk foreign key(supp_name) references SUPPLIER(supp_name),
constraints shipment_store_name_fk foreign key(store_name) references "STORE"(store_name)
);
commit;