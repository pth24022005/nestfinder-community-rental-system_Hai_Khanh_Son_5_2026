import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
// Vẫn giữ import router của bạn

void main() async {
  // 1. Khởi tạo Firebase trước khi chạy app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const NestFinderApp());
}

class NestFinderApp extends StatelessWidget {
  const NestFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NestFinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF417529)),
        useMaterial3: true,
      ),
      // Tạm thời ẩn Router gốc để ưu tiên hiển thị màn hình bài tập CRUD
      // initialRoute: AppRouter.initial,
      // onGenerateRoute: AppRouter.onGenerateRoute,
      
      // Chạy thẳng vào giao diện CRUD
      home: const RoomListPage(), 
    );
  }
}

// ==========================================================
// PHẦN THỰC HÀNH CRUD THEO YÊU CẦU ĐỀ BÀI
// ==========================================================

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  // Bảng dữ liệu 'phong_tro' trên Firebase Firestore
  final CollectionReference _rooms = FirebaseFirestore.instance.collection('phong_tro');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // HÀM CREATE & UPDATE
  void _showForm([DocumentSnapshot? documentSnapshot]) {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['ten_phong'];
      _priceController.text = documentSnapshot['gia_thue'].toString();
    } else {
      _nameController.clear();
      _priceController.clear();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Tên phòng'),
              ),
              TextField(
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Giá thuê (VNĐ)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF417529),
                  foregroundColor: Colors.white,
                ),
                child: Text(documentSnapshot == null ? 'Thêm mới' : 'Cập nhật'),
                onPressed: () async {
                  final String name = _nameController.text;
                  final double? price = double.tryParse(_priceController.text);
                  
                  if (name.isNotEmpty && price != null) {
                    if (documentSnapshot == null) {
                      await _rooms.add({"ten_phong": name, "gia_thue": price});
                    } else {
                      await _rooms.doc(documentSnapshot.id).update({"ten_phong": name, "gia_thue": price});
                    }
                    _nameController.clear();
                    _priceController.clear();
                    if (context.mounted) Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  // HÀM DELETE
  Future<void> _deleteRoom(String productId) async {
    await _rooms.doc(productId).delete();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã xóa phòng trọ thành công!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Phòng Trọ (CRUD)', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF417529),
      ),
      // HÀM READ
      body: StreamBuilder(
        stream: _rooms.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      documentSnapshot['ten_phong'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Giá: ${documentSnapshot['gia_thue']} VNĐ'),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _showForm(documentSnapshot),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteRoom(documentSnapshot.id),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF417529),
        foregroundColor: Colors.white,
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}