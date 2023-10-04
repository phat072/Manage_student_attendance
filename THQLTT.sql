CREATE DATABASE QL_DIEMDANH;
USE QL_DIEMDANH;
GO

DROP DATABASE QL_DIEMDANH


CREATE TABLE LOP
( 
    MALOP CHAR(10) PRIMARY KEY,
    TENLOP NVARCHAR(30),
    SISO INT,
	SOBUOI INT
);
GO
CREATE TABLE SINHVIEN
( 
    MSSV CHAR(8) PRIMARY KEY,
    TENSV NVARCHAR(30) NOT NULL, 
    SDT VARCHAR(10),
    NGAYSINH DATE,
    GIOITINH NVARCHAR(4),
    MALOP CHAR(10)
);

ALTER TABLE SINHVIEN ADD CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP);

CREATE TABLE BUOIHOC
( 
    MABUOI INT,
    MALOP CHAR(10),
    TGBD TIME,
    TGKT TIME,
    NGAYHOC DATE,
	PRIMARY KEY(MABUOI, MALOP)
);  
ALTER TABLE BUOIHOC ADD CONSTRAINT FK_BH_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP);

CREATE TABLE DIEMDANH
( 
    MABUOI INT,
	MALOP CHAR(10),
    MSSV CHAR(8),
    TGCOMAT TIME NULL,
    GHICHU NVARCHAR(30) NULL,
    PRIMARY KEY(MALOP, MSSV, MABUOI)
);
ALTER TABLE DIEMDANH ADD 
CONSTRAINT FK_DD_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP),
CONSTRAINT FK_DD_SV FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
CONSTRAINT FK_DD_BH FOREIGN KEY (MABUOI, MALOP) REFERENCES BUOIHOC(MABUOI, MALOP);

-- Dữ liệu mẫu cho bảng "LOP"

INSERT INTO LOP (MALOP, TENLOP, SISO, SOBUOI)
VALUES 
    ('L001', N'Lớp A', 30, 18),
    ('L002', N'Lớp B', 25, 22),
    ('L003', N'Lớp C', 20, 20),
	('L004', N'Lớp D', 28, 16),
    ('L005', N'Lớp E', 32, 20),
    ('L006', N'Lớp F', 27, 24),
	('L007', N'Lớp G', 30, 26),
    ('L008', N'Lớp H', 30, 18),
	('L009', N'Lớp K', 32, 27);
GO
SELECT * FROM LOP 

SET DATEFORMAT YMD

-- Dữ liệu mẫu cho bảng "SINHVIEN"
GO
INSERT INTO SINHVIEN (MSSV, TENSV, SDT, NGAYSINH, GIOITINH, MALOP)
VALUES
    ('SV001', N'Nguyễn Văn A', '0123456789', '2000-01-01', N'Nam', 'L001'),
    ('SV002', N'Trần Thị B', '0987654321', '2000-02-02', N'Nữ', 'L002'),
    ('SV003', N'Lê Văn C', '0123456789', '2000-03-03', N'Nam', 'L002'),
	('SV004', N'Nguyễn Thị D', '0123456789', '2000-04-04', N'Nữ', 'L004'),
    ('SV005', N'Trần Văn E', '0987654321', '2000-05-05', N'Nam', 'L005'),
	('SV006', N'Trần Lê Anh F', '0754266321', '2002-07-02', N'Nam', 'L005');
