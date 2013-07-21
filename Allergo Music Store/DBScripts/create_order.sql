CREATE TABLE purchase_order(
	receiptid NUMBER(7) CONSTRAINTS order_pk PRIMARY KEY,
	card_no VARCHAR2(16),
	expiry DATE,
	delivery_date DATE,
	cid NUMBER(7),
	store_name VARCHAR2(30),
  constraints order_receipt_id_fk foreign	key(receiptid) references PURCHASE(receiptid),
	CONSTRAINTS order_cid_fk FOREIGN KEY(cid)REFERENCES CUSTOMER(cid),
	CONSTRAINTS order_store_name FOREIGN KEY(store_name) REFERENCES "STORE"(store_name)

);

COMMIT;