SELECT * FROM SalesTransactionHeader
SELECT * FROM SalesTransactionDetail
SELECT * FROM MsCustomer
SELECT * FROM PurchaseTransactionDetail
SELECT * FROM PurchaseTransactionHeader
SELECT * FROM MsPenMaterial

--> NEW TRANSACTION IN SALES TRANSACTION
INSERT INTO MsCustomer
VALUES ('CTR011','Sinta Rusli','Female','1989-02-02','081298275672','Jl. Jalan No. 16')

INSERT INTO SalesTransactionHeader
VALUES ('SLT016','STF002','CTR011','2020-12-25',3)

INSERT INTO SalesTransactionDetail (SalesID,PenID,SalesQTY,PaymentType)
VALUES('SLT016','PEN006',2,'Cash'),
('SLT016','PEN004',3,'Cash'),
('SLT016','PEN002',1,'Cash')

--> NEW TRANSACTION IN PURCHASE TRANSACTION

INSERT INTO PurchaseTransactionHeader
VALUES ('PCT016','STF008','VDR007','2020-01-02',4)

INSERT INTO PurchaseTransactionDetail (PurchaseID,PenMID,PurchaseQTY,PaymentType)
VALUES ('PCT016','PML010',25,'Kredit'),
('PCT016','PML001',50,'Kredit'),
('PCT016','PML005',72,'Kredit'),
('PCT016','PML008',32,'Kredit')

UPDATE MsPenMaterial
SET PenMStock += 25
WHERE PenMID = 'PML010'

UPDATE MsPenMaterial
SET PenMStock += 50
WHERE PenMID = 'PML001'

UPDATE MsPenMaterial
SET PenMStock += 72
WHERE PenMID = 'PML005'

UPDATE MsPenMaterial
SET PenMStock += 32
WHERE PenMID = 'PML008'
