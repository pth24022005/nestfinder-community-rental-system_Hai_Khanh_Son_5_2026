class RoomItem {
  final String id;
  final String title;
  final String location;
  final double pricePerMonth; // Giá mỗi tháng
  final int rentalMonths; // Số tháng định thuê
  final String imageUrl;

  RoomItem({
    required this.id,
    required this.title,
    required this.location,
    required this.pricePerMonth,
    required this.rentalMonths,
    required this.imageUrl,
  });

  double get totalLinePrice => pricePerMonth * rentalMonths;
}