-- Dữ liệu mẫu cho bảng "BUOIHOC"
INSERT INTO BUOIHOC (MABUOI, MALOP, TGBD, TGKT, NGAYHOC)
VALUES
    (1, 'L001', '08:00:00', '10:00:00', '2023-05-01'),
    (2, 'L001', '10:30:00', '12:30:00', '2023-05-02'),
	(2, 'L002', '10:30:00', '12:30:00', '2023-05-02'),
    (1, 'L002', '13:30:00', '15:30:00', '2023-05-03'),
	(2, 'L003', '08:00:00', '10:00:00', '2023-05-04'),
    (3, 'L001', '10:30:00', '12:30:00', '2023-05-05'),
	(3, 'L002', '10:30:00', '12:30:00', '2023-05-06'),
	(3, 'L003', '10:30:00', '12:30:00', '2023-05-06'),
	(4, 'L001', '10:30:00', '12:30:00', '2023-05-07'),
	(4, 'L002', '10:30:00', '12:30:00', '2023-05-08'),
	(4, 'L003', '10:30:00', '12:30:00', '2023-05-08'),
	(4, 'L004', '10:30:00', '12:30:00', '2023-05-09'),
	(5, 'L001', '10:30:00', '12:30:00', '2023-05-10'),
	(5, 'L002', '10:30:00', '12:30:00', '2023-05-11'),
	(5, 'L003', '10:30:00', '12:30:00', '2023-05-12'),
	(5, 'L004', '10:30:00', '12:30:00', '2023-05-13'),
	(6, 'L001', '08:00:00', '10:00:00', '2023-05-01'),
    (6, 'L002', '10:30:00', '12:30:00', '2023-05-02'),
    (7, 'L001', '13:30:00', '15:30:00', '2023-05-03'),
	(6, 'L003', '08:00:00', '10:00:00', '2023-05-04'),
    (7, 'L002', '10:30:00', '12:30:00', '2023-05-05'),
	(8, 'L001', '10:30:00', '12:30:00', '2023-05-06'),
	(8, 'L002', '10:30:00', '12:30:00', '2023-05-07'),
	(8, 'L003', '10:30:00', '12:30:00', '2023-05-08'),
	(9, 'L001', '10:30:00', '12:30:00', '2023-05-09'),
	(9, 'L002', '10:30:00', '12:30:00', '2023-05-10'),
	(9, 'L003', '10:30:00', '12:30:00', '2023-05-11'),
	(10, 'L001', '10:30:00', '12:30:00', '2023-05-12'),
	(10, 'L002', '10:30:00', '12:30:00', '2023-05-13'),
	(11, 'L001', '10:30:00', '12:30:00', '2023-05-10'),
	(12, 'L001', '10:30:00', '12:30:00', '2023-05-10');


SELECT* FROM DIEMDANH

-- Dữ liệu mẫu cho bảng "DIEMDANH"
INSERT INTO DIEMDANH (MALOP, MABUOI, MSSV, TGCOMAT, GHICHU)
VALUES
    ('L001', 1, 'SV001', '08:05:00', 'L'),
    ('L002', 1, 'SV002', '08:07:00', 'L'),
    ('L001', 2, 'SV001', '10:35:00', 'L'),
    ('L002', 2, 'SV002', '10:50:00', 'L'),
    ('L002', 2, 'SV003', '10:33:00', 'P'),
	('L001', 4, 'SV004', '09:00:00', 'A'),
    ('L002', 4, 'SV005', ' ', 'UA'),
    ('L003', 5, 'SV005', '10:34:00', 'P');

GO
---TRIGGER
CREATE TRIGGER Check_sv ON SINHVIEN
AFTER INSERT 
AS
BEGIN
    -- Kiểm tra sĩ số tối đa của lớp
    DECLARE @Siso_max INT
    SELECT @Siso_max = SISO FROM LOP WHERE MALOP IN (SELECT MALOP FROM INSERTED)
    
    DECLARE @Tong_sv INT
    SELECT @Tong_sv = COUNT(*) FROM SINHVIEN WHERE MALOP IN (SELECT MALOP FROM INSERTED)
    
    IF (@Tong_sv > @Siso_max)
    BEGIN
        -- Quá giới hạn sĩ số tối đa, rollback transaction và in thông báo lỗi
        ROLLBACK TRANSACTION;
        RAISERROR ('Sĩ số của lớp đã vượt quá giới hạn tối đa', 16, 1);
    END
END;

