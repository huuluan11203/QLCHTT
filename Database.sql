
--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `account`
--

INSERT INTO `account` VALUES ('5d9ed8aa-e23c-4f85-815c-98847542aaee','admin','$2a$10$H3IykkeWkabJTcF6FZK7GOf/oSCjCTuzYoTpRAp9E6tDu4o4V9sOe'),
('7c156707-1339-4e1c-803e-fca68b072b89','employee','$2a$10$KCT7IDkNgX.9Z/FZDxOnJuDP3tK0DBcQDZiV9uqQAeCUxakmVXAe2');


--
-- Table structure for table `invalidated_token`
--

DROP TABLE IF EXISTS `invalidated_token`;
CREATE TABLE `invalidated_token` (
  `id` varchar(255) NOT NULL,
  `expiry_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `permission`
--


INSERT INTO `permission` VALUES ('admin_full_access','Toàn quyền truy cập vào hệ thống.'),
('employee_add_product','Thêm sản phẩm mới'),
('employee_delete_product','Xóa sản phẩm'),
('employee_delete_shift','Xóa ca làm'),
('employee_edit_product','Chỉnh sửa thông tin sản phẩm'),
('employee_edit_shift','Chỉnh sửa ca làm'),
('employee_manage_inventory','Quản lý tồn kho (Bao gồm nhập, xuất hàng)'),
('employee_schedule_shift','Lập lịch ca làm cho nhân viên'),
('employee_update_order','Cập nhật trạng thái đơn hàng'),
('employee_view_customers','Xem thông tin khách hàng'),
('employee_view_orders','Xem danh sách đơn hàng'),
('employee_view_products','Xem danh sách sản phẩm'),
('employee_view_reports','Xem báo cáo bán hàng'),
('employee_view_shifts','Xem danh sách ca làm'),
('user_add_to_cart','Thêm sản phẩm vào giỏ hàng.'),
('user_checkout','Thanh toán và hoàn tất đơn hàng.'),
('user_create_order','Đặt hàng mới.'),
('user_edit_profile','Chỉnh sửa thông tin hồ sơ cá nhân'),
('user_rate_product','Đánh giá sản phẩm.'),
('user_remove_from_cart','Xóa sản phẩm khỏi giỏ hàng.'),
('user_request_return','Yêu cầu trả lại sản phẩm.'),
('user_view_cart','Xem giỏ hàng.'),
('user_view_order_details','Xem thông tin chi tiết đơn hàng'),
('user_view_order_history','Xem lịch sử đặt hàng.'),
('user_view_product','Xem danh sách sản phẩm.'),
('user_view_product_details','Xem chi tiết sản phẩm'),
('user_view_profile','Xem thông tin hồ sơ cá nhân'),
('user_view_promotions','Xem các chương trình khuyến mãi');


--
-- Table structure for table `position`
--


DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `position`
--


INSERT INTO `position` VALUES ('Accountant','Quản lý tài chính, hạch toán các giao dịch và theo dõi thu chi trong cửa hàng.',50000.00),
('Cashier','Xử lý các giao dịch thanh toán của khách hàng.',50000.00),
('Manager','Chịu trách nhiệm quản lý toàn bộ hoạt động của cửa hàng',50000.00),
('Sales_Associate','Thực hiện việc bán hàng, tư vấn cho khách hàng và chăm sóc khách hàng tại cửa hàng.',50000.00),
('Warehouse_Staff','Quản lý kho hàng, sắp xếp, kiểm tra hàng hóa và đảm bảo tồn kho chính xác.',50000.00);


--
-- Table structure for table `role`
--


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `role`
--


INSERT INTO `role` VALUES ('ADMIN','Admin role'),
('EMPLOYEE','Employee role'),
('USER','User role');


--
-- Table structure for table `user`
--


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `cic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('FEMALE','MALE','OTHER') DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE','SUSPENDED') DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`cic`),
  UNIQUE KEY (`phone_number`),
  KEY `fk_user_position` (`position`),
  CONSTRAINT `fk_account_user` FOREIGN KEY (`id`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_position` FOREIGN KEY (`position`) REFERENCES `position` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `user`
--


INSERT INTO `user` VALUES ('5d9ed8aa-e23c-4f85-815c-98847542aaee','Luân','Bùi Hữu','2003-10-14','083203011547','MALE','0878678691','2023-01-01','ACTIVE','Manager'),
('7c156707-1339-4e1c-803e-fca68b072b89','Xuân Mai','Nguyễn Thị','2004-04-23','092304002482','FEMALE','0363645182','2023-01-01','ACTIVE','Sales_Associate');


--
-- Table structure for table `account_roles`
--

DROP TABLE IF EXISTS `account_roles`;
CREATE TABLE `account_roles` (
  `account_id` varchar(255) NOT NULL,
  `roles_name` varchar(255) NOT NULL,
  PRIMARY KEY (`account_id`,`roles_name`),
  KEY `roles_name` (`roles_name`),
  CONSTRAINT `account_roles_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_roles_ibfk_2` FOREIGN KEY (`roles_name`) REFERENCES `role` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `account_roles`
--


INSERT INTO `account_roles` VALUES ('5d9ed8aa-e23c-4f85-815c-98847542aaee','ADMIN'),('7c156707-1339-4e1c-803e-fca68b072b89','EMPLOYEE');


--
-- Table structure for table `role_permissions`
--


DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `role_name` varchar(255) NOT NULL,
  `permission_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_name`,`permission_name`),
  KEY `fk_permission` (`permission_name`),
  CONSTRAINT `fk_permission` FOREIGN KEY (`permission_name`) REFERENCES `permission` (`name`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_name`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `role_permissions`
--


INSERT INTO `role_permissions` VALUES ('ADMIN','admin_full_access'),
('EMPLOYEE','employee_add_product'),
('EMPLOYEE','employee_delete_product'),
('EMPLOYEE','employee_delete_shift'),
('EMPLOYEE','employee_edit_product'),
('EMPLOYEE','employee_edit_shift'),
('EMPLOYEE','employee_manage_inventory'),
('EMPLOYEE','employee_schedule_shift'),
('EMPLOYEE','employee_update_order'),
('EMPLOYEE','employee_view_customers'),
('EMPLOYEE','employee_view_orders'),
('EMPLOYEE','employee_view_products'),
('EMPLOYEE','employee_view_reports'),
('EMPLOYEE','employee_view_shifts'),
('USER','user_add_to_cart'),
('USER','user_checkout'),
('USER','user_create_order'),
('USER','user_edit_profile'),
('USER','user_rate_product'),
('USER','user_remove_from_cart'),
('USER','user_request_return'),
('USER','user_view_cart'),
('USER','user_view_order_details'),
('USER','user_view_order_history'),
('USER','user_view_product'),
('USER','user_view_product_details'),
('USER','user_view_profile'),
('USER','user_view_promotions');



