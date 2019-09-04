-- Nhom N2: Nguy?n Phúc Hoài Linh, Nguy?n ??ng Khoa, Nguy?n Thanh L?c
-- Tao co so du lieu nha hang
--create database QuanLyCuaHangDT
-- su dung csdl cua hang dien thoai
use QuanLyCuaHangDT
-- tao bang NhanVien
create table NhanVien(
   MaNV int identity constraint PK_MaNV primary key,
   HoTen nvarchar(30) Not Null,
   NgaySinh int Not Null,
   GioiTinh nvarchar(9) check( GioiTinh in( 'Nam',N'Nữ')),
   QueQuan nvarchar(100) Not Null,
   Sdt varchar(10) Not Null,
   MaID int constraint FK_MaID foreign key (MaID) references TaiKhoanDangNhap(MaID) on delete cascade on update cascade,
   ChucVu nvarchar(18) check( Chucvu in( N'Chủ cửa hàng', N'Quản lý', N'Nhân viên'))
)
-- tao bang tai khoan dang nhap
create table TaiKhoanDangNhap(
   MaID int identity constraint PK_MaID primary key,
   MatKhau varchar(18) Not NUll,
   TenHienThi nvarchar(24) Not Null,
   LoaiTaiKhoan nvarchar(18) check( LoaiTaiKhoan in( N'Chủ cửa hàng', N'Quản lý', N'Nhân viên'))
)
-- tao bang Kho dien thoai
create table KhoDienThoai(
   MaDT int identity constraint PK_MaDT primary key,
   TenDT nvarchar(40) Not Null,
   HangSX nvarchar(40) Not Null,
   GiaThanh int,
   HinhAnh varbinary(max) Not Null,
   SoLuongConTrongCH bit
)
-- tao bang Kho linh kien
create table KhoLinhKien(
   MaLK int identity constraint PK_MaLK primary key,
   TenLK nvarchar(40) Not Null,
   HangSX nvarchar(40) Not Null,
   GiaThanh int,
   HinhAnh varbinary(max) Not Null,
   SoLuongConTrongCH bit
)
-- tao chuc nang 
create table ChucNang(
   maChucNang int identity constraint PK_maCN primary key,
   tenChucNang nvarchar(30) Not Null
)
-- tao bang phan quyen
create table PhanQuyenNhanVien(
   MaNV int foreign key (MaNV)
       references NhanVien (MaNV) on delete cascade on update cascade, 
   maChucNang int  foreign key (maChucNang)
       references ChucNang (maChucNang) on delete cascade  on update cascade
)


