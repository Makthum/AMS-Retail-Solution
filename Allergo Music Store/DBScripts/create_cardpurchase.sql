CREATE TABLE cardPurchase(
	receiptid NUMBER(7) CONSTRAINTS card_purchase_order_pk PRIMARY KEY,
	card_no VARCHAR2(16),
expiry_date DATE,
  constraints card_purchase_receipt_id_fk foreign	key(receiptid) references PURCHASE(receiptid)


);
commit;