import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giới thiệu ứng dụng')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Logo và Tên dự án
            const Icon(Icons.real_estate_agent, size: 80, color: Colors.grey),
            const SizedBox(height: 10),
            const Text(
              'Dự án NestFinder',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('Hệ thống tìm thuê phòng trọ cộng đồng'),
            const SizedBox(height: 30),

            // Danh sách thành viên nhóm
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Thành viên nhóm phát triển:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Hải'),
                subtitle: Text('Mã SV: 23010677'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Khánh'),
                subtitle: Text('Mã SV: 22010487'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Sơn'),
                subtitle: Text('Mã SV: 23010878'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
