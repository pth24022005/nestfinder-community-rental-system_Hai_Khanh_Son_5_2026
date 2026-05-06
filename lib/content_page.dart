import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kinh nghiệm thuê phòng')),
      // Dùng ListView để danh sách có thể cuộn được
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.article),
              title: Text('Cách kiểm tra hợp đồng thuê nhà'),
              subtitle: Text(
                'Đọc kỹ các điều khoản về tiền cọc và chi phí phát sinh trước khi ký.',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.article),
              title: Text('Mẹo kiểm tra điện nước'),
              subtitle: Text(
                'Nên kiểm tra công tơ điện nước và các vòi nước xem có rò rỉ không.',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.article),
              title: Text('An ninh khu vực'),
              subtitle: Text(
                'Hỏi thăm người dân xung quanh về tình hình an ninh, ngập lụt khi mưa lớn.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
