USE Minitest3;

-- Nhập 5 bản ghi bảng Vật tư
INSERT INTO Supplies VALUES
		(001, 'VT01', 'Sắt', 'Kg', 300),
		(002, 'VT02', 'Nhôm', 'Kg', 500),
		(003, 'VT03', 'Đồng', 'Gam', 700),
		(004, 'VT04', 'Bạc', 'Gam', 1000),
		(005, 'VT05', 'Vàng', 'Cây', 2000);

-- Nhập 5 bản ghi bảng Tồn kho
INSERT INTO Inventory VALUES
		(101, 001, 300, 1000, 500),
		(102, 002, 250, 500, 500),
		(103, 003, 100, 200, 150),
		(104, 004, 50, 50, 20),
		(105, 005, 20, 50, 10);
        
-- Nhập 3 nhà cung cấp
INSERT INTO Supplier VALUES
		(201, 'NCC01', 'Công ty TNHH Đông Bắc', 'Cẩm Phả', 111111111),
		(202, 'NCC02', 'Công ty TNHH Việt Dũng', 'Vân Đồn', 222222222),
		(203, 'NCC03', 'Công ty TNHH KCN Quảng Ninh', 'Hạ Long', 333333333);

-- Nhập 3 đơn hàng
INSERT INTO Orders VALUES
		(301, 'DDH01', '2022-1-24', 201),
		(302, 'DDH02', '2022-5-24', 202),
		(303, 'DDH03', '2022-9-24', 203);

-- Nhập 3 phiếu nhập
INSERT INTO EnterSlip VALUES
		(401, 'PN01', '2022-2-1', 301),
		(402, 'PN02', '2022-6-1', 302),
		(403, 'PN03', '2022-10-1', 303);

-- Nhập 3 phiếu xuất 
INSERT INTO ExportSlip VALUES
		(501, 'PX01', '2021-12-30', 'Vàng Bạc Kim Oanh'),
		(502, 'PX02', '2022-4-30', 'Đá Quý Cảnh Liễu'),
		(503, 'PX03', '2022-8-30', 'Cửa hàng Bán lẻ Dung Vuông');

-- Nhập 6 CT Đơn hàng
INSERT INTO OrderDetails VALUES
		(601, 301, 001, 1000),
		(602, 301, 002, 500),
		(603, 302, 003, 200),
		(604, 302, 004, 50),
		(605, 303, 005, 50);

-- Nhập 6 CT Phiếu nhập
INSERT INTO EnterSlipDetails VALUES
		(701, 401, 001, 1000, 200, 'Đã thanh toán'),
		(702, 401, 002, 500, 400, 'Đã thanh toán'),
		(703, 402, 003, 200, 600, 'Đã thanh toán'),
		(704, 402, 004, 50, 900, 'Chưa thanh toán'),
		(705, 403, 005, 50, 1800, 'Chưa thanh toán');

-- Nhập 6 CT Phiếu xuất
INSERT INTO ExportSlipDetails VALUES
		(801, 501, 001, 500, 300, 'Đã thanh toán'),
		(802, 501, 002, 500, 500, 'Đã thanh toán'),
		(803, 502, 003, 150, 700, 'Đã thanh toán'),
		(804, 502, 004, 20, 1000, 'Đã thanh toán'),
		(805, 503, 005, 10, 2000, 'Đã thanh toán');