# 🏡 NestFinder - Hệ thống Tìm thuê Phòng trọ & Chung cư

Dự án ứng dụng di động/web được xây dựng bằng **Flutter**, hỗ trợ người dùng tìm kiếm và quản lý thông tin phòng trọ, chung cư mini trong khu vực.

## 👥 Thành viên nhóm phát triển (Nhóm 5)
1. **Hải** - MSSV: 23010677
2. **Khánh** - MSSV: 22010487 
3. **Sơn** - MSSV: 23010878

---

## 🚀 Các chức năng chính (CRUD)
Dự án đã triển khai đầy đủ các thao tác quản lý dữ liệu cơ bản (CRUD) áp dụng trên đối tượng `Room` (Phòng trọ):

* **[C]reate (Thêm mới):** Khởi tạo và đăng thông tin phòng trọ mới lên hệ thống thông qua giao diện nhập liệu.
* **[R]ead (Đọc/Hiển thị):** Truy xuất và hiển thị danh sách toàn bộ phòng trọ hiện có bằng giao diện `ListView` trực quan.
* **[U]pdate (Cập nhật):** Chỉnh sửa thông tin phòng (đổi tên phòng, cập nhật lại giá thuê) dựa trên mã ID.
* **[D]elete (Xóa):** Gỡ bỏ một phòng trọ khỏi hệ thống.

---

## 📂 Cấu trúc mã nguồn chính
* `lib/room.dart`: Chứa Lớp (Class) `Room` định nghĩa cấu trúc đối tượng Phòng trọ (gồm ID, tên, địa chỉ, giá, diện tích).
* `lib/list_room.dart`: Chứa Lớp `ListRoom` đóng vai trò là kho lưu trữ dữ liệu tập trung và xử lý các logic Thêm, Sửa, Xóa.
* `lib/main.dart`: Chứa giao diện người dùng (UI) và các chức năng tương tác (Dialog) để gọi tới kho dữ liệu.