INSERT INTO LOP (MALOP, TENLOP, SISO, SOBUOI)
VALUES 
    ('L011', N'Lớp ABC', 10, 18)

--test--
INSERT INTO SINHVIEN (MSSV, TENSV, SDT, NGAYSINH, GIOITINH, MALOP)
VALUES
    ('SV011', N'Nguyễn Văn A', '0123456789', '2000-01-01', N'Nam', 'L011'),
    ('SV012', N'Trần Thị B', '0987654321', '2000-02-02', N'Nữ', 'L011'),
    ('SV013', N'Lê Văn C', '0123456789', '2000-03-03', N'Nam', 'L011'),
	('SV014', N'Nguyễn Thị D', '0123456789', '2000-04-04', N'Nữ', 'L011'),
    ('SV015', N'Trần Văn E', '0987654321', '2000-05-05', N'Nam', 'L011'),
	('SV016', N'Nguyễn Trần Anh Quân', '0754266321', '2002-07-02', N'Nam', 'L011'),
	('SV022', N'Phan Lê Quang', '0754266321', '2002-07-02', N'Nam', 'L011'),
	('SV017', N'Nguyễn Thị Thìn', '0754266321', '2002-07-02', N'Nam', 'L011'),
	('SV018', N'Nguyễn Đức Huy', '0754266321', '2002-07-02', N'Nam', 'L011'),
	('SV019', N'Nguyễn Trần Luffy', '0754266321', '2002-07-02', N'Nam', 'L011')
INSERT INTO SINHVIEN (MSSV, TENSV, SDT, NGAYSINH, GIOITINH, MALOP)
VALUES
	('SV020', N'Trần Lê Anh F', '0754266321', '2002-07-02', N'Nam', 'L011'),
	('SV021', N'Trần Lê Anh F', '0754266321', '2002-07-02', N'Nam', 'L011')

DELETE FROM SINHVIEN WHERE MALOP = 'L011'

DROP TRIGGER Check_sv

----------------------------------------------******----------------------------------------------

--Trigger về việc update trạng thái của sinh viên khi tham gia tiết học

CREATE TRIGGER Check_dd ON DIEMDANH
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE dd
    SET dd.GHICHU = 
		CASE
			WHEN dd.TGCOMAT = '00:00:00' THEN 'UA'-- Set thời gian đi học là không tức là sinh viên không có đi học
            WHEN dd.TGCOMAT <= bh.TGBD THEN 'P'           
			WHEN dd.TGCOMAT > bh.TGBD AND dd.TGCOMAT < DATEADD(MINUTE, 45, bh.TGBD) THEN 'L'
            WHEN dd.TGCOMAT >= DATEADD(MINUTE, 45, bh.TGBD) THEN 'UA'	
        END
    FROM DIEMDANH dd
    INNER JOIN BUOIHOC bh ON dd.MALOP = bh.MALOP AND dd.MABUOI = bh.MABUOI
    INNER JOIN INSERTED i ON dd.MALOP = i.MALOP AND dd.MSSV = i.MSSV AND dd.MABUOI = i.MABUOI
END;

--Tạo lớp học Jan
INSERT INTO LOP (MALOP, TENLOP, SISO, SOBUOI)
VALUES 
    ('L010', N'Lớp JAN', 12, 20)

--Buổi học jan hằng ngày
INSERT INTO BUOIHOC (MABUOI, MALOP, TGBD, TGKT, NGAYHOC)
VALUES
    (1, 'L010', '08:15:00', '11:00:00', '2023-05-01')

INSERT INTO DIEMDANH (MALOP, MABUOI, MSSV, TGCOMAT, GHICHU)
VALUES
    ('L010', 1, 'SV002', '08:05:00', ' '), --Phát đi học đúng giờ
	('L010', 1, 'SV003', '08:21:00', ' '), --Huy đi học muộn
	('L010', 1, 'SV004', '08:59:59', ' '), --Khoa đi học muộn
	('L010', 1, 'SV005', '09:00:00', ' '),  --Chí UA
	('L010', 1, 'SV001', ' ',' ')
