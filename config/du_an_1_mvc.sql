-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 11, 2024 lúc 06:05 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `du_an_1_mvc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bai_viet`
--

CREATE TABLE `bai_viet` (
  `id` int(225) NOT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `mo_ta_ngan` varchar(255) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `noi_dung` text DEFAULT NULL,
  `ngay_dang` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_dh`
--

CREATE TABLE `chi_tiet_dh` (
  `id` int(225) NOT NULL,
  `id_don_hang` int(225) DEFAULT NULL,
  `id_san_pham` int(225) DEFAULT NULL,
  `sl_san_pham` int(225) NOT NULL,
  `gia_san_pham` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia`
--

CREATE TABLE `danh_gia` (
  `id` int(225) NOT NULL,
  `id_user` int(225) DEFAULT NULL,
  `id_san_pham` int(225) DEFAULT NULL,
  `so_sao` int(11) DEFAULT NULL CHECK (`so_sao` between 1 and 5),
  `noi_dung` text DEFAULT NULL,
  `thoi_gian` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` int(225) NOT NULL,
  `ten_danh_muc` varchar(255) NOT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten_danh_muc`, `hinh_anh`) VALUES
(1, 'MACBOOK', 'assets/Client/images/brands/apple.jpg'),
(2, 'LENOVO', 'assets/Client/images/brands/lenovo.jpg'),
(3, 'ACER', 'assets/Client/images/brands/acer.jpg'),
(4, 'HP', 'assets/Client/images/brands/hp.jpg'),
(5, 'MSI', 'assets/Client/images/brands/MSI.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dia_chi`
--

CREATE TABLE `dia_chi` (
  `id` int(225) NOT NULL,
  `chi_tiet_dia_chi` varchar(255) NOT NULL,
  `id_user` int(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dia_chi`
--

INSERT INTO `dia_chi` (`id`, `chi_tiet_dia_chi`, `id_user`) VALUES
(1, '246 - Định Tiến / Yên Định / Thanh Hóa', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id` int(225) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tong_tien` decimal(10,2) DEFAULT NULL,
  `trang_thai` varchar(50) DEFAULT NULL,
  `thoi_gian` timestamp NOT NULL DEFAULT current_timestamp(),
  `ghi_chu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` int(225) NOT NULL,
  `id_user` int(225) DEFAULT NULL,
  `id_san_pham` int(225) DEFAULT NULL,
  `so_luong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh_anh`
--

CREATE TABLE `hinh_anh` (
  `id` int(225) NOT NULL,
  `hinh_anh_1` varchar(255) NOT NULL,
  `hinh_anh_2` varchar(255) NOT NULL,
  `hinh_anh_3` varchar(255) DEFAULT NULL,
  `hinh_anh_4` varchar(255) DEFAULT NULL,
  `id_san_pham` int(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinh_anh`
--

INSERT INTO `hinh_anh` (`id`, `hinh_anh_1`, `hinh_anh_2`, `hinh_anh_3`, `hinh_anh_4`, `id_san_pham`) VALUES
(1, 'assets/Client/images/products/product_macbook_1.png', 'assets/Client/images/products/product_macbook_1_1.png', 'assets/Client/images/products/product_macbook_1_2.png', 'assets/Client/images/products/product_macbook_1_3.png', 1),
(2, 'assets/Client/images/products/Laptop_gaming_lenovo_1.png', 'assets/Client/images/products/Laptop_gaming_lenovo_1_1.jpg', 'assets/Client/images/products/Laptop_gaming_lenovo_1_2.jpg', 'assets/Client/images/products/Laptop_gaming_lenovo_1_3.jpg', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id` int(225) NOT NULL,
  `ma_san_pham` varchar(50) NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `gia_san_pham` decimal(10,2) NOT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `luot_xem` int(225) DEFAULT NULL,
  `khuyen_mai` int(11) DEFAULT 0,
  `id_danh_muc` int(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id`, `ma_san_pham`, `ten_san_pham`, `mo_ta`, `gia_san_pham`, `so_luong`, `luot_xem`, `khuyen_mai`, `id_danh_muc`) VALUES
(1, 'SP001', 'Macbook Air 13 M2 2024 8CPU/8GPU/16GB/256GB', '<h3>Thông tin sản phẩm</h3>\r\n    <hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Bộ xử lý</h5>\r\n        <p class=\"item\"><strong>Hãng CPU:</strong> Apple</p>\r\n        <p class=\"item\"><strong>Công nghệ CPU:</strong> M2</p>\r\n        <p class=\"item\"><strong>Loại CPU:</strong> 8 - Core</p>\r\n        <p class=\"item\"><strong>Tốc độ CPU tối thiểu:</strong> 2.3 GHz</p>\r\n    </div>\r\n    <hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>RAM</h5>\r\n        <p class=\"item\"><strong>Dung lượng RAM:</strong> 16 GB</p>\r\n        <p class=\"item\"><strong>Loại RAM:</strong> LPDDR4</p>\r\n        <p class=\"item\"><strong>Số RAM onboard:</strong> 1</p>\r\n        <p class=\"item\"><strong>Hỗ trợ RAM tối đa:</strong> 16 GB</p>\r\n    </div>\r\n    <hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Lưu trữ</h5>\r\n        <p class=\"item\"><strong>Kiểu ổ cứng:</strong> SSD</p>\r\n        <p class=\"item\"><strong>Loại SSD:</strong> Hãng không công bố</p>\r\n        <p class=\"item\"><strong>Dung lượng:</strong> 256 GB</p>\r\n    </div>\r\n    <hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Màn hình</h5>\r\n        <p class=\"item\"><strong>Kích thước màn hình:</strong> 13.6 inch</p>\r\n        <p class=\"item\"><strong>Công nghệ màn hình:</strong> Retina</p>\r\n        <p class=\"item\"><strong>Độ phân giải:</strong> 2560 x 1644 Pixels</p>\r\n        <p class=\"item\"><strong>Tần số quét:</strong> 60 Hz</p>\r\n        <p class=\"item\"><strong>Tấm nền:</strong> IPS</p>\r\n    </div>\r\n    <hr> \r\n\r\n    <div class=\"section\">\r\n        <h5>Giao tiếp và kết nối</h5>\r\n        <p class=\"item\"><strong>Cổng giao tiếp:</strong> 2 Type C</p>\r\n        <p class=\"item\"><strong>Wifi:</strong> 802.11 ax</p>\r\n        <p class=\"item\"><strong>Bluetooth:</strong> v5.0</p>\r\n        <p class=\"item\"><strong>Webcam:</strong> Full HD Webcam (1080p)</p>\r\n    </div>\r\n    <hr> \r\n\r\n    <div class=\"section\">\r\n        <h5>Hệ điều hành</h5>\r\n        <p class=\"item\"><strong>OS:</strong> macOS</p>\r\n        <p class=\"item\"><strong>Version:</strong> Ventura</p>\r\n    </div>\r\n    <hr> \r\n\r\n    <div class=\"section\">\r\n        <h5>Bảo mật</h5>\r\n        <p class=\"item\"><strong>Bảo mật:</strong> Mở khóa vân tay</p>\r\n    </div>\r\n    <hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Bàn phím & TouchPad</h5>\r\n        <p class=\"item\"><strong>Kiểu bàn phím:</strong> English International Backlit Keyboard</p>\r\n        <p class=\"item\"><strong>Bàn phím số:</strong> Không</p>\r\n        <p class=\"item\"><strong>Đèn bàn phím:</strong> LED</p>\r\n        <p class=\"item\"><strong>TouchPad:</strong> Multi-touch touchpad</p>\r\n    </div>\r\n    <hr> \r\n\r\n    <div class=\"section\">\r\n        <h5>Thông tin pin & sạc</h5>\r\n        <p class=\"item\"><strong>Loại PIN:</strong> Lithium polymer</p>\r\n        <p class=\"item\"><strong>Dung lượng pin:</strong> 22 Giờ</p>\r\n        <p class=\"item\"><strong>Power Supply:</strong> 70 W</p>\r\n    </div>\r\n    <hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Phụ kiện trong hộp</h5>\r\n        <p class=\"item\"><strong>Phụ kiện:</strong> Adapter, Dây cáp sạc</p>\r\n    </div>\r\n    <hr> \r\n\r\n    <div class=\"section\">\r\n        <h5>Thiết kế & Trọng lượng</h5>\r\n        <p class=\"item\"><strong>Kích thước:</strong> 30.41 x 21.5 x 1.13 cm</p>\r\n        <p class=\"item\"><strong>Trọng lượng sản phẩm:</strong> 1.24 kg</p>\r\n        <p class=\"item\"><strong>Chất liệu:</strong> Vỏ: Kim loại</p>\r\n    </div>\r\n    <hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Thông tin hàng hóa</h5>\r\n        <p class=\"item\"><strong>P/N:</strong> MC7U4SA/A</p>\r\n        <p class=\"item\"><strong>Xuất xứ:</strong> Trung Quốc</p>\r\n        <p class=\"item\"><strong>Thời điểm ra mắt:</strong> 2024</p>\r\n        <p class=\"item\"><strong>Thời gian bảo hành (tháng):</strong> 12</p>\r\n        <p class=\"item\"><strong>Hướng dẫn bảo quản:</strong> Để nơi khô ráo, nhẹ tay, dễ vỡ.</p>\r\n        <p class=\"item\"><strong>Hướng dẫn sử dụng:</strong> Xem trong sách hướng dẫn sử dụng</p>\r\n        <p class=\"item\"><strong>Màu sắc:</strong> Xám</p>\r\n    </div>', 24000000.00, 20, 2147483647, 20, 1),
(2, 'SP002', 'Laptop Lenovo Gaming LOQ 15IAX9 i5 12450HX/AI/24GB/512GB/15.6\"FHD/RTX2050 4GB/Win11', '<h3>Thông tin sản phẩm</h3>\r\n\r\n    <div class=\"section\">\r\n        <h5>Bộ xử lý</h5>\r\n        <p class=\"item\"><strong>Hãng CPU:</strong> Intel</p>\r\n        <p class=\"item\"><strong>Công nghệ CPU:</strong> Core i5</p>\r\n        <p class=\"item\"><strong>Loại CPU:</strong> 12450HX</p>\r\n        <p class=\"item\"><strong>Tốc độ tối đa:</strong> 4.4 GHz</p>\r\n        <p class=\"item\"><strong>Số nhân:</strong> 8</p>\r\n        <p class=\"item\"><strong>Số luồng:</strong> 12</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Đồ họa</h5>\r\n        <p class=\"item\"><strong>Hãng (Card rời):</strong> NVIDIA</p>\r\n        <p class=\"item\"><strong>Model (Card rời):</strong> Geforce RTX 2050</p>\r\n        <p class=\"item\"><strong>Tên đầy đủ (Card rời):</strong> NVIDIA GeForce RTX 2050 4GB GDDR6</p>\r\n        <p class=\"item\"><strong>Bộ nhớ:</strong> 4 GB</p>\r\n        <p class=\"item\"><strong>Hiệu suất AI (TOPS):</strong> 104</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>RAM</h5>\r\n        <p class=\"item\"><strong>Dung lượng RAM:</strong> 24 GB (2 thanh 12GB)</p>\r\n        <p class=\"item\"><strong>Loại RAM:</strong> DDR5</p>\r\n        <p class=\"item\"><strong>Tốc độ RAM:</strong> 4800 MHz</p>\r\n        <p class=\"item\"><strong>Số khe cắm rời:</strong> 2</p>\r\n        <p class=\"item\"><strong>Hỗ trợ RAM tối đa:</strong> 32 GB</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Lưu trữ</h5>\r\n        <p class=\"item\"><strong>Kiểu ổ cứng:</strong> SSD</p>\r\n        <p class=\"item\"><strong>Loại SSD:</strong> 1 M2. PCIe</p>\r\n        <p class=\"item\"><strong>Dung lượng:</strong> 512 GB</p>\r\n        <p class=\"item\"><strong>Chuẩn M2:</strong> 2242</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Màn hình</h5>\r\n        <p class=\"item\"><strong>Kích thước màn hình:</strong> 15.6 inch</p>\r\n        <p class=\"item\"><strong>Công nghệ màn hình:</strong> IPS FHD</p>\r\n        <p class=\"item\"><strong>Độ phân giải:</strong> 1920 x 1080 Pixels</p>\r\n        <p class=\"item\"><strong>Loại màn hình:</strong> Màn hình phẳng</p>\r\n        <p class=\"item\"><strong>Tần số quét:</strong> 144 Hz</p>\r\n        <p class=\"item\"><strong>Tấm nền:</strong> IPS</p>\r\n        <p class=\"item\"><strong>Độ sáng:</strong> 300 nits</p>\r\n        <p class=\"item\"><strong>Độ phủ màu:</strong> 100% sRGB</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Giao tiếp và kết nối</h5>\r\n        <p class=\"item\"><strong>Cổng giao tiếp:</strong></p>\r\n        <ul class=\"item\">\r\n            <li>3 USB 3.2 Gen 1 Type-A</li>\r\n            <li>1 USB 3.2 Gen 2 Type-C</li>\r\n            <li>1 HDMI 2.1</li>\r\n            <li>1 Jack 3.5 mm</li>\r\n            <li>1 RJ45 Gigabit Ethernet</li>\r\n            <li>1 Power connector</li>\r\n        </ul>\r\n        <p class=\"item\"><strong>Wifi:</strong> Wifi 6</p>\r\n        <p class=\"item\"><strong>Bluetooth:</strong> v5.2</p>\r\n        <p class=\"item\"><strong>Webcam:</strong> HD Webcam (720p Webcam)</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Hệ điều hành</h5>\r\n        <p class=\"item\"><strong>OS:</strong> Windows</p>\r\n        <p class=\"item\"><strong>Version:</strong> Windows 11 Home Single Language</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Bảo mật</h5>\r\n        <p class=\"item\"><strong>Bảo mật:</strong> Mật khẩu</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Bàn phím & TouchPad</h5>\r\n        <p class=\"item\"><strong>Kiểu bàn phím:</strong> English International Backlit Keyboard</p>\r\n        <p class=\"item\"><strong>Bàn phím số:</strong> Có (NumberPad)</p>\r\n        <p class=\"item\"><strong>Đèn bàn phím:</strong> LED</p>\r\n        <p class=\"item\"><strong>Màu đèn LED:</strong> Trắng</p>\r\n        <p class=\"item\"><strong>TouchPad:</strong> Multi-touch touchpad</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Thông tin pin & sạc</h5>\r\n        <p class=\"item\"><strong>Dung lượng pin:</strong> 60 Wh</p>\r\n        <p class=\"item\"><strong>Power Supply:</strong> 135 W</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Phụ kiện trong hộp</h5>\r\n        <p class=\"item\"><strong>Phụ kiện:</strong> Bộ sạc điện</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Thiết kế & Trọng lượng</h5>\r\n        <p class=\"item\"><strong>Kích thước:</strong> 359.86 x 258.7 x 21.9-23.9 mm</p>\r\n        <p class=\"item\"><strong>Trọng lượng sản phẩm:</strong> 2.38 kg</p>\r\n        <p class=\"item\"><strong>Chất liệu:</strong> Nhựa ABS</p>\r\n    </div><hr>\r\n\r\n    <div class=\"section\">\r\n        <h5>Thông tin hàng hóa</h5>\r\n        <p class=\"item\"><strong>P/N:</strong> 83GS00DBVN</p>\r\n        <p class=\"item\"><strong>Xuất xứ:</strong> Trung Quốc</p>\r\n        <p class=\"item\"><strong>Thời điểm ra mắt:</strong> 04/2024</p>\r\n        <p class=\"item\"><strong>Thời gian bảo hành (tháng):</strong> 24</p>\r\n        <p class=\"item\"><strong>Hướng dẫn bảo quản:</strong> Để nơi khô ráo, nhẹ tay, dễ vỡ.</p>\r\n        <p class=\"item\"><strong>Hướng dẫn sử dụng:</strong> Xem trong sách hướng dẫn sử dụng</p>\r\n        <p class=\"item\"><strong>Màu sắc:</strong> Xám</p>\r\n    </div><hr>\r\n', 34000000.00, 45, 29, 10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(225) NOT NULL,
  `ten_user` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `vai_tro` text NOT NULL,
  `thoi_gian_tao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `ten_user`, `mat_khau`, `email`, `so_dien_thoai`, `vai_tro`, `thoi_gian_tao`) VALUES
(1, 'Tùng Dương', '12345678', 'duongdtpa00914@gmail.com', '0123456789', 'client', '2024-11-10 14:04:13'),
(2, 'admin', 'admin12345', 'admin8386@gmail.com', '0987654321', 'admin', '2024-11-10 15:42:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yeu_thich`
--

CREATE TABLE `yeu_thich` (
  `id` int(225) NOT NULL,
  `id_user` int(225) DEFAULT NULL,
  `id_san_pham` int(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bai_viet`
--
ALTER TABLE `bai_viet`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chi_tiet_dh`
--
ALTER TABLE `chi_tiet_dh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_don_hang` (`id_don_hang`),
  ADD KEY `id_san_pham` (`id_san_pham`);

--
-- Chỉ mục cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_san_pham` (`id_san_pham`);

--
-- Chỉ mục cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dia_chi`
--
ALTER TABLE `dia_chi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_san_pham` (`id_san_pham`);

--
-- Chỉ mục cho bảng `hinh_anh`
--
ALTER TABLE `hinh_anh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_san_pham` (`id_san_pham`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ma_san_pham` (`ma_san_pham`),
  ADD KEY `id_danh_muc` (`id_danh_muc`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `so_dien_thoai` (`so_dien_thoai`);

--
-- Chỉ mục cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_san_pham` (`id_san_pham`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bai_viet`
--
ALTER TABLE `bai_viet`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_dh`
--
ALTER TABLE `chi_tiet_dh`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `dia_chi`
--
ALTER TABLE `dia_chi`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hinh_anh`
--
ALTER TABLE `hinh_anh`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chi_tiet_dh`
--
ALTER TABLE `chi_tiet_dh`
  ADD CONSTRAINT `chi_tiet_dh_ibfk_1` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hang` (`id`),
  ADD CONSTRAINT `chi_tiet_dh_ibfk_2` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`);

--
-- Các ràng buộc cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD CONSTRAINT `danh_gia_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `danh_gia_ibfk_2` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`);

--
-- Các ràng buộc cho bảng `dia_chi`
--
ALTER TABLE `dia_chi`
  ADD CONSTRAINT `dia_chi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `don_hang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `gio_hang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `gio_hang_ibfk_2` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`);

--
-- Các ràng buộc cho bảng `hinh_anh`
--
ALTER TABLE `hinh_anh`
  ADD CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`);

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc` (`id`);

--
-- Các ràng buộc cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  ADD CONSTRAINT `yeu_thich_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `yeu_thich_ibfk_2` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
