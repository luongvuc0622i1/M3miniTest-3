CREATE DATABASE Minitest3;

USE Minitest3;

CREATE TABLE Supplies (
		suppliesId					INT					PRIMARY KEY NOT NULL,
		suppliesCode				VARCHAR(50)			NOT NULL,
        suppliesName				VARCHAR(50)			NOT NULL,
        suppliesUnit				VARCHAR(50),
        suppliesPrice				INT
);
    
CREATE TABLE Inventory (
		inventoryId					INT					PRIMARY	KEY NOT NULL,
        suppliesId					INT					NOT NULL,
        inventoryFirstAmount		INT,
        inventoryImportAmount		INT,
        inventoryExportAmount		INT,
        FOREIGN KEY	(suppliesId) REFERENCES Supplies (suppliesId)
);
    
CREATE TABLE Supplier (
		supplierId					INT					PRIMARY KEY	NOT NULL,
        supplierCode				VARCHAR(50)			NOT NULL,
        supplierName				VARCHAR(50)			NOT NULL,
        supplierAddress				VARCHAR(255),
        supplierPhone				INT
);
    
CREATE TABLE Orders (
		orderId						INT					PRIMARY	KEY NOT NULL,
        orderCode					VARCHAR(50)			NOT NULL,
        orderDate					DATETIME,
        supplierId					INT,
        FOREIGN KEY (supplierId) REFERENCES Supplier (supplierId)
);
    
CREATE TABLE EnterSlip (
		enterSlipId					INT					PRIMARY KEY NOT NULL,
        enterSlipCode				VARCHAR(50)			NOT NULL,
        enterSlipDate				DATETIME,
        orderId						INT,
        FOREIGN KEY (orderId) REFERENCES Orders (orderId)
);
    
CREATE TABLE ExportSlip (
		exportSlipId				INT					PRIMARY KEY NOT NULL,
        exportSlipCode				VARCHAR(50),
        exportSlipDate				DATETIME,
        exportSlip_Guest			VARCHAR(50)
);
    
CREATE TABLE OrderDetails (
		orderDetailsId				INT					PRIMARY KEY NOT NULL,
        orderId						INT,
        suppliesId					INT,
        OrderDetailsAmount			INT,
        FOREIGN KEY	(orderId) REFERENCES Orders (orderId),	
        FOREIGN KEY (suppliesId) REFERENCES Supplies (suppliesId)
);
    
CREATE TABLE EnterSlipDetails (
		enterSlipDetailsId			INT					PRIMARY KEY NOT NULL,
        enterSlipId					INT,
        suppliesId					INT,
        enterSlipDetailsAmount 		INT,
        enterSlipDetailsPrice		INT,
        enterSlipDetailsStatus		VARCHAR(255),
        FOREIGN KEY	(suppliesId) REFERENCES	Supplies (suppliesId),
        FOREIGN KEY (enterSlipId) REFERENCES EnterSlip (enterSlipId)
);
    
CREATE TABLE ExportSlipDetails (
		exportSlipDetailsId			INT					PRIMARY KEY NOT NULL,
        exportSlipId				INT,
        suppliesId					INT,
        exportSlipDetailsAmount		INT,
        exportSlipDetailsPrice		INT,
        exportSlipDetailsStatus	VARCHAR(255),
        FOREIGN KEY	(suppliesId) REFERENCES	Supplies (suppliesId),
        FOREIGN KEY (exportSlipId) REFERENCES ExportSlip (exportSlipId)
);