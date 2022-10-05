-- 1.	Display CustomerId, CustomerName, SalesTransactionDate, and Sales Transaction Quantity (obtained from the sum of quantity)
-- for every sales transaction which the transaction happened on the 25th day and the id of the pen is ‘PEN009’.

SELECT c.CustomerID, c.CustomerName, sh.SalesDate,[Sales Transaction Quantity] = SUM(sd.SalesQTY)
FROM MsCustomer c, SalesTransactionHeader sh, SalesTransactionDetail sd
WHERE c.CustomerID = sh.CustomerID AND sh.SalesID = sd.SalesID
	  AND DAY(SalesDate) = 25 AND PenID = 'PEN009'
GROUP BY c.CustomerID,CustomerName,SalesDate

--2. Display PenId, PenName, and Total of Pen Material (obtained from the count of pen material purchased) 
-- for every pen which has name starts with ‘Milky’ and the Total of Pen Material is more than 6.

SELECT p.PenID, p.PenName, [Total of Pen Material]= ph.PurchaseTotal
FROM MsPen p,MsPenMaterial pm, PurchaseTransactionHeader ph, PurchaseTransactionDetail pd
WHERE p.PenID = pm.PenID AND pm.PenMID = pd.PenMID AND pd.PurchaseID = ph.PurchaseID
	AND PenName = 'Milky%' AND PurchaseTotal > 6

-- 3.Display CustomerName, Sales Transaction Date (obtained from sales transaction date in ‘yyyy.mm.dd’), Total Pen Type (obtained from the count of pen purchased), and Total Quantity (obtained from the sum of quantity) 
-- for every sales transaction which the transaction happened on the 9th month and the Total Quantity is more than 10.

SELECT c.CustomerName, sh.SalesDate AS 'Sales Transaction Date',sh.SalesTotal AS 'Total Pen Type', SUM(sd.SalesQTY) AS 'Total Quantity'
FROM MsCustomer c, SalesTransactionHeader sh, SalesTransactionDetail sd
WHERE c.CustomerID = sh.CustomerID AND sh.SalesID = sd.SalesID
	  AND MONTH(SalesDate) = 09 
GROUP BY CustomerName, SalesDate, SalesTotal
HAVING SUM(sd.SalesQTY) > 10

--4.Display StaffName, Staff Gender (obtained from the first letter of staff’s gender), CustomerName, and Total Sales Transaction (obtained from the count of the sales transaction)
--for every sales transaction that happened on an even day and the sum of quantity is lower or equal to 10.

SELECT s.StaffName, SUBSTRING(s.StaffGender,1,1) AS 'Staff Gender', c.CustomerName, COUNT(sh.SalesID) AS 'Total Sales Transaction'
FROM MsStaff s, MsCustomer c, SalesTransactionHeader sh , SalesTransactionDetail sd
WHERE s.StaffID = sh.StaffID AND c.CustomerID = sh.CustomerID AND sh.SalesID = sd.SalesID
		AND DAY(SalesDate) % 2 = 0 
GROUP BY StaffName, StaffGender, CustomerName, sh.SalesID
HAVING SUM(sd.SalesQTY) <= 10

--5.	Display CustomerName (obtained from customer name in uppercase format), CustomerGender, and SalesTransactionId 
--for every sales transaction that happened on the 22th and the quantity is greater than the average quantity of all sales transaction. 
--The result query doesn’t have duplicate rows.
--(alias subquery)
SELECT CustomerName = UPPER(c.CustomerName), c.CustomerGender, sh.SalesID
FROM MsCustomer c, SalesTransactionHeader sh, SalesTransactionDetail sd,
(
	SELECT AVG(SalesQTY) as Average
	FROM SalesTransactionDetail
) AS AverageTable
WHERE c.CustomerID = sh.CustomerID AND sh.SalesID = sd.SalesID
	AND DAY(SalesDate) = 22 AND SalesQTY > Average
GROUP BY CustomerName, CustomerGender, sh.SalesID

--6.Display VendorName, PurchaseDate (obtained from purchases date in ‘Mon dd, yyyy’ format), and MaterialName (obtained from the material of pen name in lowercase format) 
-- for every purchase transaction with a pen material price is greater than the average price of all materials and the vendor’s name ends with ‘ Industry’.
--(alias subquery)

SELECT v.VendorName, PurchaseDate = FORMAT(ph.PurchaseDate, 'MMMM dd, yyyy' ), MaterialName = LOWER(pm.PenMName)
FROM MsVendor v, PurchaseTransactionHeader ph,PurchaseTransactionDetail pd, MsPenMaterial pm,
(
	SELECT AVG(PenMPrice) as Average
	FROM MsPenMaterial
) AS AverageTable
WHERE v.VendorID = ph.VendorID AND pm.PenMID = pd.PenMID AND pd.PurchaseID = ph.PurchaseID
	AND pm.PenMPrice > Average AND v.VendorName LIKE '% Industry'
