INSERT INTO MsStaff (StaffID, StaffName, StaffGender, StaffDoB, StaffPhone, StaffAddress, Salary)
VALUES ('STF001','Budiman Sangat', 'Male', '1986 - 12 - 02', '089347238121', 'Jl. Moh. Hatta No. 1', 2890000),
('STF002','Chika Langkea', 'Female', '1997 - 10 - 08', '089637226121', 'Jl. Soekarno No. 10', 2500000),
('STF003','Aurel Nigata', 'Female', '1996 - 01 - 11', '089528886439', 'Jl. Imam Bonjol No. 30', 2160000),
('STF004','Angga Yani', 'Male', '1994 - 07 - 17', '089777887328', 'Jl. Rengasdengklok No. 10', 2160000),
('STF005','Reyhan Pewe', 'Male', '1999 - 11 - 26', '089345203306', 'Jl. Ki Hajar Dewantara No. 02', 2260000),
('STF006','Fica Riyandi', 'Female', '1994 - 05 - 04', '089347001209', 'Jl. WR. Supratman No. 11', 2660000),
('STF007','Tukul Arwanas', 'Male', '1980 - 08 - 18', '089563931921', 'Jl. Daan Mogot No. 01', 2660000),
('STF008','Siti Badirah', 'Female', '1991 - 03 - 19', '089764624673', 'Jl. Kita Berdua No. 02', 2360000),
('STF009','Arya Wicaksano', 'Male', '1996 - 06 - 06', '089646642459', 'Jl. Ahmad Yani No. 05', 2760000),
('STF010','Maria Belli', 'Female', '1989 - 12 - 23', '089339622462', 'Jl. Dewi Sartika No. 10', 2950000)

INSERT INTO MsCustomer (CustomerID, CustomerName, CustomerGender, CustomerDoB, CustomerPhone, CustomerAddress)
VALUES 
('CTR001','Suharti Rini','Female','1996 - 06 - 02','081465924376','Jl. Singosari No.23'),
('CTR002','Budi Docolmi','Male','1973 - 12 - 12','081212349867','Jl. Majapahit No. 123'),
('CTR003','Kevin Anggora','Male','1999 - 12 - 19','089612602457','Jl. Goa Raya No. 19'),
 ('CTR004','Marshel Lahutan','Male','1987 - 09 - 18','081385741923','Jl. Samudra Pasai No. 88'),
('CTR005','Sheren Sheran','Female','1985 - 08 - 08','08418296182','Jl. Bangsin Raya No. 01'),
 ('CTR006','Owen Susanto','Male','1997 - 12 - 02','081054839674','Jl. Taman Cibodas No. 512'),
('CTR007','Christine Siska','Male','1988 - 05 - 05','081202948571','Jl. Kalingga Raya No. 52'),
('CTR008','Michele Angela','Female','1982 - 02 - 02','081602945824','Jl. Pabuaran Raya No. 09'),
('CTR009','Andre Putu','Male','1993 - 03 - 13','089604719283','Jl. Borubudur No. 22'),
('CTR010','Dinara Fraders','Female','1999 - 12 -29','081354293812','Jl. Cibodas Raya No. 52')

INSERT INTO MsPen (PenID, PenName, PenPrice, PenStock)
VALUES ('PEN001', 'Pokyo Pen', 50000,100),
('PEN002', 'Tenko Pen', 25000,100),
('PEN003', 'CoPilot Pen', 35000,100),
('PEN004', 'Faber Castle Pen', 10500,150),
('PEN005', 'Milky Soft Pen', 35000,150),
('PEN006', 'Milky Hard Pen', 25000,250),
('PEN007', 'Popo Pen', 35000,120),
('PEN008', 'Roxy Pen', 40000,135),
('PEN009', 'Dirasa Pen', 10500,100),
('PEN010', 'Hector Pen', 25000,110)

