import 'package:flutter/material.dart';
import 'room.dart';
import 'list_room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'NestFinder', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ListRoom roomManager = ListRoom();

  // Các biến điều khiển nhập liệu
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // Hàm hiển thị hộp thoại Thêm hoặc Sửa
  void _showRoomDialog({Room? room}) {
    // Nếu là sửa, nạp dữ liệu cũ vào ô nhập
    if (room != null) {
      _idController.text = room.id;
      _titleController.text = room.title;
      _priceController.text = room.price.toString();
    } else {
      _idController.clear();
      _titleController.clear();
      _priceController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(room == null ? 'Thêm phòng mới' : 'Sửa thông tin'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (room == null)
              TextField(
                controller: _idController,
                decoration: const InputDecoration(labelText: 'Mã ID'),
              ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Tên phòng'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Giá thuê'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (room == null) {
                  // Chức năng CREATE
                  roomManager.addRoom(
                    Room(
                      id: _idController.text,
                      title: _titleController.text,
                      address: 'Địa chỉ mặc định',
                      price: double.tryParse(_priceController.text) ?? 0.0,
                      area: 20.0,
                    ),
                  );
                } else {
                  // Chức năng UPDATE
                  roomManager.editRoom(
                    room.id,
                    _titleController.text,
                    double.tryParse(_priceController.text) ?? 0.0,
                  );
                }
              });
              Navigator.pop(context);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Chức năng READ
    final rooms = roomManager.getAllRooms();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hệ thống NestFinder'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showRoomDialog(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return ListTile(
            title: Text('Phòng: ${room.title} (ID: ${room.id})'),
            subtitle: Text('Giá: ${room.price} VNĐ'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Nút sửa
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showRoomDialog(room: room),
                ),
                // Chức năng DELETE
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      roomManager.deleteRoom(room.id);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
