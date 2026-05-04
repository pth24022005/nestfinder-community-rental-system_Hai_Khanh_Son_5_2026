import 'package:flutter/material.dart';
import 'room.dart';
import 'list_room.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ListRoom roomManager = ListRoom();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void _showRoomDialog({Room? room}) {
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
        title: Text(room == null ? 'Thêm phòng' : 'Sửa phòng'),
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
                  roomManager.addRoom(
                    Room(
                      id: _idController.text,
                      title: _titleController.text,
                      address: 'Chưa cập nhật',
                      price: double.tryParse(_priceController.text) ?? 0,
                      area: 0,
                    ),
                  );
                } else {
                  roomManager.editRoom(
                    room.id,
                    _titleController.text,
                    double.tryParse(_priceController.text) ?? 0,
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
    final rooms = roomManager.getAllRooms();
    return Scaffold(
      appBar: AppBar(title: const Text('NestFinder')),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return ListTile(
            title: Text('${room.title} (ID: ${room.id})'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Giá: ${room.price} VNĐ'),
                Text(
                  room.isRented ? 'Trạng thái: Đã thuê' : 'Trạng thái: Trống',
                  style: TextStyle(
                    color: room.isRented ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(room.isRented ? Icons.cancel : Icons.check_circle),
                  color: room.isRented ? Colors.orange : Colors.green,
                  tooltip: room.isRented ? 'Trả phòng' : 'Thuê phòng',
                  onPressed: () {
                    setState(() {
                      room.isRented ? room.checkoutRoom() : room.rentRoom();
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showRoomDialog(room: room),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      setState(() => roomManager.deleteRoom(room.id)),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showRoomDialog(),
        tooltip: 'Thêm phòng mới',
        child: const Icon(Icons.add),
      ),
    );
  }
}