INSERT INTO MsVendor (VendorID, VendorName, VendorAddress,VendorPhone,VendorEmail)
VALUES ('VDR001', 'Alumunation Industry', 'Jl. Raden No. 12','081452897109','alumination@gmail.com'),
('VDR002', 'Bit Co', 'Jl. Wijayabakti No. 69','081905210061','admin@bitco.com'),
('VDR003', 'Woody Patty', 'Jl. Jalan No. 56','081231103313','woodpatty@gmail.com'),
('VDR004', 'Thomas Aquino', 'Jl. Bansin No. 9','081990032099','thomas@aquino.com'),
('VDR005', 'Damos Aquino', 'Jl. Makassar No. 16','081529726550','damos@aquino.com'),
('VDR006', 'Smith Inc', 'Jl. Kukubima No. 864','081981483477','cs@smith.com'),
('VDR007', 'Merapi Madya Industry', 'Jl. Sendirian No. 12','081495767563','merapimadya@gmail.com'),
('VDR008', 'St. Covid Co', 'Jl. Babwa No. 73','081596368030','admin@covid.com'),
('VDR009', 'Amorphius Industry', 'Jl. Qusenga No. 22','081194467490','service@amorphius.com'),
('VDR010', 'Kontortus Industry', 'Jl. Kopet No. 11','081652358878','cs@kontortus.com')

INSERT INTO MsPenMaterial (PenMID, PenID, PenMName, PenMPrice, PenMStock)
VALUES ('PML001', 'PEN001', 'Stainless Steel', 20000, 150),
('PML002', 'PEN001', 'Kayu Jati', 5000, 150),
('PML003', 'PEN001', 'Karet', 2000, 150),
('PML004', 'PEN001', 'Plastik', 2200, 150),
('PML005', 'PEN001', 'Kertas', 2100, 150),
('PML006', 'PEN002', 'Plastik', 1500, 500),
('PML007', 'PEN002', 'Kasa', 1000, 500),
('PML008', 'PEN002', 'Karet', 1000, 500),
('PML009', 'PEN002', 'Besi', 12000, 500),
('PML010', 'PEN003', 'Alumunium', 15000, 200),
('PML011', 'PEN003', 'Kayu Basa', 5000, 200),
('PML012', 'PEN003', 'Karet', 2000, 200),
('PML013', 'PEN004', 'Plastik', 1200, 200),
('PML014', 'PEN004', 'Grafit', 5000, 200),
('PML015', 'PEN004', 'Kayu Jati', 12000, 200),
('PML016', 'PEN005', 'Plastik', 1000, 250),
('PML017', 'PEN005', 'Grafit', 5000, 250),
('PML018', 'PEN005', 'Besi', 15000, 250),
('PML019', 'PEN005', 'Karet', 5000, 250),
('PML020', 'PEN006', 'Stainless Steel', 10000, 120),
('PML021', 'PEN006', 'Grafit', 1000, 120),
('PML022', 'PEN007', 'Aluminium,', 10000, 120),
('PML023', 'PEN008', 'Stainless Steel,', 25000, 135),
('PML024', 'PEN008', 'Plastik,', 2000, 135),
('PML025', 'PEN009', 'Aluminium', 11000, 150),
('PML026', 'PEN010', 'Plastik', 5000, 100)


INSERT INTO SalesTransactionHeader
VALUES 
('SLT001','STF007','CTR003','2020 - 09 - 02','1'),
('SLT002','STF007','CTR010','2020 - 12 - 22','2'),
('SLT003','STF010','CTR007','2020 - 05 - 13','2'),
('SLT004','STF005','CTR004','2020 - 03 - 25','1'),
('SLT005','STF003','CTR002','2020 - 09 - 22','3'),
('SLT006','STF001','CTR001','2020 - 01 - 02','2'),
('SLT007','STF003','CTR005','2020 - 04 - 27','2'),
('SLT008','STF002','CTR003','2020 - 08 - 22','2'),
('SLT009','STF007','CTR009','2020 - 08 - 24','1'),
('SLT010','STF002','CTR010','2020 - 09 - 30','1'),
('SLT011','STF001','CTR006','2020 - 05 - 31','2'),
('SLT012','STF008','CTR002','2020 - 02 - 01','2'),
('SLT013','STF009','CTR002','2020 - 02 - 02','1'),
('SLT014','STF004','CTR008','2020 - 07 - 25','2'),
('SLT015','STF006','CTR003','2020 - 11 - 25','1')

