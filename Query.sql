CREATE DATABASE Quan_Ly_Quan_Cafe
GO

USE Quan_Ly_Quan_Cafe
GO

CREATE TABLE Ban
(
	id INT IDENTITY PRIMARY KEY,
	Ten NVARCHAR(100),
	TrangThai NVARCHAR(100) DEFAULT N'Trống',
)
GO

CREATE TABLE Loai
(
	id INT IDENTITY PRIMARY KEY,
	Ten NVARCHAR(100)
)
GO

CREATE TABLE TaiKhoan
(
	TenTK NVARCHAR(100) NOT NULL PRIMARY KEY,
	TenHienThi NVARCHAR(1000) NOT NULL,
	MatKhau NVARCHAR(100) NOT NULL,
	LoaiTK BIT DEFAULT 0 -- 0: nhân viên, 1: admin
)
GO

CREATE TABLE Nuoc
(
	id INT IDENTITY PRIMARY KEY,
	Ten NVARCHAR(100) NOT NULL,
	idLoai INT,
	Gia FLOAT NOT NULL DEFAULT 0,
	FOREIGN KEY (idLoai) REFERENCES Loai(id)	
)
GO

CREATE TABLE HoaDon
(
	id INT IDENTITY PRIMARY KEY,
	NgayVao DATE DEFAULT GETDATE(),
	NgayRa DATE,
	TrangThai BIT DEFAULT 0, -- 0: Chưa thanh toán, 1: Đã thanh toán
	idBan int,
	FOREIGN KEY (idBan) REFERENCES Ban(id)
)
GO

CREATE TABLE ChiTietHD
(
	id int IDENTITY PRIMARY KEY,
	idHD int,
	idNuoc int,
	SoLuong int DEFAULT 0,
	FOREIGN KEY (idHD) REFERENCES HoaDon(id),
	FOREIGN KEY (idNuoc) REFERENCES Nuoc(id)
)

GO

INSERT INTO TaiKhoan(TenTK, TenHienThi, MatKhau, LoaiTK)
VALUES(N'Nguyễn Thị Thuý Nga', N'Nguyễn Thị Thuý Nga',N'admin',1);
GO

INSERT INTO TaiKhoan(TenTK, TenHienThi, MatKhau, LoaiTK)
VALUES(N'Trần Trung Kiên', N'Trần Trung Kiên',N'staff',0);
GO

CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS 
BEGIN
	SELECT * FROM TaiKhoan WHERE TenTK = @userName
END
GO

EXEC dbo.USP_GetAccountByUserName @userName = N'Nguyễn Thị Thuý Nga' -- nvarchar(100)
GO

CREATE PROC USP_Login
@userName nvarchar(100), @pass nvarchar(100)
AS
BEGIN
	SELECT * FROM TaiKhoan WHERE TenTK = @userName AND MatKhau = @pass
END
GO

EXEC USP_Login @userName = N'Nguyễn Thị Thuý Nga' , @pass = N'admin' 
GO

INSERT INTO Ban (Ten) VALUES(N'Bàn 1')
INSERT INTO Ban (Ten) VALUES(N'Bàn 2')
INSERT INTO Ban VALUES(N'Bàn 3',N'Có người')
INSERT INTO Ban (Ten) VALUES(N'Bàn 4')
INSERT INTO Ban (Ten) VALUES(N'Bàn 5')
INSERT INTO Ban (Ten) VALUES(N'Bàn 6')
INSERT INTO Ban (Ten) VALUES(N'Bàn 7')
INSERT INTO Ban VALUES(N'Bàn 8',N'Có người')
INSERT INTO Ban (Ten) VALUES(N'Bàn 9')
INSERT INTO Ban VALUES(N'Bàn 10',N'Có người')
INSERT INTO Ban (Ten) VALUES(N'Bàn 11')
INSERT INTO Ban (Ten) VALUES(N'Bàn 12')
INSERT INTO Ban (Ten) VALUES(N'Bàn 13')
INSERT INTO Ban (Ten) VALUES(N'Bàn 14')
INSERT INTO Ban VALUES(N'Bàn 15',N'Có người')
INSERT INTO Ban (Ten) VALUES(N'Bàn 16')
INSERT INTO Ban (Ten) VALUES(N'Bàn 17')
INSERT INTO Ban (Ten) VALUES(N'Bàn 18')
INSERT INTO Ban (Ten) VALUES(N'Bàn 19')
INSERT INTO Ban (Ten) VALUES(N'Bàn 20')
GO 

--thêm nhóm nước uống
INSERT INTO Loai (Ten) VALUES(N'Trà - Cafe')
INSERT INTO Loai (Ten) VALUES(N'Nước ép')
INSERT INTO Loai (Ten) VALUES(N'Sinh tố')
INSERT INTO Loai (Ten) VALUES(N'Kem')
INSERT INTO Loai (Ten) VALUES(N'Bia - Coke')

--thêm nước nhóm 1
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Cafe đen',1,11000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Cafe đá',1,15000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Cafe sữa đá',1,20000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Cafe sữa nóng',1,22000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sữa tươi',1,24000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Bạc xỉu',1,22000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Cacao đá',1,20000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Cacao nóng',1,18000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Trà Lipton',1,18000)

