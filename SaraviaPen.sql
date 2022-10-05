CREATE DATABASE SaraviaPen
GO
USE SaraviaPen

CREATE TABLE MsCustomer(
	CustomerID CHAR(6) PRIMARY KEY CHECK (CustomerID LIKE 'CTR[0-9][0-9][0-9]'),
	CustomerName VARCHAR (50) NOT NULL,
	CustomerGender VARCHAR (6) NOT NULL CHECK (CustomerGender in ('Male', 'Female')),
	CustomerDoB DATE NOT NULL,
	CustomerPhone VARCHAR(12) NOT NULL,
	CustomerAddress VARCHAR (255) NOT NULL,
	
)

CREATE TABLE MsStaff(
	StaffID CHAR(6) PRIMARY KEY CHECK (StaffID LIKE 'STF[0-9][0-9][0-9]'),
	StaffName VARCHAR (50) NOT NULL CHECK (StaffName LIKE '[A-Z][a-z][a-z]%'),
	StaffGender VARCHAR (6) NOT NULL CHECK (StaffGender in ('Male', 'Female')),
	StaffDoB DATE NOT NULL,
	StaffPhone VARCHAR(12) NOT NULL,
	StaffAddress VARCHAR (255) NOT NULL,
	Salary INT NOT NULL,
)

CREATE TABLE MsPen(
    PenID CHAR(6) PRIMARY KEY CHECK(PenID LIKE 'PEN[0-9][0-9][0-9]'),
    PenName VARCHAR(25) NOT NULL CHECK(PenName LIKE '% Pen'),
    PenPrice INT NOT NULL CHECK (PenPrice BETWEEN 10000 AND 50000),
    PenStock VARCHAR(25) NOT NULL
)

CREATE TABLE MsPenMaterial(
    PenMID CHAR(6) PRIMARY KEY CHECK(PenMID like 'PML[0-9][0-9][0-9]'),
	PenID CHAR(6) FOREIGN KEY REFERENCES MsPen(PenID) ON
    UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PenMName VARCHAR(25) NOT NULL,
    PenMPrice INT NOT NULL,
    PenMStock INT NOT NULL CHECK (PenMStock >= 100)
)

CREATE TABLE MsVendor(
    VendorID CHAR(6) PRIMARY KEY CHECK (VendorID LIKE 'VDR[0-9][0-9][0-9]'),
    VendorName VARCHAR(50) NOT NULL,
    VendorAddress VARCHAR(255) NOT NULL,
    VendorPhone VARCHAR(255) NOT NULL,
    VendorEmail VARCHAR(255) NOT NULL CHECK (VendorEmail LIKE '%@%')
)

CREATE TABLE SalesTransactionHeader(
    SalesID CHAR(6) PRIMARY KEY CHECK (SalesID LIKE 'SLT[0-9][0-9][0-9]'),
    StaffID CHAR(6) FOREIGN KEY REFERENCES MsStaff(StaffID) ON
    UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    CustomerID CHAR(6) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON
    UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    SalesDate DATE NOT NULL CHECK(SalesDate >= '2020-01-01'),
	SalesTotal INT NOT NULL
)

CREATE TABLE SalesTransactionDetail (
	SalesDetailID INT PRIMARY KEY IDENTITY(1,1) NOT NULL, 
	SalesID CHAR(6) FOREIGN KEY REFERENCES SalesTransactionHeader(SalesID),
	PenID CHAR(6) FOREIGN KEY REFERENCES MsPen(PenID) ON
    UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesQTY INT NOT NULL,
	PaymentType VARCHAR(255) NOT NULL
)

CREATE TABLE PurchaseTransactionHeader(
    PurchaseID CHAR(6) PRIMARY KEY CHECK (PurchaseID LIKE 'PCT[0-9][0-9][0-9]'),
    StaffID CHAR(6) FOREIGN KEY REFERENCES MsStaff(StaffID) ON
    UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    VendorID CHAR(6) FOREIGN KEY REFERENCES MsVendor(VendorID) ON
    UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PurchaseDate DATE NOT NULL,
	PurchaseTotal INT NOT NULL
)

CREATE TABLE PurchaseTransactionDetail(
	PurchaseDetailID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PurchaseID CHAR(6) FOREIGN KEY REFERENCES PurchaseTransactionHeader(PurchaseID),
    PenMID CHAR(6) FOREIGN KEY REFERENCES MsPenMaterial(PenMID) ON
    UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PurchaseQTY INT NOT NULL,
    PaymentType VARCHAR(255) NOT NULL
)