INSERT INTO SalesTransactionDetail (SalesID, PenID, salesQTY, PaymentType)
VALUES ('SLT001', 'PEN009', 3, 'Cash'),
('SLT002', 'PEN007', 3, 'Kredit'),
('SLT002', 'PEN002', 2, 'Kredit'),
('SLT003', 'PEN003', 2, 'Kredit'),
('SLT003', 'PEN008', 6, 'Kredit'),
('SLT004', 'PEN009', 4, 'Cash'),
('SLT005', 'PEN005', 8, 'Cash'),
('SLT005', 'PEN001', 5, 'Cash'),
('SLT005', 'PEN009', 7, 'Cash'),
('SLT006', 'PEN006', 6, 'Cash'),
('SLT006', 'PEN005', 2, 'Cash'),
('SLT007', 'PEN007', 2, 'Kredit'),
('SLT008', 'PEN004', 1, 'Kredit'),
('SLT007', 'PEN010', 6, 'Kredit'),
('SLT008', 'PEN009', 1, 'Kredit'),
('SLT009', 'PEN002', 2, 'Cash'),
('SLT010', 'PEN010', 4, 'Kredit'),
('SLT011', 'PEN003', 5, 'Kredit'),
('SLT011', 'PEN001', 2, 'Kredit'),
('SLT012', 'PEN005', 3, 'Kredit'),
('SLT012', 'PEN007', 7, 'Kredit'),
('SLT013', 'PEN004', 9, 'Cash'),
('SLT014', 'PEN006', 5, 'Cash'),
('SLT014', 'PEN001', 1, 'Cash'),
('SLT015', 'PEN009', 4, 'Cash')


INSERT INTO PurchaseTransactionHeader (PurchaseID,VendorID,StaffID,PurchaseDate,PurchaseTotal)
VALUES 
('PCT001', 'VDR001', 'STF001','2019 - 03 - 02',1),
('PCT002', 'VDR002', 'STF002','2019 - 02 - 12',2),
('PCT003', 'VDR003', 'STF003','2019 - 11 - 22',2),
('PCT004', 'VDR004', 'STF004','2019 - 07 - 11',1),
('PCT005', 'VDR005', 'STF005','2019 - 05 - 02',3),
('PCT006', 'VDR006', 'STF006','2019 - 02 - 05',2),
('PCT007', 'VDR007', 'STF007','2019 - 08 - 18',2),
('PCT008', 'VDR008', 'STF008','2019 - 04 - 19',2),
('PCT009', 'VDR009', 'STF009','2019 - 08 - 23',1),
('PCT010', 'VDR010', 'STF010','2019 - 09 - 14',1),
('PCT011', 'VDR002', 'STF005','2019 - 01 - 13',2),
('PCT012', 'VDR005', 'STF003','2019 - 05 - 05',2),
('PCT013', 'VDR007', 'STF002','2019 - 02 - 07',1),
('PCT014', 'VDR003', 'STF001','2019 - 06 - 12',2),
('PCT015', 'VDR001', 'STF008','2019 - 12 - 09',1)

INSERT INTO PurchaseTransactionDetail (PurchaseID, PenMID, PurchaseQTY, PaymentType)
VALUES ('PCT001', 'PML001', 50, 'Cash'),
('PCT002', 'PML002', 20, 'Kredit'),
('PCT002', 'PML003', 30, 'Kredit'),
('PCT003', 'PML003', 90, 'Kredit'),
('PCT003', 'PML008', 46, 'Kredit'),
('PCT004', 'PML004', 24, 'Cash'),
('PCT005', 'PML005', 80, 'Cash'),
('PCT005', 'PML001', 55, 'Cash'),
('PCT005', 'PML009', 90, 'Cash'),
('PCT006', 'PML006', 90, 'Cash'),
('PCT006', 'PML005', 23, 'Cash'),
('PCT007', 'PML010', 64, 'Kredit'),
('PCT007', 'PML007', 21, 'Kredit'),
('PCT008', 'PML008', 12, 'Kredit'),
('PCT008', 'PML009', 77, 'Kredit'),
('PCT009', 'PML009', 28, 'Cash'),
('PCT010', 'PML010', 44, 'Kredit'),
('PCT011', 'PML002', 85, 'Kredit'),
('PCT011', 'PML004', 24, 'Kredit'),
('PCT012', 'PML007', 78, 'Kredit'),
('PCT012', 'PML005', 30, 'Kredit'),
('PCT013', 'PML006', 90, 'Cash'),
('PCT014', 'PML003', 45, 'Cash'),
('PCT014', 'PML001', 90, 'Cash'),
('PCT015', 'PML010', 24, 'Cash')






