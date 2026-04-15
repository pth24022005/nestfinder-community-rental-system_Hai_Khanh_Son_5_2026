import 'package:flutter/material.dart';

// Khai báo một Lớp (Class) đại diện cho Đối tượng Phòng trọ
class Room {
  final String title;
  final String address;
  final double price;
  final double area;

  Room({
    required this.title,
    required this.address,
    required this.price,
    required this.area,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NestFinder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'NestFinder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Sử dụng List chứa các Đối tượng
  final List<Room> rooms = [
    Room(
      title: 'Phòng trọ sinh viên',
      address: '123 Đường Xuân Thủy, Cầu Giấy, Hà Nội',
      price: 2500000.0,
      area: 20.5,
    ),
    Room(
      title: 'Phòng trọ có ban công',
      address: '456 Đường Nguyễn Trãi, Thanh Xuân, Hà Nội',
      price: 3200000.0,
      area: 25.0,
    ),
    Room(
      title: 'Chung cư mini',
      address: '789 Đường Hồ Tùng Mậu, Nam Từ Liêm, Hà Nội',
      price: 4500000.0,
      area: 30.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          //hiển thị dữ liệu theo dạng hàng
          children: <Widget>[
            // Dùng vòng lặp for để duyệt qua List và in ra các phần tử
            for (var room in rooms)
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                // Gộp 4 thông tin vào 1 widget
                child: Text(
                  'Tiêu đề: ${room.title}\nĐịa chỉ: ${room.address}\nGiá thuê: ${room.price} VNĐ/tháng\nDiện tích: ${room.area} m²',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