DELETE FROM DIEMDANH WHERE MALOP = 'L010'

SELECT * FROM DIEMDANH
WHERE MALOP = 'L010'
DROP TRIGGER Check_dd 



----------------------------------------------******----------------------------------------------



-- Tạo bảng DANHSACHTHI để lưu thông tin sinh viên bị cấm thi
CREATE TABLE DANHSACHTHI
(
	MSSV CHAR(8),
	MALOP CHAR(10),
	TINHTRANG NVARCHAR(30)
	PRIMARY KEY(MSSV, MALOP)
);
--Trigger về việc cấm thi cho những sinh viên đi học muộn
GO
CREATE TRIGGER Camthi_CK ON DIEMDANH
AFTER INSERT, UPDATE 
AS
BEGIN
    -- Cập nhật thông tin cấm thi cho tất cả sinh viên và lớp học trong bảng "DIEMDANH"
    UPDATE DANHSACHTHI
    SET TINHTRANG = CASE
                        WHEN d.TONGBUOIVANG >= l.SOBUOI * 0.3 THEN N'Bị cấm thi cuối kì'
                        ELSE N'Được thi cuối kì'
                    END
    FROM DANHSACHTHI dst
    INNER JOIN (
        SELECT dd.MSSV, dd.MALOP, SUM(
            CASE 
                WHEN dd.GHICHU = 'L' THEN 0.5
                WHEN dd.GHICHU = 'A' OR dd.GHICHU = 'UA' THEN 1
                ELSE 0
            END
        ) AS TONGBUOIVANG
        FROM DIEMDANH dd
        GROUP BY dd.MSSV, dd.MALOP
    ) d ON dst.MSSV = d.MSSV AND dst.MALOP = d.MALOP
    INNER JOIN LOP l ON dst.MALOP = l.MALOP;

    -- Thêm mới các sinh viên và lớp học chưa có trong bảng "DANHSACHTHI"
    INSERT INTO DANHSACHTHI (MSSV, MALOP, TINHTRANG)
    SELECT d.MSSV, d.MALOP, CASE
                                WHEN d.TONGBUOIVANG >= l.SOBUOI * 0.3 THEN N'Bị cấm thi cuối kì'
                                ELSE N'Được thi cuối kì'
							END
    FROM (
        SELECT dd.MSSV, dd.MALOP, SUM(
            CASE 
                WHEN dd.GHICHU = 'L' THEN 0.5
                WHEN dd.GHICHU = 'A' OR dd.GHICHU = 'UA' THEN 1
                ELSE 0
            END
        ) AS TONGBUOIVANG
        FROM DIEMDANH dd
        GROUP BY dd.MSSV, dd.MALOP
    ) d
    INNER JOIN LOP l ON d.MALOP = l.MALOP
    LEFT JOIN DANHSACHTHI dst ON d.MSSV = dst.MSSV AND d.MALOP = dst.MALOP
    WHERE dst.MSSV IS NULL;
END;

