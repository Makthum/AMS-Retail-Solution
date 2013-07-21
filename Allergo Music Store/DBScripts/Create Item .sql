create table item 
(
UPC VARCHAR2(10) primary key ,
sellprice NUMBER(10,2) 
taxable  char CHECK (taxable in ('N','Y'))
)