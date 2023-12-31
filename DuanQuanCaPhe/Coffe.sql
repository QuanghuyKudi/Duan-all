USE [master]
GO

CREATE DATABASE [Coffe]
 CONTAINMENT = NONE
GO
ALTER DATABASE [Coffe] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coffe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coffe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coffe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coffe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coffe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coffe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coffe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coffe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coffe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coffe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coffe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coffe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coffe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coffe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coffe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coffe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coffe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coffe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coffe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coffe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coffe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coffe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coffe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coffe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Coffe] SET  MULTI_USER 
GO
ALTER DATABASE [Coffe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coffe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Coffe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Coffe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Coffe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Coffe] SET QUERY_STORE = OFF
GO
USE [Coffe]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAN](
	[MaBan] [int] NOT NULL,
	[TenBan] [nvarchar](20) NOT NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CALAMVIEC](
	[MaCa] [nvarchar](10) NOT NULL,
	[TenCa] [nvarchar](20) NOT NULL,
	[GioBatDau] [time](7) NOT NULL,
	[GioKetThuc] [time](7) NOT NULL,
	[Luong] [float] NOT NULL,
 CONSTRAINT [PK__CALAMVIE__27258E7B18AAE6FF] PRIMARY KEY CLUSTERED 
(
	[MaCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHD] [nvarchar](10) NOT NULL,
	[NgayTao] [date] NOT NULL,
	[TenDN] [nvarchar](50) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[Huy] [bit] NULL,
	[Ban] [int] NULL,
	[DangBan] [bit] NULL,
 CONSTRAINT [PK__HOADON__2725A6E0CBF315FF] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADONCT](
	[MaHD] [nvarchar](10) NOT NULL,
	[MaHDCT] [nvarchar](10) NOT NULL,
	[MaSP] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[DonGia] [float] NOT NULL,
 CONSTRAINT [PK__HOADONCT__1419C12999C26FD1] PRIMARY KEY CLUSTERED 
(
	[MaHDCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAISANPHAM](
	[MaLoai] [nvarchar](10) NOT NULL,
	[TenLoai] [nvarchar](30) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK__LOAISANP__730A5759FD99C38E] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUONGCHITIET](
	[MaLuongCT] [nvarchar](10) NOT NULL,
	[NgayLamViec] [date] NOT NULL,
	[MaCa] [nvarchar](10) NULL,
	[MaNV] [nvarchar](15) NULL,
 CONSTRAINT [PK_LUONGCHITIET] PRIMARY KEY CLUSTERED 
(
	[MaLuongCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[MaND] [nvarchar](15) NOT NULL,
	[TenDN] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[PhanQuyen] [nvarchar](40) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_NGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [nvarchar](15) NOT NULL,
	[TenNV] [nvarchar](100) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[ChucVu] [nvarchar](40) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[NgayVaoLam] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [nvarchar](10) NOT NULL,
	[TenSP] [nvarchar](40) NOT NULL,
	[MaLoai] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaNhap] [float] NOT NULL,
	[GiaBan] [float] NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MoTa] [nvarchar](100) NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK__SANPHAM__2725081CF234A472] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BAN] ([MaBan], [TenBan], [TrangThai]) VALUES (1, N'Bàn 1', 0)
INSERT [dbo].[BAN] ([MaBan], [TenBan], [TrangThai]) VALUES (2, N'Bàn 2', 0)
INSERT [dbo].[BAN] ([MaBan], [TenBan], [TrangThai]) VALUES (3, N'Bàn 3', 0)
INSERT [dbo].[BAN] ([MaBan], [TenBan], [TrangThai]) VALUES (4, N'Bàn 4', 0)
INSERT [dbo].[BAN] ([MaBan], [TenBan], [TrangThai]) VALUES (5, N'Bàn 5', 0)
GO
INSERT [dbo].[CALAMVIEC] ([MaCa], [TenCa], [GioBatDau], [GioKetThuc], [Luong]) VALUES (N'1', N'ca 1', CAST(N'07:30:00' AS Time), CAST(N'08:45:00' AS Time), 60000)
INSERT [dbo].[CALAMVIEC] ([MaCa], [TenCa], [GioBatDau], [GioKetThuc], [Luong]) VALUES (N'2', N'ca 2', CAST(N'07:00:00' AS Time), CAST(N'18:30:00' AS Time), 25000)
GO
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD001', CAST(N'2021-12-17' AS Date), N'admin123', 0, 1, 1, 0)
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD002', CAST(N'2021-12-17' AS Date), N'admin123', 1, 0, 3, 0)
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD003', CAST(N'2021-12-19' AS Date), N'admin123', 1, 0, 1, 0)
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD004', CAST(N'2021-12-19' AS Date), N'admin123', 1, 0, 1, 0)
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD005', CAST(N'2021-12-19' AS Date), N'lelinh@123', 1, 0, 3, 0)
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD006', CAST(N'2021-12-19' AS Date), N'lelinh@123', 1, 0, 1, 0)
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD007', CAST(N'2021-12-19' AS Date), N'lelinh@123', 1, 0, 5, 0)
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD008', CAST(N'2021-12-19' AS Date), N'lelinh@123', 1, 0, 4, 0)
INSERT [dbo].[HOADON] ([MaHD], [NgayTao], [TenDN], [TrangThai], [Huy], [Ban], [DangBan]) VALUES (N'HD009', CAST(N'2021-12-19' AS Date), N'lelinh@123', 0, 1, 4, 0)
GO
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD001', N'HDCT001', N'SP001', 1, 0, 12000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD002', N'HDCT002', N'SP004', 1, 0, 12000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD003', N'HDCT004', N'SP002', 3, 2000, 22000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD003', N'HDCT005', N'SP003', 1, 0, 13000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD004', N'HDCT007', N'SP002', 1, 0, 8000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD005', N'HDCT008', N'SP002', 1, 0, 8000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD005', N'HDCT009', N'SP003', 2, 1000, 25000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD006', N'HDCT010', N'SP002', 2, 0, 16000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD006', N'HDCT011', N'SP006', 1, 0, 14000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD007', N'HDCT012', N'SP003', 5, 0, 65000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD008', N'HDCT013', N'SP004', 1, 2000, 10000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD008', N'HDCT014', N'SP003', 1, 1000, 12000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD008', N'HDCT015', N'SP001', 1, 0, 12000)
INSERT [dbo].[HOADONCT] ([MaHD], [MaHDCT], [MaSP], [SoLuong], [GiamGia], [DonGia]) VALUES (N'HD009', N'HDCT016', N'SP001', 1, 0, 12000)
GO
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MoTa]) VALUES (N'L001', N'Cà phê ', N'')
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MoTa]) VALUES (N'L002', N'Nước ngọt', N'')
GO
INSERT [dbo].[LUONGCHITIET] ([MaLuongCT], [NgayLamViec], [MaCa], [MaNV]) VALUES (N'L001', CAST(N'2021-12-14' AS Date), N'1', N'NV03')
INSERT [dbo].[LUONGCHITIET] ([MaLuongCT], [NgayLamViec], [MaCa], [MaNV]) VALUES (N'L002', CAST(N'2021-12-14' AS Date), N'2', N'NV01')
INSERT [dbo].[LUONGCHITIET] ([MaLuongCT], [NgayLamViec], [MaCa], [MaNV]) VALUES (N'L003', CAST(N'2021-12-14' AS Date), N'1', N'NV01')
GO
INSERT [dbo].[NGUOIDUNG] ([MaND], [TenDN], [MatKhau], [PhanQuyen], [TrangThai]) VALUES (N'admin', N'admin123', N'123', N'admin', 1)
INSERT [dbo].[NGUOIDUNG] ([MaND], [TenDN], [MatKhau], [PhanQuyen], [TrangThai]) VALUES (N'NV02', N'phamthai@123', N'123', N'Thu ngân', 1)
INSERT [dbo].[NGUOIDUNG] ([MaND], [TenDN], [MatKhau], [PhanQuyen], [TrangThai]) VALUES (N'NV05', N'khoa@123', N'123', N'Thu ngân', 1)
INSERT [dbo].[NGUOIDUNG] ([MaND], [TenDN], [MatKhau], [PhanQuyen], [TrangThai]) VALUES (N'NV04', N'huy@123', N'123', N'Quản lý', 1)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [ChucVu], [Email], [NgayVaoLam]) VALUES (N'admin', N'Phạm Văn Thái', 1, CAST(N'2000-08-24' AS Date), N'0944694449', N'KG', N'admin', N'thaipv@gmail.com', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [ChucVu], [Email], [NgayVaoLam]) VALUES (N'NV01', N'Trần Lâm Hoài Tâm', 1, CAST(N'1997-01-01' AS Date), N'0944694445', N'ko co', N'Phục vụ', N'tamtlh@gmail.com', CAST(N'2021-12-11' AS Date))
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [ChucVu], [Email], [NgayVaoLam]) VALUES (N'NV02', N'Nguyên Bá Bình Nguyên', 1, CAST(N'2003-08-15' AS Date), N'0944464447', N'ko co', N'Quản lý ', N'nguyennbb@gmail.com', CAST(N'2021-12-11' AS Date))
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [ChucVu], [Email], [NgayVaoLam]) VALUES (N'NV03', N'Huỳnh Kim Khoa', 1, CAST(N'1998-12-16' AS Date), N'0944694440', N'ko co', N'Phục vụ', N'khoahk@gmail.com', CAST(N'2021-12-14' AS Date))
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [ChucVu], [Email], [NgayVaoLam]) VALUES (N'NV04', N'Tạ Quang Huy', 1, CAST(N'1997-08-03' AS Date), N'0944694448', N'Cà Mau', N'Thu ngân', N'huytq@gmail.com', CAST(N'2021-12-15' AS Date))
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [ChucVu], [Email], [NgayVaoLam]) VALUES (N'NV05', N'Lưu Hữu Phước ', 1, CAST(N'1999-11-01' AS Date), N'0944604440', N'Cần Thơ', N'Quản lý ', N'phuoclh@gmail.com', CAST(N'2021-12-15' AS Date))
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoai], [SoLuong], [GiaNhap], [GiaBan], [NgayNhap], [MoTa], [HinhAnh], [TrangThai]) VALUES (N'SP001', N'Cà phê đen đá', N'L001', 77, 10000, 12000, CAST(N'2021-12-11' AS Date), N'', N'sp2.jpg', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoai], [SoLuong], [GiaNhap], [GiaBan], [NgayNhap], [MoTa], [HinhAnh], [TrangThai]) VALUES (N'SP002', N'Trà xanh 0 độ', N'L002', 91, 7000, 8000, CAST(N'2021-08-12' AS Date), N'', N'sp3.jpg', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoai], [SoLuong], [GiaNhap], [GiaBan], [NgayNhap], [MoTa], [HinhAnh], [TrangThai]) VALUES (N'SP003', N'Trà đào', N'L002', 14, 12000, 13000, CAST(N'2021-12-15' AS Date), N'', N'sp4.jpg', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoai], [SoLuong], [GiaNhap], [GiaBan], [NgayNhap], [MoTa], [HinhAnh], [TrangThai]) VALUES (N'SP004', N'Cà phê sữa đá', N'L001', 2, 6000, 12000, CAST(N'2021-12-15' AS Date), N'', N'sp5.jpg', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoai], [SoLuong], [GiaNhap], [GiaBan], [NgayNhap], [MoTa], [HinhAnh], [TrangThai]) VALUES (N'SP005', N'Coca cola', N'L002', 100, 12000, 15000, CAST(N'2021-12-15' AS Date), N'', N'sp6.jpg', 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoai], [SoLuong], [GiaNhap], [GiaBan], [NgayNhap], [MoTa], [HinhAnh], [TrangThai]) VALUES (N'SP006', N'Pepsi', N'L002', 1, 13000, 14000, CAST(N'2021-12-18' AS Date), N'', N'', 1)
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_BAN] FOREIGN KEY([Ban])
REFERENCES [dbo].[BAN] ([MaBan])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_BAN]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_NGUOIDUNG1] FOREIGN KEY([TenDN])
REFERENCES [dbo].[NGUOIDUNG] ([TenDN])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_NGUOIDUNG1]
GO
ALTER TABLE [dbo].[HOADONCT]  WITH CHECK ADD  CONSTRAINT [FK_HOADONCT_HOADON] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOADON] ([MaHD])
GO
ALTER TABLE [dbo].[HOADONCT] CHECK CONSTRAINT [FK_HOADONCT_HOADON]
GO
ALTER TABLE [dbo].[HOADONCT]  WITH CHECK ADD  CONSTRAINT [FK_HOADONCT_SANPHAM] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[HOADONCT] CHECK CONSTRAINT [FK_HOADONCT_SANPHAM]
GO
ALTER TABLE [dbo].[LUONGCHITIET]  WITH CHECK ADD  CONSTRAINT [FK_CaLam] FOREIGN KEY([MaCa])
REFERENCES [dbo].[CALAMVIEC] ([MaCa])
GO
ALTER TABLE [dbo].[LUONGCHITIET] CHECK CONSTRAINT [FK_CaLam]
GO
ALTER TABLE [dbo].[LUONGCHITIET]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[LUONGCHITIET] CHECK CONSTRAINT [FK_NhanVien]
GO
ALTER TABLE [dbo].[NGUOIDUNG]  WITH CHECK ADD  CONSTRAINT [FK_NGUOIDUNG_NHANVIEN1] FOREIGN KEY([MaND])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[NGUOIDUNG] CHECK CONSTRAINT [FK_NGUOIDUNG_NHANVIEN1]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_doanhThu] @Nam int
as 
begin 
		select MONTH(b.NgayTao)as 'Thang',count(a.MaSP) as N'SanPhamBan',
		sum(c.GiaNhap)  as N'TongGiaNhap',
		sum(c.GiaBan) as N'TongGiaBan',
		sum(GiamGia) as N'TongGiaGiam',
		sum(donGia) as N'TongTien'
		from hoadonCT a inner join HoaDon b on a.MaHD = b.MaHD
		inner join SanPham c on a.MaSP = c.MaSP
		where YEAR(b.NgayTao) = @Nam and b.TrangThai = 'True' 
		group by MONTH(b.NgayTao)		
end 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_HoaDonChiTiet] @MaHD nvarchar(10)
as
begin
select a.MaSP,b.TenSP,b.GiaBan,a.SoLuong,a.GiamGia,a.DonGia
from HOADONCT a inner join SANPHAM b
on a.MaSP = b.MaSP
where a.MaHD = @MaHD
end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[Sp_Luong]
as
begin 
	select a.TenNV as 'TenNhanVien',count(b.MaCa) as 'TongCaLam',sum(c.Luong) as 'TongLuong'
	from NhanVien a inner join LuongChiTiet b
	on a.MaNV = b.MaNV
	inner join CaLamViec c on c.MaCa = b.MaCa
	where a.MaNV != 'admin'
	group by a.TenNV
end 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_SanPham](@Loai nvarchar(50))
as 
begin	
		select TenSP as N'TenSP',a.SoLuong as N'SoLuongNhap',
		sum(b.SoLuong) as N'SoLuongBan',a.NgayNhap as N'NgayNhap'
		from SanPham a inner join HOADONCT b  on a.MaSP = b.MaSP
		where a.MaLoai = @Loai
		group by TenSP,a.SoLuong,NgayNhap
end
GO
USE [master]
GO
ALTER DATABASE [Coffe] SET  READ_WRITE 
GO