INSERT INTO DIEMDANH (MALOP, MABUOI, MSSV, TGCOMAT, GHICHU)
VALUES
    ('L001', 3, 'SV001', '09:05:00', 'A'),
    ('L001', 4, 'SV001', '09:07:00', 'A'),
    ('L001', 5, 'SV001', '10:35:00', 'A'),
    ('L001', 6, 'SV001', '10:50:00', 'A'),
    ('L001', 7, 'SV001', '10:33:00', 'A'),
	('L001', 8, 'SV001', '09:00:00', 'A'),
    ('L001', 9, 'SV001', ' ', 'UA'),
    ('L001', 10, 'SV001', '10:34:00', 'A'),
    ('L001', 11, 'SV001', '10:34:00', 'A'),
	('L001', 12, 'SV001', '10:34:00', 'A'),
    ('L002', 3, 'SV002', '10:34:00', 'A'),
    ('L002', 4, 'SV002', '10:35:00', 'A'),
    ('L002', 5, 'SV002', '10:50:00', 'A'),
    ('L002', 6, 'SV002', '10:33:00', 'A'),
	('L002', 7, 'SV002', '10:34:00', 'A'),
    ('L002', 8, 'SV002', ' ', 'A'),
    ('L002', 9, 'SV002', '10:34:00', 'A'),
	('L002', 1, 'SV003', '10:34:00', 'A'),
	('L002', 1, 'SV004', '10:34:00', 'A'),
	('L002', 1, 'SV005', '10:34:00', 'A'),
	('L002', 2, 'SV004', '10:34:00', 'A'),
	('L002', 2, 'SV005', '10:34:00', 'A'),
	('L002', 3, 'SV003', '10:34:00', 'A'),
	('L002', 3, 'SV005', '10:34:00', 'A'),
	('L002', 3, 'SV004', '10:34:00', 'A');

SELECT MALOP, STRING_AGG(MSSV + ':' + TINHTRANG, ', ') AS SINHVIEN_TINHTRANG
FROM DANHSACHTHI
GROUP BY MALOP;

-- procedure --

--1 Stored procedure để đếm số sinh viên đi học của môn học đó
CREATE PROCEDURE DemSoSinhVienDiHocTheoMonHoc
    @MABUOI INT,
    @MALOP CHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SoSinhVien INT;

    -- Đếm số sinh viên đi học trong buổi học
    SELECT @SoSinhVien = COUNT(*)
    FROM DIEMDANH DD
    INNER JOIN SINHVIEN SV ON DD.MSSV = SV.MSSV
    INNER JOIN LOP L ON SV.MALOP = L.MALOP
    WHERE DD.MABUOI = @MABUOI AND L.MALOP = @MALOP AND DD.GHICHU IN ('P', 'L');

    PRINT N'Số sinh viên đi học trong buổi học của môn học có MABUOI ' + CAST(@MABUOI AS VARCHAR) + N' và MALOP ' + @MALOP + N'là: '+ CAST(@SoSinhVien AS VARCHAR);
END


--test
EXEC DemSoSinhVienDiHocTheoMonHoc @MABUOI = 2, @MALOP = 'L002';
EXEC DemSoSinhVienDiHocTheoMonHoc @MABUOI = 2, @MALOP = 'L001';

drop procedure DemSoSinhVienDiHocTheoMonHoc
select * from DIEMDANH


--2 Stored procedure tính tổng số buổi nghỉ của một sinh viên trong mỗi môn học
CREATE PROCEDURE TinhTongSoBuoiNghi
    @MSSV CHAR(6),
    @MALOP CHAR(5)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TongSoBuoiNghi INT;

    -- Tính tổng số buổi nghỉ của sinh viên trong mỗi môn học
    SELECT @TongSoBuoiNghi = COUNT(*)
    FROM DIEMDANH DD
    INNER JOIN SINHVIEN SV ON DD.MSSV = SV.MSSV
    INNER JOIN LOP L ON SV.MALOP = L.MALOP
    WHERE SV.MSSV = @MSSV AND SV.MALOP = @MALOP AND DD.GHICHU IN ('UA', 'A');

    -- In kết quả
    PRINT N'Tổng số buổi nghỉ của sinh viên có MSSV ' + @MSSV + N'trong lớp ' + @MALOP + N'là: ' + CAST(@TongSoBuoiNghi AS VARCHAR);
END

--test
EXEC TinhTongSoBuoiNghi @MSSV = 'SV004', @MALOP = 'L001';
EXEC TinhTongSoBuoiNghi @MSSV = 'SV001', @MALOP = 'L001';
drop procedure TinhTongSoBuoiNghi
--


