CREATE TABLE purchaseItem(
	receiptid NUMBER(7) ,
	UPC VARCHAR2(10) ,
quantity NUMBER(7),
constraints PURCHASE_item_receipt_id_fk foreign	key(receiptid) references PURCHASE(receiptid),
constraints PURCHASE_item_pk primary key(receiptid,UPC),
constraints PURCHASE_item_upc_fk foreign key(UPC) references ITEM(UPC)

);
commit;	