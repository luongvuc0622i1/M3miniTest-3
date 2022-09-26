USE Minitest3;

-- SELECT * FROM Supplies;
-- SELECT * FROM Inventory;
-- SELECT * FROM Supplier;
-- SELECT * FROM Orders;
SELECT * FROM EnterSlip;
-- SELECT * FROM ExportSlip;
-- SELECT * FROM OrderDetails;
-- SELECT * FROM EnterSlipDetails;
-- SELECT * FROM ExportSlipDetails;

-- Tạo các view sau
-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW view_EnterSlipDetails AS
SELECT 	EnSD.enterSlipDetailsId, EnSD.suppliesId, EnSD.enterSlipDetailsAmount, EnSD.enterSlipDetailsPrice, (EnSD.enterSlipDetailsAmount * EnSD.enterSlipDetailsPrice) AS 'Money'
FROM 	EnterSlipDetails EnSD;

SELECT * FROM view_EnterSlipDetails;

-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW view_EnterSlipDetails_Supplies AS
SELECT 	EnSD.enterSlipDetailsId, EnSD.suppliesId, S.suppliesName, EnSD.enterSlipDetailsAmount, EnSD.enterSlipDetailsPrice, (EnSD.enterSlipDetailsAmount * EnSD.enterSlipDetailsPrice) AS 'Money'
FROM 	EnterSlipDetails EnSD JOIN Supplies S
ON 		EnSD.suppliesId = S.suppliesId;

SELECT * FROM view_EnterSlipDetails_Supplies;

-- Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW view_EnterSlipDetails_Supplies_EnterSlip AS
SELECT 	EnSD.enterSlipDetailsId, EnS.enterSlipDate, EnS.enterSlipId, EnSD.suppliesId, S.suppliesName, EnSD.enterSlipDetailsAmount, EnSD.enterSlipDetailsPrice, (EnSD.enterSlipDetailsAmount * EnSD.enterSlipDetailsPrice) AS 'Money'
FROM 	EnterSlipDetails EnSD JOIN Supplies S
ON 		EnSD.suppliesId = S.suppliesId
JOIN 	EnterSlip EnS
ON 		EnSD.enterSlipId = EnS.enterSlipId;

SELECT * FROM view_EnterSlipDetails_Supplies_EnterSlip;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW view_EnterSlipDetails_Supplies_EnterSlip_Order AS
SELECT 	EnSD.enterSlipDetailsId, EnS.enterSlipDate, EnS.enterSlipId, EnSD.suppliesId, S.suppliesName, EnSD.enterSlipDetailsAmount, O.SupplierId, EnSD.enterSlipDetailsPrice, (EnSD.enterSlipDetailsAmount * EnSD.enterSlipDetailsPrice) AS 'Money'
FROM 	EnterSlipDetails EnSD JOIN Supplies S
ON 		EnSD.suppliesId = S.suppliesId
JOIN 	EnterSlip EnS
ON 		EnSD.enterSlipId = EnS.enterSlipId
JOIN 	Orders O
ON 		EnS.orderId = O.orderId;

SELECT * FROM view_EnterSlipDetails_Supplies_EnterSlip_Order;

-- Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 50.
CREATE VIEW view_EnterSlipDetails_Select AS
SELECT 	EnSD.enterSlipDetailsId, EnSD.suppliesId, EnSD.enterSlipDetailsAmount, EnSD.enterSlipDetailsPrice, (EnSD.enterSlipDetailsAmount * EnSD.enterSlipDetailsPrice) AS 'Money'
FROM 	EnterSlipDetails EnSD
WHERE 	EnSD.enterSlipDetailsAmount > 50;

SELECT * FROM view_EnterSlipDetails_Select;

-- Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Gam.
CREATE VIEW view_EnterSlipDetails_Supplies_Select AS
SELECT 	EnSD.enterSlipDetailsId, EnSD.suppliesId, S.suppliesName, EnSD.enterSlipDetailsAmount, EnSD.enterSlipDetailsPrice, (EnSD.enterSlipDetailsAmount * EnSD.enterSlipDetailsPrice) AS 'Money'
FROM 	EnterSlipDetails EnSD JOIN Supplies S
ON 		EnSD.suppliesId = S.suppliesId
WHERE	S.suppliesUnit = 'Gam';

SELECT * FROM view_EnterSlipDetails_Supplies_Select;

-- Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW view_ExportSlipDetails AS
SELECT 	ExSD.exportSlipDetailsId, ExSD.suppliesId, ExSD.exportSlipDetailsAmount, ExSD.exportSlipDetailsPrice, (ExSD.exportSlipDetailsAmount * ExSD.exportSlipDetailsPrice) AS 'Money'
FROM 	ExportSlipDetails ExSD;

SELECT * FROM view_ExportSlipDetails;

-- Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW view_ExportSlipDetails_Supplies AS
SELECT 	ExSD.exportSlipDetailsId, ExSD.suppliesId, S.suppliesName, ExSD.exportSlipDetailsAmount, ExSD.exportSlipDetailsPrice
FROM 	ExportSlipDetails ExSD JOIN Supplies S
ON 		ExSD.suppliesId = S.suppliesId;

SELECT * FROM view_ExportSlipDetails_Supplies;

-- Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW view_ExportSlipDetails_Supplies_ExportSlip AS
SELECT 	ExSD.exportSlipDetailsId, ExS.exportSlip_Guest, ExSD.suppliesId, S.suppliesName, ExSD.exportSlipDetailsAmount, ExSD.exportSlipDetailsPrice
FROM 	ExportSlipDetails ExSD JOIN Supplies S
ON 		ExSD.suppliesId = S.suppliesId
JOIN 	ExportSlip ExS
ON 		ExSD.exportSlipId = ExS.exportSlipId;

SELECT * FROM view_ExportSlipDetails_Supplies_ExportSlip;