--Tao LOGIN
CREATE LOGIN SV01 WITH PASSWORD = 'SV@123456'
CREATE LOGIN SV02 WITH PASSWORD = 'SV@123456'
CREATE LOGIN SV03 WITH PASSWORD = 'SV@123456'
CREATE LOGIN SV04 WITH PASSWORD = 'SV@123456'
CREATE LOGIN SV05 WITH PASSWORD = 'SV@123456'
CREATE LOGIN SV06 WITH PASSWORD = 'SV@123456'
CREATE LOGIN SV07 WITH PASSWORD = 'SV@123456'
CREATE LOGIN GV01 WITH PASSWORD = 'GV@123'
CREATE LOGIN GV02 WITH PASSWORD = 'GV@123'
CREATE LOGIN GV03 WITH PASSWORD = 'GV@123'
CREATE LOGIN GV04 WITH PASSWORD = 'GV@123'
CREATE LOGIN GV05 WITH PASSWORD = 'GV@123'
CREATE LOGIN IT WITH PASSWORD = 'ITPROVIP@113'
CREATE LOGIN IT02 WITH PASSWORD = 'ITPROVIP@113'
CREATE LOGIN IT03 WITH PASSWORD = 'ITPROVIP@113'
--Tạo user--
--Sinh viên
CREATE USER SV01 for LOGIN SV01
CREATE USER SV02 for LOGIN SV02
CREATE USER SV03 for LOGIN SV03
CREATE USER SV04 for LOGIN SV04
CREATE USER SV05 for LOGIN SV05
CREATE USER SV06 for LOGIN SV06
CREATE USER SV07 for LOGIN SV07
--Giáo viên
CREATE USER GV01 for LOGIN GV01
CREATE USER GV02 for LOGIN GV02
CREATE USER GV03 for LOGIN GV03
CREATE USER GV04 for LOGIN GV04
CREATE USER GV05 for LOGIN GV05
--Người quản lí
CREATE USER IT01 for LOGIN IT
CREATE USER IT02 for LOGIN IT02
CREATE USER IT03 for LOGIN IT03
--Tạo role--
CREATE	ROLE sinhvien AUTHORIZATION dbo
CREATE	ROLE giaovien AUTHORIZATION dbo
-- Thêm user vào server role
EXEC sp_addrolemember 'sinhvien', 'SV01'
EXEC sp_addrolemember 'sinhvien', 'SV02'
EXEC sp_addrolemember 'sinhvien', 'SV03'
EXEC sp_addrolemember 'sinhvien', 'SV04'
EXEC sp_addrolemember 'sinhvien', 'SV05'
EXEC sp_addrolemember 'sinhvien', 'SV06'
EXEC sp_addrolemember 'sinhvien', 'SV07'

EXEC sp_addrolemember 'giaovien', 'GV01'
EXEC sp_addrolemember 'giaovien', 'GV02'
EXEC sp_addrolemember 'giaovien', 'GV03'
EXEC sp_addrolemember 'giaovien', 'GV04'
EXEC sp_addrolemember 'giaovien', 'GV05'

EXEC SP_ADDSRVROLEMEMBER 'IT', 'SysAdmin'
EXEC SP_ADDSRVROLEMEMBER 'IT03', 'SysAdmin'
EXEC SP_ADDSRVROLEMEMBER 'IT02', 'SysAdmin'
-- Phân quyền
--Sinh viên
grant select, insert, update on SINHVIEN to sinhvien --Phan quyen

grant select on DIEMDANH to sinhvien
grant select on BUOIHOC to sinhvien
grant select on LOP to sinhvien
--Giáo viên
grant select, insert on SINHVIEN to giaovien
revoke insert on SINHVIEN to giaovien
grant select, insert, update on DIEMDANH to giaovien
grant select, insert, update on BUOIHOC to giaovien
grant select on DIEMDANH to giaovien

INSERT INTO LOP (MALOP, TENLOP, SISO, SOBUOI)
VALUES 
    ('L0053', N'Lớp A', 30, 18)
	SELECT * FROM LOP