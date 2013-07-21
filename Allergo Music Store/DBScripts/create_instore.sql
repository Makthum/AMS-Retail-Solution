CREATE TABLE instore_order(
	receiptid NUMBER(7) CONSTRAINTS istore_order_pk PRIMARY KEY,
	purchase_type VARCHAR2(30) check (purchase_type in ('Card','Credit')),
	store_name VARCHAR2(30),
  constraints instore_order_receipt_id_fk foreign	key(receiptid) references PURCHASE(receiptid),
	CONSTRAINTS instore_order_store_name FOREIGN KEY(store_name) REFERENCES "STORE"(store_name)

);
commit;