BIF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'Example5')
   DROP DATABASE Example5
GO
ECREATE DATABASE Example5
GO
QUSE Example5
GO
--Tạo bảng Lớp học
ECREATE TABLE LopHoc (
   MaLopHoc INT PRIMARY KEY IDENTITY,
   TenLopHoc VARCHAR (10)
   (
GO

--Tạo bảng Sinh viên có khóa ngoại là cột MalopHoc, nối với bảng LopHoc
CREATE TABLE SinhVien(
   Maşv int PRIMARY KEY,
   TenSV varchar(40),
   MalopHoc int,
   CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc (MaLopHoc)
GO

--Tạo bảng SanPham với một cột NULL, một cột NOT NULL
CREATE TABLE SanPham (
   MASP int NOT NULL,
   TénP varchar(40) NULL
GO

--Tạo bảng với thuộc tính default cho cột Price
CREATE TABLE StoreProduct(
   ProductID int NOT NULL,
   Name varchar(40) NOT NULL,
   Price money NOT NULL DEFAULT (100)
GO
)

-- Thử kiểm tra xem giá trị default có được sử dụng hay không
INSERT INTO StoreProduct (ProductID, Name) VALUES (111, 'Rivets')
GO
SELECT * FROM StoreProduct
GO

--Tạo bảng ContactPhone với thuộc tính IDENTITY
CREATE TABLE ContactPhone (
   Person_ID int IDENTITY(500,1) NOT NULL,
   MobileNumber bigint NOT NULL
)
INSERT INTO ContactPhone (MobileNumber) VALUES (987123454
SELECT * FROM ContactPhone
GO
 
 --Tạo cột nhận dạng duy nhất tống thế
|CREATE TABLE CellularPhone(
   Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
   PersonName varchar(60) NOT NULL
)

--Chèn một record vào
INSERT INTO CellularPhone (PersonName) VALUES ( 'William Smith')
GO

--Kiểm tra giá trị của cột Person_ID tự động sinh
SELECT * FROM CellularPhone
GO

--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
CREATE TABLE ContactPhone
   Person_ID int PRIMARY KEY,
   MobileNumber bigint UNIQUE,
   ServiceProvider varchar(30),
   LandlineNumber bigint UNIQUE
)
--Chèn một record vào
INSERT INTO CellularPhone (PersonName) VALUES('William Smith')

GO

--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và LanlieNumber
INSERT INTO ContactPhone1 values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone1 values (102, 983345674, 'Alex', 12)
GO

--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
CREATE TABLE PhoneExpenses (
   Expense_ID int PRIMARY KEY,
   MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone (MobileNumber)
   Amount bigint CHECK (Amount >0)
GO

--Chỉnh sửa cột trong bảng
DALTER TABLE ContactPhone
   ALTER COLUMN ServiceProvider varchar(45)
GO

--Xóa cột trong báng
BALTER TABLE ContactPhone
    DROP COLUMN ServiceProvider
GO

--- Them một ràng buộc vào bảng
DALTER TABLE ContactPhone
   ADD CONSTRAINT CHK_RC CHECK (RentalCharges >0)
  I
GO

--Xóa một ràng buộc
DALTER TABLE Person.ContactPhone
   DROP CONSTRAINT CHK_RC




