import 'room.dart';

class ListRoom {
  // Khởi tạo sẵn 3 bản ghi
  List<Room> rooms = [
    Room(
      id: 'R01',
      title: 'Phòng trọ sinh viên',
      address: '123 Đường Xuân Thủy, Cầu Giấy, Hà Nội',
      price: 2500000.0,
      area: 20.5,
    ),
    Room(
      id: 'R02',
      title: 'Phòng trọ có ban công',
      address: '456 Đường Nguyễn Trãi, Thanh Xuân, Hà Nội',
      price: 3200000.0,
      area: 25.0,
    ),
    Room(
      id: 'R03',
      title: 'Chung cư mini',
      address: '789 Đường Hồ Tùng Mậu, Nam Từ Liêm, Hà Nội',
      price: 4500000.0,
      area: 30.0,
    ),
  ];

  // 1. CREATE: Thêm 1 phòng mới vào biến rooms
  void addRoom(Room newRoom) {
    rooms.add(newRoom);
  }

  // 2. READ: Trả về toàn bộ danh sách trong biến rooms
  List<Room> getAllRooms() {
    return rooms;
  }

  // 3. UPDATE: Sửa thông tin phòng theo ID
  void editRoom(String id, String newTitle, double newPrice) {
    for (int i = 0; i < rooms.length; i++) {
      if (rooms[i].id == id) {
        rooms[i].title = newTitle;
        rooms[i].price = newPrice;
        return;
      }
    }
  }

  // 4. DELETE: Xóa phòng theo ID
  void deleteRoom(String id) {
    rooms.removeWhere((room) => room.id == id);
  }
}
