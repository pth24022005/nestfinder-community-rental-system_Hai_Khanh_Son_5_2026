import 'package:flutter/material.dart';
import '../models/basket_item.dart';
import '../widgets/item_card.dart';
import '../widgets/order_summary.dart';

class BasketScreen extends StatelessWidget {
  BasketScreen({super.key});

  // Mock data phù hợp với ngữ cảnh phòng trọ
  final List<RoomItem> mockRooms = [
    RoomItem(
      id: '1',
      title: 'Phòng trọ khép kín 25m2 - Yên Nghĩa, Hà Đông',
      location: 'Hà Đông, Hà Nội',
      pricePerMonth: 2500000,
      rentalMonths: 3,
      imageUrl: 'https://via.placeholder.com/150', // Thay bằng ảnh thật
    ),
    RoomItem(
      id: '2',
      title: 'Căn hộ mini Full đồ - Cầu Giấy',
      location: 'Cầu Giấy, Hà Nội',
      pricePerMonth: 4500000,
      rentalMonths: 6,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Tính toán tổng tiền
    final subtotal = mockRooms.fold(0.0, (sum, item) => sum + item.totalLinePrice);
    final deposit = mockRooms.fold(0.0, (sum, item) => sum + item.pricePerMonth); // Giả sử cọc 1 tháng cho mỗi phòng

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Danh sách chờ đặt',
          style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              '${mockRooms.length} phòng',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive: Nếu màn hình rộng (Tablet/Web) thì xếp ngang, nếu nhỏ (Mobile) thì xếp dọc
          if (constraints.maxWidth > 800) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: mockRooms.length,
                      itemBuilder: (context, index) => RoomItemCard(room: mockRooms[index]),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    flex: 1,
                    child: OrderSummary(
                      subtotal: subtotal,
                      serviceFee: 150000, // Hardcode phí dịch vụ
                      deposit: deposit,
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Layout cho Mobile
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ...mockRooms.map((room) => RoomItemCard(room: room)),
                const SizedBox(height: 24),
                OrderSummary(
                  subtotal: subtotal,
                  serviceFee: 150000,
                  deposit: deposit,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}