ORDER BY VendorName ASC


-- 7.	Display Total Purchase Transaction (obtained from count of purchase transactions and ended with ‘ Transaction(s)’), VendorName, Staff Name (obtained from staff’s name from the first character until a character before space), and PurchaseTransactionDate 
--for every purchase transaction with the quantity is lower than the average quantity of all purchase transaction and the purchase transaction happened on Sunday.
--(alias subquery) 
SELECT CAST(COUNT(ph.PurchaseID) AS VARCHAR) + ' Transaction(s)' AS 'Total Puchase Transaction', v.VendorName, 
	StaffName = LEFT(s.StaffName, CASE WHEN charindex(' ', s.StaffName) = 0 
		THEN LEN(s.StaffName) 
		ELSE CHARINDEX(' ', s.StaffName) - 1 END),
	ph.PurchaseDate
FROM MsVendor v, MsStaff s, PurchaseTransactionHeader ph,
(
	SELECT AVG(PurchaseQTY) AS Average
	FROM PurchaseTransactionDetail
) AS AverageTable
WHERE v.VendorID = ph.VendorID AND s.StaffID = ph.StaffID 
	AND DATENAME(dw,PurchaseDate) = 'Sunday'
GROUP BY VendorName, StaffName, PurchaseDate

--8.Display VendorName, Transaction Date (obtained from purchases date in ‘dd mon yyyy’ format), PenMaterialName, and Material Number (obtained from PenMaterialId by replacing the first three characters with ‘PM’)
--for every purchase transaction with the pen material stock is greater than the average of all pen material stock and the total price (obtained from the sum of transaction quantity multiplied with pen material price) is greater than 500000. Sort the result by vendor name in descending order.
--(alias subquery) 

SELECT v.VendorName, FORMAT(ph.PurchaseDate, 'dd MMMM yyyy' ) AS 'Transaction Date', pm.PenMName, REPLACE(pm.PenMID,'PML','PM') AS 'Material Number'
FROM MsVendor v, PurchaseTransactionHeader ph, MsPenMaterial pm, PurchaseTransactionDetail pd,
(	
	SELECT AVG(PenMStock) as Average
	FROM MsPenMaterial
) as AverageTable
WHERE v.VendorID = ph.VendorID AND pm.PenMID = pd.PenMID AND ph.PurchaseID = pd.PurchaseID
	AND pd.PurchaseQTY > Average
GROUP BY VendorName, PurchaseDate, PenMName, pm.PenMID
HAVING SUM(pd.PurchaseQTY * pm.PenMPrice) > 500000
ORDER BY VendorName DESC

--9. Create a view named ‘ViewSalesTransaction’ to display StaffName, CustomerName, Total Sales Transaction (obtained from the count of sales transaction), and Maximum Sales (obtained from the maximum of quantity) 
--for every sales transaction made by a customer whose name contains ‘c’ and the Total Sales Transaction is greater than 2.

CREATE VIEW ViewSalesTransaction AS 
SELECT s.StaffName, c.CustomerName, COUNT(sh.SalesID) AS 'Total Sales Transaction', MAX(sd.SalesQTY) AS 'Maximum Sales'
FROM MsStaff s, MsCustomer c, SalesTransactionHeader sh, SalesTransactionDetail sd
WHERE s.StaffID = sh.StaffID AND c.CustomerID = sh.CustomerID AND sh.SalesID = sd.SalesID 
	AND CustomerName LIKE '%c%' 
GROUP BY StaffName, CustomerName
HAVING COUNT(sh.SalesID) > 2

--10.	Create a view named ‘ViewPurchaseDetail’ to display VendorName, Total Purchase Quantity (obtained from the sum of quantity), and Total Purchase Transaction (obtained from the count of purchase transaction)
--for every staff whose gender is male, and the Total Purchase Transaction is greater than 1.

CREATE VIEW ViewPurchaseDetail AS
SELECT v.VendorName, SUM(pd.PurchaseQTY) AS 'Total Purchase Quantity', COUNT(ph.PurchaseID) AS 'Total Purchase Transaction'
FROM MsVendor v, PurchaseTransactionDetail pd, PurchaseTransactionHeader ph, MsStaff s
WHERE v.VendorID = ph.VendorID AND ph.PurchaseID = pd.PurchaseID AND s.StaffID = ph.StaffID
	AND s.StaffGender LIKE 'Male' 
GROUP BY VendorName
HAVING COUNT(ph.PurchaseID) > 1

