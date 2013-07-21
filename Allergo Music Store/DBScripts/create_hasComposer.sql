CREATE TABLE hasComposer (
UPC VARCHAR2(10) ,
composer_name VARCHAR2(50) not null ,
constraints hasComposer_pk primary key(UPC,composer_name),
constraints hasComposer_upc_fk foreign key(UPC) references ITEM(UPC)
);
commit ;