-- thêm nước nhóm 2
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Nước ép táo',2,29000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Nước ép cà rốt',2,29000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Nước ép dưa hấu',2,29000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Nước ép cà chua',2,29000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Nước ép dâu',2,29000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Cam vắt',2,29000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Chanh dây',2,29000)

-- thêm nước nhóm 3

INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sinh tố dâu',3,35000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sinh tố dưa hấu',3,35000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sinh tố xoài',3,35000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sinh tố bơ',3,35000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sinh mãn cầu',3,35000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sinh tố đu đủ',3,35000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sinh tố mít',3,35000)

-- thêm nước nhóm 4
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Kem ly',4,30000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sữa chua cafe',4,20000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sữa chua bạc xỉu',4,20000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sữa chua dâu',4,20000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sữa chua việt quất',4,20000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sữa ngô',4,15000)

-- thêm nước nhóm 5
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Bia Sài Gòn',5,19000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Bia Tiger',5,19000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Coca cola',5,13000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Pepsi',5,13000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Sting',5,13000)
INSERT INTO Nuoc(Ten, idLoai, Gia) 
VALUES(N'Red Bull',5,15000)

-- thêm bill
INSERT INTO HoaDon (NgayVao, NgayRa,TrangThai, idBan )
VALUES (GETDATE(), NULL, 0, 1)
INSERT INTO HoaDon (NgayVao, NgayRa,TrangThai, idBan )
VALUES (GETDATE(), NULL, 0, 3)

-- thêm chi tiết cho hoá đơn 
INSERT INTO ChiTietHD (idHD, idNuoc, SoLuong)
VALUES (1, 3, 1)
INSERT INTO ChiTietHD (idHD, idNuoc, SoLuong)
VALUES (1, 1, 1)
INSERT INTO ChiTietHD (idHD, idNuoc, SoLuong)
VALUES (2, 5, 1)
INSERT INTO ChiTietHD (idHD, idNuoc, SoLuong)
VALUES (2, 16, 1)

CREATE PROC USP_InsertBill
@idBan INT
AS
BEGIN
	INSERT INTO HoaDon (NgayVao, NgayRa,TrangThai, idBan )
	VALUES (GETDATE(), NULL, 0, @idBan)
END
GO

CREATE PROC USP_InsertBillInFo
@idHD INT, @idNuoc INT, @SL INT
AS
BEGIN
	INSERT INTO ChiTietHD (idHD, idNuoc, SoLuong)
	VALUES (@idHD, @idNuoc, @SL)
END
GO

ALTER PROC USP_InsertBillInFo
@idBill INT, @idDrink INT, @count INT
AS
BEGIN
	DECLARE @isBillInfo INT
	DECLARE @drinkCount INT = 1
	
	SELECT @isBillInfo = id, @drinkCount = SoLuong 
	FROM ChiTietHD
	WHERE idHD = @idBill AND idNuoc = @idDrink
	
	IF(@isBillInfo > 0)
	BEGIN
		DECLARE @new_count INT = @drinkCount + @count
		IF(@new_count > 0)
			UPDATE ChiTietHD SET SoLuong = @drinkCount + @count
			WHERE idNuoc = @idDrink 
		ELSE 
			DELETE ChiTietHD WHERE idHD = @idBill AND idNuoc = @idDrink
	END
	ELSE
	BEGIN 
		INSERT INTO ChiTietHD (idHD, idNuoc, SoLuong)
		VALUES (@idBill, @idDrink, @count)
	END	
END
GO


CREATE TRIGGER UTG_UpdateBillInfo
ON ChiTietHD FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = idHD FROM Inserted
	
	DECLARE @idTable INT
	
	SELECT @idTable = idBan FROM HoaDon WHERE id = @idBill AND TrangThai = 0
	
	UPDATE Ban SET TrangThai = N'Có người' WHERE id = @idTable
END
GO

CREATE TRIGGER UTG_UpdateBill
ON HoaDon FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = id FROM Inserted	
	
	DECLARE @idTable INT
	
	SELECT @idTable = idBan FROM HoaDon WHERE id = @idBill
	
	DECLARE @count int = 0
	
	SELECT @count = COUNT(*) FROM HoaDon WHERE idBan = @idTable AND TrangThai = 0
	
	IF (@count = 0)
		UPDATE Ban SET TrangThai = N'Trống' WHERE id = @idTable
END
GO

CREATE TRIGGER UTG_DeleteBillInfo
ON ChiTietHD FOR DELETE
AS 
BEGIN
	DECLARE @idBillInfo INT
	DECLARE @idBill INT
	SELECT @idBillInfo = id, @idBill = Deleted.idHD FROM Deleted
	
	DECLARE @idTable INT
	SELECT @idTable = idBan FROM HoaDon WHERE id = @idBill
	
	DECLARE @count INT = 0
	
	SELECT @count = COUNT(*) FROM ChiTietHD AS bi, HoaDon AS b WHERE b.id = bi.idHD AND b.id = @idBill AND b.TrangThai = 0
	
	IF (@count = 0)
		UPDATE Ban SET TrangThai = N'Trống' WHERE id = @idTable
END
GO






