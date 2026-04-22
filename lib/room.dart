class Room {
  String id;
  String title;
  String address;
  double price;
  double area;
  bool isRented; // Thêm trạng thái để biết phòng đã có người thuê chưa

  Room({
    required this.id,
    required this.title,
    required this.address,
    required this.price,
    required this.area,
    this.isRented =
        false, // Mặc định phòng mới tạo là chưa có người thuê (trống)
  });

  // Hành động 1: Người dùng chốt thuê phòng này
  void rentRoom() {
    if (!isRented) {
      isRented = true;
      print('Xác nhận: Bạn đã thuê thành công "$title"');
    } else {
      print('Xin lỗi: "$title" đã có người thuê mất rồi.');
    }
  }

  // Hành động 2: Chủ trọ muốn giảm giá/tăng giá phòng
  void updatePrice(double newPrice) {
    price = newPrice;
    print('Cập nhật: Giá mới của "$title" là $price VNĐ.');
  }

  // Hành động 3: Trả phòng
  void checkoutRoom() {
    isRented = false;
    print('Xác nhận: Đã trả phòng "$title", phòng hiện đang trống.');
  }
}
