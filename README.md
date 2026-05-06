#  NestFinder - Hệ thống Tìm thuê Phòng trọ & Chung cư

Dự án ứng dụng di động/web được xây dựng bằng **Flutter**, hỗ trợ người dùng tìm kiếm và quản lý thông tin phòng trọ, chung cư mini trong khu vực.

##  Thành viên nhóm phát triển 
1. **Hải** - MSSV: 23010677
2. **Khánh** - MSSV: 22010487 (Phụ trách phát triển Trang chủ - `home_page.dart`)
3. **Sơn** - MSSV: 23010878 (Phụ trách phát triển Trang giới thiệu - `about_page.dart`)

##  Các chức năng chính (CRUD)
Dự án đã triển khai đầy đủ các thao tác quản lý dữ liệu cơ bản (CRUD) áp dụng trên đối tượng `Room` (Phòng trọ):

* **[C]reate (Thêm mới):** Khởi tạo và đăng thông tin phòng trọ mới lên hệ thống thông qua giao diện nhập liệu.
* **[R]ead (Đọc/Hiển thị):** Truy xuất và hiển thị danh sách toàn bộ phòng trọ hiện có bằng giao diện `ListView` trực quan.
* **[U]pdate (Cập nhật):** Chỉnh sửa thông tin phòng (đổi tên phòng, cập nhật lại giá thuê) dựa trên mã ID.
* **[D]elete (Xóa):** Gỡ bỏ một phòng trọ khỏi hệ thống.

##  Cấu trúc mã nguồn chính
* `lib/room.dart`: Chứa Lớp (Class) `Room` định nghĩa cấu trúc đối tượng Phòng trọ (gồm ID, tên, địa chỉ, giá, diện tích).
* `lib/list_room.dart`: Chứa Lớp `ListRoom` đóng vai trò là kho lưu trữ dữ liệu tập trung và xử lý các logic Thêm, Sửa, Xóa.
* `lib/main.dart`: Cấu hình ứng dụng chính và thiết lập thanh điều hướng dưới cùng (BottomNavigationBar).
* `lib/home_page.dart`: Chứa giao diện chính hiển thị danh sách phòng trọ và các hộp thoại (Dialog) để Thêm, Sửa, Xóa.
* `lib/content_page.dart`: Hiển thị các bài viết chia sẻ kinh nghiệm thuê phòng.
* `lib/about_page.dart`: Hiển thị thông tin giới thiệu về ứng dụng và danh sách thành viên nhóm phát triển.

##  Tiến độ cập nhật giao diện
* Hiện tại, `home_page.dart` đã được nâng cấp thành một **Landing Page (Trang chủ)** với thiết kế Responsive (tự động co giãn), hiển thị tốt trên cả nền tảng Web và thiết bị di động.
* Giao diện được bổ sung đầy đủ thanh điều hướng (Header), Form liên hệ và Chân trang (Footer).
* Trang **Giới thiệu (`about_page.dart`)** cũng đã được hoàn thiện với thiết kế Responsive, hiển thị thông tin chi tiết về dự án NestFinder, danh sách thành viên nhóm và mô tả các chức năng cốt lõi.
