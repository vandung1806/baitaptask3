--Tạo CSDL tên là Example4 (lưu ý đường dẫn WHERE phải tồn tại từ trước nếu không sẽ phát sinh lỗi)
CREATE DATABASE Example4
ON PRIMARY
(
	NAME='Example4',
	FILENAME='WHERE\Example4.mdf'
)
LOG On
(
	NAME='Example4',
	FILENAME='WHERE\Example4.ldf'
)
GO

CREATE DATABASE Example4
ON PRIMARY
(	NAME = N'Customer_DB',
	FILENAME = N'C:\Temp\Example4.mdf')
LOG ON
(	NAME = N'Customer_DB_log',
	FILENAME = N'C:\Temp\Example4_DB_log.mdf')
COLLATE SQL_Latin1_General_CPI_CI_AS
GO

USE Example4
GO
--Thay đổi tên CSDL Example4 thành Example4Test:
ALTER DATABASE Example4 MODIFY NAME = Example4Test
GO

USE Example4Test
GO
EXECUTE sp_changedbowner @loginame='na'
EXEC sp_changedbowner
GO

USE Example4Test;
GO
ALTER DATABASE CUST_DB SET AUTO_SHRINK ON
GO

USE master
GO
--Nếu tồn tại đối tượng (CSDL) tên là Example4 thì xáo đối tượng (CSDL) này đi
IF(DB_ID('Example4') IS NOT NULL)
	DROP DATABASE Example4
GO
--Tạo CSDL tên là Example4 với FileGroup
CREATE DATABASE Example4
ON PRIMARY
	( NAME='Example4_Primary',
	  FILENAME='C:\Temp\Example4.mdf',
	  SIZE=4MB,
	  MAXSIZE=10MB,
	FILEGROWTH=1MB),
DILEGROUP Example4_FGI
	( NAME = 'Example4_FG1_Dat1',
	  FILENAME='C:\Temp\Example4_FG1_1.ndf',
	  SIZE=4MB,
	  MAXSIZE=10MB,
	  FILEGROWTH=1MB),
	  ( NAME = 'Example4_FG1_Dat2',
	  FILENAME='C:\Temp\Example4_FG1_2.ndf',
	  SIZE=4MB,
	  MAXSIZE=10MB,
	  FILEGROWTH=1MB),
LOG ON
	( NAME='Example4_log',
	  FILENAME='C:\Temp\Example4.mdf',
	  SIZE=4MB,
	  MAXSIZE=10MB,
	FILEGROWTH=1MB),
GO

--Thêm FileGroup vào trong CSDL
USE master
GO
ALTER DATABASE Example4
ADD FILEGROUP Test1FG1;
GO
ALTER DATABASE Example4
ADD FILE
(
	NAME = test1dat3,
	FILENAME = 'C:\Temp\tidat3.ndf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
),
(
	NAME = test1dat4,
	FILENAME = 'C:\Temp\tidat4.ndf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
TO FILEGROUP Test1FG1;
GO

--Thêm FileGroup vào log file
USE master;
GO
ALTER DATABASE Example4
ADD LOG FILE 
(
	NAME = testlog2,
	FILENAME = 'C:\Temp\test2log.ldf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
),
(
	NAME = testlog3,
	FILENAME = 'C:\Temp\test3log.ldf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
);

--Nếu tồn tại đối tượng (CSDL) tên là Example4 thì xóa đối tượng (CSDL) này đi
IF (DB_ID('Example4') IS NOT NULL)
	DROP DATABASE Example4
GO
--hoặc sử dụng khung nhìn hệ thống sau:
IF EXISTS (SELECT * FROM sys.databases WHERE name='Example4')
   DROP DATABASE Example4
GO

--Tạo CSDL bản chụp: Chỉ chạy được trên bản Enterprise.
CREATE DATABASE Example4_Snapshot
AS SNAPSHOT OF Example4

CREATE DATABASE database_name 
[ ON
[ PRIMARY ] [ <filespec> [,...n]]
[ , <filegroup> [,...n] ]
[ LOF ON { <filespec> [ ,...n] } ]
]
[ COLLATE collation_name ]
]
[;]

