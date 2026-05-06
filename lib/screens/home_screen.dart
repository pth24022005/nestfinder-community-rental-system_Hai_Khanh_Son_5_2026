import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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

  // ─── 1. HEADER ────────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 16, vertical: 16),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo → về trang chủ
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRouter.home),
            child: const Icon(Icons.real_estate_agent, size: 40, color: Colors.black87),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8.0,
              runSpacing: 12.0,
              children: [
                _navItem(context, 'Trang chủ',  AppRouter.home),
                _navItem(context, 'Phòng trọ',  AppRouter.basket),   // ← tuỳ chỉnh route
                _navItem(context, 'Cộng đồng',  AppRouter.home),
                _navItem(context, 'Kinh nghiệm', AppRouter.home),
                _navItem(context, 'Bảng giá',   AppRouter.home),
                _navItem(context, 'Liên hệ',    AppRouter.about),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {/* TODO: Đăng nhập */},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Đăng nhập'),
                ),
                ElevatedButton(
                  onPressed: () {/* TODO: Đăng ký */},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.dark,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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

  // Nút nav có Navigator.pushNamed
  Widget _navItem(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, route),
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => states.contains(WidgetState.hovered) ? Colors.grey.shade200 : null,
          ),
        ),
        child: Text(title, style: AppTextStyles.navLink),
      ),
    );
  }

  // ─── 2. HERO & FORM ───────────────────────────────────────────────
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
            color: AppColors.dark,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Hệ thống tìm thuê phòng trọ cộng đồng',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isDesktop ? 32 : 20, color: Colors.black54),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 450),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(isDesktop ? 32 : 24),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 5)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Họ và tên',     'Nhập họ và tên của bạn'),
              const SizedBox(height: 20),
              _buildTextField('Số điện thoại', 'Nhập số điện thoại của bạn'),
              const SizedBox(height: 20),
              _buildTextField('Email',          'Nhập địa chỉ email của bạn'),
              const SizedBox(height: 20),
              _buildTextField('Lời nhắn',       'Bạn cần hỗ trợ gì?', maxLines: 4),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {/* TODO: Gửi form */},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.dark,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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

  // ─── 3. FOOTER ────────────────────────────────────────────────────
  Widget _buildFooter(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      color: AppColors.white,
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
                const Icon(Icons.real_estate_agent, size: 40, color: Colors.black87),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _socialIcon('https://img.icons8.com/ios-filled/50/000000/facebook.png'),
                    _socialIcon('https://img.icons8.com/ios-filled/50/000000/instagram-new.png'),
                    _socialIcon('https://img.icons8.com/ios-filled/50/000000/youtube-play.png'),
                    _socialIcon('https://img.icons8.com/ios-filled/50/000000/linkedin.png'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: _buildFooterColumn(context, 'Dịch vụ', [
              ('Tìm phòng trọ',       AppRouter.basket),
              ('Cho thuê phòng',      AppRouter.basket),
              ('Tìm người ở ghép',    AppRouter.basket),
              ('Chuyển nhà trọn gói', AppRouter.home),
              ('Dịch vụ vệ sinh',     AppRouter.home),
            ]),
          ),
          SizedBox(
            width: 150,
            child: _buildFooterColumn(context, 'Khám phá', [
              ('Phòng trọ sinh viên', AppRouter.basket),
              ('Chung cư mini',       AppRouter.basket),
              ('Phòng trọ giá rẻ',   AppRouter.basket),
              ('Gần trường đại học',  AppRouter.basket),
              ('Khu vực an ninh',     AppRouter.basket),
            ]),
          ),
          SizedBox(
            width: 150,
            child: _buildFooterColumn(context, 'Hỗ trợ', [
              ('Về chúng tôi',        AppRouter.about),
              ('Trung tâm trợ giúp',  AppRouter.home),
              ('Cẩm nang thuê phòng', AppRouter.home),
              ('Điều khoản dịch vụ',  AppRouter.home),
              ('Chính sách bảo mật',  AppRouter.home),
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
        errorBuilder: (_, __, ___) => const Icon(Icons.link, size: 28),
      ),
    );
  }

  Widget _buildFooterColumn(
    BuildContext context,
    String title,
    List<(String, String)> links,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
        const SizedBox(height: 20),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, link.$2),
              child: Text(link.$1,
                  style: const TextStyle(fontSize: 15, color: Colors.black87)),
            ),
          ),
        ),
      ],
    );
  }
}
