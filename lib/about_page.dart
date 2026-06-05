import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Đã chuyển về Màu xanh lá chủ đạo từ thiết kế ảnh gốc
  final Color _primaryColor = const Color(0xFF417529);

  @override
  Widget build(BuildContext context) {
    // Kiểm tra xem có phải màn hình rộng (Desktop/Tablet ngang) hay không
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.white, // Nền trắng
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 40 : 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHeader(isDesktop),
                  SizedBox(height: isDesktop ? 100 : 50),
                  _buildHero(isDesktop),
                  SizedBox(height: isDesktop ? 100 : 50),
                  _buildImageGallery(isDesktop),
                  SizedBox(height: isDesktop ? 80 : 40),
                  _buildContent(isDesktop),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // 1. THANH ĐIỀU HƯỚNG (Header)
  // ==========================================
  Widget _buildHeader(bool isDesktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo và Tên dự án
        Row(
          children: [
            Icon(Icons.real_estate_agent, size: 32, color: _primaryColor),
            const SizedBox(width: 8),
            Text(
              'NestFinder',
              style: TextStyle(
                color: _primaryColor, // Chữ màu xanh lá
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),

        // Menu (Ẩn trên điện thoại để tránh lỗi tràn viền)
        if (isDesktop)
          Row(
            children: [
              _navItem('Trang chủ'),
              _navItem('Phòng trọ'),
              _navItem('Cộng đồng'),
            ],
          ),

        // Nút Liên hệ
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: _primaryColor, // Nền nút xanh lá
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 24 : 16,
              vertical: isDesktop ? 18 : 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Liên hệ nhóm',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87, // Chữ đen
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        child: Text(title),
      ),
    );
  }

  // ==========================================
  // 2. PHẦN TIÊU ĐỀ CHÍNH (Hero Section)
  // ==========================================
  Widget _buildHero(bool isDesktop) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: isDesktop ? 56 : 36, // Chữ nhỏ hơn trên điện thoại
              color: Colors.black, // Chữ đen
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
            children: const [
              TextSpan(text: "Chúng tôi là "),
              TextSpan(
                text: "sinh viên",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              TextSpan(text: ", nhà phát triển, và\n"),
              TextSpan(
                text: "người đồng hành",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              TextSpan(text: " tìm phòng trọ."),
            ],
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: _primaryColor, // Nền nút xanh lá
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Khám phá hệ thống',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  // ==========================================
  // 3. KHUNG ẢNH (Responsive Image Gallery)
  // ==========================================
  Widget _buildImageGallery(bool isDesktop) {
    // Nếu là Desktop: Hiển thị 2 cột ngang. Nếu là Mobile: Hiển thị 1 cột dọc
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: _buildLeftImage()),
          const SizedBox(width: 40),
          Expanded(flex: 6, child: _buildRightImageAndCaption()),
        ],
      );
    } else {
      return Column(
        children: [
          _buildLeftImage(),
          const SizedBox(height: 24),
          _buildRightImageAndCaption(),
        ],
      );
    }
  }

  Widget _buildLeftImage() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Ảnh môi trường sống/Sinh viên',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildRightImageAndCaption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Khoảng trống tạo độ so le chỉ áp dụng trên màn hình lớn
        LayoutBuilder(
          builder: (context, constraints) {
            if (MediaQuery.of(context).size.width > 800) {
              return const SizedBox(height: 80);
            }
            return const SizedBox.shrink();
          },
        ),
        Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Ảnh đội ngũ phát triển',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54, // Chữ đen nhạt
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: "Hà Nội, Việt Nam — ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextSpan(
                text:
                    "Dự án được khởi tạo và phát triển bởi sinh viên từ Hà Nội, với mong muốn xây dựng một cộng đồng thuê trọ minh bạch và an toàn.",
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ==========================================
  // 4. PHẦN NỘI DUNG VĂN BẢN (Responsive Text Content)
  // ==========================================
  Widget _buildContent(bool isDesktop) {
    final titleWidget = Padding(
      padding: EdgeInsets.only(bottom: isDesktop ? 0 : 16.0),
      child: const Text(
        'VỀ DỰ ÁN NESTFINDER',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          color: Colors.black87, // Chữ đen
        ),
      ),
    );

    final bodyWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Chúng tôi tin vào một cộng đồng minh bạch. Sự minh bạch được thể hiện qua:',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            height: 1.6,
          ), // Chữ đen
        ),
        SizedBox(height: 24),
        Text(
          'Mức giá rõ ràng. Vị trí chính xác. Thông tin chủ trọ xác thực. Không có chi phí môi giới ảo. Đánh giá chân thực từ những người đã từng thuê. Môi trường an ninh được đảm bảo.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            height: 1.6,
          ), // Chữ đen
        ),
        SizedBox(height: 24),
        Text(
          'Đội ngũ phát triển dự án:',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87, // Chữ đen
            height: 1.6,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          '1. Hải - MSSV: 23010677\n2. Khánh - MSSV: 22010487\n3. Sơn - MSSV: 23010878',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            height: 1.8,
          ), // Chữ đen
        ),
      ],
    );

    // Xử lý dàn trang: Ngang cho Desktop, Dọc cho Mobile
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: titleWidget),
          Expanded(flex: 9, child: bodyWidget),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleWidget, bodyWidget],
      );
    }
  }
}
