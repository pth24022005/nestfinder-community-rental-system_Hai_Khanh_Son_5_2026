import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 40),
            _buildHeroAndForm(context),
            const SizedBox(height: 60),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  // 1. GIAO DIỆN HEADER
  Widget _buildHeader(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 16,
        vertical: 16,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.real_estate_agent, size: 40, color: Colors.black87),
          const SizedBox(width: 16),

          // Dùng Wrap để hiển thị toàn bộ menu, tự động xuống dòng khi màn hình nhỏ
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.end, // các item sang bên phải
              crossAxisAlignment:
                  WrapCrossAlignment.center, // Căn giữa theo chiều dọc
              spacing: 8.0, // Khoảng cách ngang giữa các item
              runSpacing: 12.0, // Khoảng cách dọc khi bị rớt xuống dòng
              children: [
                _navItem('Trang chủ'),
                _navItem('Phòng trọ'),
                _navItem('Cộng đồng'),
                _navItem('Kinh nghiệm'),
                _navItem('Bảng giá'),
                _navItem('Liên hệ'),
                const SizedBox(width: 16), // Khoảng cách tách biệt menu và nút
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Đăng nhập'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF222222),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Đăng ký'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () {
          print('Bạn vừa nhấn vào tab: $title');
        },
        style:
            TextButton.styleFrom(
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ).copyWith(
              overlayColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return Colors.grey.shade200;
                }
                return null;
              }),
            ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // 2. GIAO DIỆN HERO & FORM (Tiêu đề và Biểu mẫu)
  Widget _buildHeroAndForm(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Column(
      children: [
        Text(
          'NestFinder',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isDesktop ? 64 : 40,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF222222),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Hệ thống tìm thuê phòng trọ cộng đồng',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 32 : 20,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 40),

        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 450),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(isDesktop ? 32 : 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Họ và tên', 'Nhập họ và tên của bạn'),
              const SizedBox(height: 20),
              _buildTextField('Số điện thoại', 'Nhập số điện thoại của bạn'),
              const SizedBox(height: 20),
              _buildTextField('Email', 'Nhập địa chỉ email của bạn'),
              const SizedBox(height: 20),
              _buildTextField('Lời nhắn', 'Bạn cần hỗ trợ gì?', maxLines: 4),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF222222),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Gửi', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }

  // 3. GIAO DIỆN FOOTER
  Widget _buildFooter(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: isDesktop ? 60 : 40,
      ),
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        children: [
          SizedBox(
            width: isDesktop ? 300 : double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.real_estate_agent,
                  size: 40,
                  color: Colors.black87,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.network(
                        'web/icons/Screenshot2026_05_06.jpg',
                        width: 35,
                        height: 35,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 35),
                      ),
                    ),
                    _socialIcon(
                      'https://img.icons8.com/ios-filled/50/000000/instagram-new.png',
                    ),
                    _socialIcon(
                      'https://img.icons8.com/ios-filled/50/000000/youtube-play.png',
                    ),
                    _socialIcon(
                      'https://img.icons8.com/ios-filled/50/000000/linkedin.png',
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            width: 150,
            child: _buildFooterColumn('Dịch vụ', [
              'Tìm phòng trọ',
              'Cho thuê phòng',
              'Tìm người ở ghép',
              'Chuyển nhà trọn gói',
              'Dịch vụ vệ sinh',
            ]),
          ),

          SizedBox(
            width: 150,
            child: _buildFooterColumn('Khám phá', [
              'Phòng trọ sinh viên',
              'Chung cư mini',
              'Phòng trọ giá rẻ',
              'Gần trường đại học',
              'Khu vực an ninh',
            ]),
          ),

          SizedBox(
            width: 150,
            child: _buildFooterColumn('Hỗ trợ', [
              'Về chúng tôi',
              'Trung tâm trợ giúp',
              'Cẩm nang thuê phòng',
              'Điều khoản dịch vụ',
              'Chính sách bảo mật',
            ]),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Image.network(
        imageUrl,
        width: 28,
        height: 28,
        color: Colors.black87,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 28),
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              link,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}
