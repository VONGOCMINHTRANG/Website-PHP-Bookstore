-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 21, 2022 lúc 04:32 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(1, 'Truyện ngắn'),
(2, 'Tiểu thuyết'),
(3, 'Truyện dài'),
(4, 'Truyện tranh'),
(5, 'Sách chuyên ngành'),
(6, 'Thể loại khác');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `notes` text DEFAULT NULL,
  `total` int(11) NOT NULL,
  `status` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `oder_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quanlity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name_product` text NOT NULL,
  `price` float NOT NULL,
  `image` text NOT NULL,
  `describe_product` text NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `price`, `image`, `describe_product`, `id_category`) VALUES
(1, 'Doraemon tập 10', 23000, '0e3a82153c6bce35977a.jpg', 'Truyện tranh Doraemon', 4),
(2, 'Doraemon tập 3', 23000, 'dbc8a5e41b9ae9c4b08b.jpg', 'Truyện tranh Doraemon', 4),
(3, 'Thần đồng đất việt tập 187', 20000, 'cc4e9761291fdb41820e.jpg', 'Truyện tranh thần đồng đất việt', 1),
(6, 'Tôi có chuyện, bạn có rượu không ?', 120000, '1.jpg', 'Sách là nguồn trí thức vô tận', 2),
(7, 'Sáng hoan ca, chiều thương rượu', 120000, '2.jpg', 'Sách về cuộc sống :))', 2),
(8, 'Sự cô độc của bạn', 150000, '5.jpg', 'Sách cuộc sống', 2),
(9, 'Ở lại thành phố hay về quê ?', 150000, '7.jpg', 'Sách la nguồn tài nguyên vô hạn :))', 2),
(10, 'Ngắm tuổi trẻ quay cuông trong tĩnh lặng', 120000, '8.jpg', 'Sách về cuộc sống', 2),
(11, 'Sống cho hết đời thanh xuân', 120000, '9.jpg', 'Sách triết lý cuộc sống', 2),
(12, 'Đến cỏ dại cũng còn đàng hoàng mà sống', 150000, '11.jpg', 'Sách triết lý anh Huấn', 2),
(13, 'Mọi nỗ lực chờ đợi điều có ý nghĩa', 120000, '13.jpg', 'Sách triết lý cuộc sống', 2),
(14, 'Everything', 120000, '189241.jpg', 'Sách khoa học viễn tưởng', 3),
(15, '17 năm ánh sáng', 230000, '17namanhsang_biaao_tb08-19_toai_2.jpg', 'Truyện tranh Doraemon', 2),
(16, 'Hooked', 290000, '41clybict0l._sx322_bo1_204_203_200_.jpg', 'Truyện tranh Doraemon', 6),
(18, 'Ếch ộp', 80000, '339378.jpg', 'Tuyển tập truyện siêu ngắn ', 1),
(19, 'Debbie Macomber', 293000, '345131.jpg', 'Window on the Bay', 2),
(20, '[Trạng Quỷnh] Một trận dịch', 23000, '9786045292860_1.jpg', 'Truyện tranh Trạng Quỷnh, NXB Kim Đồng', 4),
(21, 'Anh hùng vớt pháo', 23000, 'image_60075.jpg', 'Truyện tranh Thần Đồng Đất Việt, NXB Kim Đồng', 4),
(22, 'Ông nghè thì hỏng', 23000, 'image_79075.jpg', 'Truyện tranh Thần Đồng Đất Việt, NXB Kim Đồng', 4),
(23, 'Measure What Matters', 223000, 'image_178986.jpg', 'Sách triết lý cuộc sống, tác giả John Doerr', 3),
(24, 'The 80/20 Principle', 123000, 'image_180164_1_43_1_57_1_4_1_2_1_210_1_29_1_98_1_25_1_21_1_5_1_3_1_18_1_18_1_45_1_26_1_32_1_14_1_3061.jpg', 'The secret to Achieving More with Less', 3),
(25, 'Way of the wolf', 220000, 'image_189010.jpg', 'Sách trưởng thành, tác giả Jordan Belfort', 6),
(26, 'On Business Model Innovation', 290000, 'image_195509_1_40431.jpg', 'Sách khởi nghiệp ', 5),
(27, 'Mặc Phi Nam Đình Cốc Vĩ tập 1', 30000, 'image_195509_1_41184.jpg', 'Truyện tranh Mac Phi nam đình cốc vĩ tập 1', 4),
(28, '199 mấy hồi ấy làm gì ?', 60000, 'image_195509_1_47301.jpg', 'Truyện ngắn vui nhộn, NXB Kim Đồng', 1),
(29, '2 Together JittiRain', 23000, 'img_2333_2.jpg', 'Truyện tranh 2 Together JittiRain 2', 4),
(30, 'Mặc Phi Nam Đình Cốc Vĩ tập 3', 30000, 'namdinhcocvi3.jpg', 'Truyện tranh Mặc Phi nam đình cốc vĩ tập 3', 4),
(31, 'Think Big', 330000, 'think_big_1_2018_08_21_15_04_15.jpg', 'Sách làm giàu, sách khai mở tư tưởng, sách triết lý, Tác giả cựu tổng thống Mỹ Donal D. Trump', 5),
(32, 'Bad luck tập 4', 35000, 'z2195572060949_16fd5a8d2a94b75ad1a78d178472d384.jpg', 'Truyện ngắn về lứa tuổi học sinh, tác giả Nguyễn Huỳnh Bảo Châu', 1),
(33, 'Well Being', 69000, '8935086827093_1.jpg', 'Truyện dài người thông minh làm thế nào để hạnh phúc', 3),
(34, 'Người gieo hy vọng', 79000, '8936037710068.jpg', 'Truyện dài người gieo hy vọng', 3),
(35, 'Từ hạt cát đến ngọc trai', 100000, '8936067595048_2.jpg', 'Sách triết lý sống tích cực, NXB Thanh Niên', 6),
(36, 'Cảm xúc là kẻ thù số 1 của thành công', 78000, 'am-xuc-2021.jpg', 'Sách triết lý sông tích cực cảm xúc là kẻ thù số 1 của thành công, tác giả TS Lê Thẩm Dương', 6),
(37, 'Cẩm nang phương pháp sư phạm', 40000, 'camnangppsupham.u84.d20161125.t123417.884704.jpg', 'Nhưng phương pháp và ký năng sư phạm hiện đại, hiệu quả từ các chuyên gia Đức và Việt Nam', 5),
(38, 'Cẩm nang tư duy đạo đức', 203000, 'image_119074.jpg', 'Dựa trên các khái niệm và công cụ tư duy phản biện, NXB tổng hợp thành phố Hồ Chí Minh', 6),
(39, 'Đời ngắn đừng ngủ dài', 150000, 'image_180164_1_43_1_57_1_4_1_2_1_210_1_29_1_98_1_25_1_21_1_5_1_3_1_18_1_18_1_45_1_26_1_32_1_14_1_2730.jpg', 'Sách khuyên nhủ cuộc sống tích cực, tác giả ROBIN SHARMA được dịnh bởi Phạm Anh Tuấn', 6),
(40, 'Kinh tế học', 39000, 'image_195509_1_43846.jpg', 'Giáo trình kinh tế học, NXB Tài Chính', 5),
(41, 'Giáo trình điện tử thực hành', 50000, 'image_195509_1_51656.jpg', 'Giáo trình điện tử thực hành, tác giả Nguyễn Vũ Quỳnh, Pham Quang Huy, NXB Thanh Niên', 5),
(42, 'Giáo trình điện tử công suất', 50000, 'image_195509_1_51658.jpg', 'Giáo trình điện tử công suất Mạch điện biến đổi điện áp, NXB Thanh Niên', 5),
(43, 'Giải tích 1', 40000, 'image_229100.jpg', 'Giáo trình toán giải tích, tài liệu tham khảo , sách chuyên ngành', 5),
(44, 'Quản trị tài chính', 39000, 'taichinhqt.jpg', 'Giáo trình quản trị tài chính, sách chuyên ngành , tài liệu tham khảo, NXB Hồng Đức', 5),
(45, 'Ngôi làng cổ mộ', 78000, 'image_195509_1_48419.jpg', 'Truyện kinh dị ngôi làng cổ mộ', 3),
(46, 'Bà nội du học', 89000, 'image_195509_1_35352.jpg', 'Truyện hài bà nội du học, tác giả Lê Lan Anh', 3),
(47, 'Thành ngữ bằng tranh', 19000, 'image_195509_1_30515.jpg', 'Truyện ngắn thành ngũ bằng tranh,NXB Kim Đồng', 1),
(48, 'Sách balo lên mà đi', 120000, 'image_195509_1_22325.jpg', 'Truyện dài sách balo lên và đi', 3),
(49, 'Dành cả thanh xuân để chạy theo idol', 160000, 'image_189098.jpg', 'Tiểu thuyết dành cả thanh xuân để chạy theo idol, tác giả Hồng Trân', 2),
(50, 'Đi bộ xuyên Việt', 90000, 'image_186778.jpg', 'Đi bộ xuyên Việt với cây đàn ghita là 1 cuốn sách nói là về người đã đi bộ xuyên việt và viết lại cuốn sách này', 3),
(51, 'Đất rừng phương Nam', 130000, 'image_67361.jpg', 'Chắc các bạn đã từng coi qua bộ phim đất rừng phương nam của tác giả Đoàn Giỏi', 6),
(52, 'Ông già và biển cả', 70000, '8936067597936.jpg', 'Tiểu thuyết ông già và biển cả, Lê Huy Bắc dịch', 3),
(53, '2 vạn dặm dưới đáy biển', 110000, '8936067595505_1.jpg', 'Truyện dài về hành trình lặn dưới biển của tác giả', 3),
(54, 'Đừng nhạt nữa', 78000, 'image_226024.jpg', 'Truyện ngắn hài hước, NXB Hà Nội', 1),
(59, 'Thần đồng đất việt tập 215', 20000, 'thandongdatviet215.jpg', 'Truyện tranh thần đồng đất việt', 6),
(411, 'Doraemon tập 23', 23000, 'doraemon26.jpg', 'Truyện tranh Doraemon', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `passworduser` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `status_admin` tinyint(4) NOT NULL,
  `create_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `passworduser`, `status`, `status_admin`, `create_time`) VALUES
(17, 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 0, 1, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_ibfk_1` (`iduser`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`oder_id`) USING BTREE;

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`oder_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
