import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../router/app_router.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: AppColors.white,
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
                  _buildHeader(context, isDesktop),
                  SizedBox(height: isDesktop ? 100 : 50),
                  _buildHero(context, isDesktop),
                  SizedBox(height: isDesktop ? 100 : 50),
                  _buildImageGallery(context, isDesktop),
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

  // ─── 1. HEADER ────────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context, bool isDesktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo → về trang chủ
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRouter.home),
          child: Row(
            children: [
              Icon(Icons.real_estate_agent, size: 32, color: AppColors.primary),
              const SizedBox(width: 8),
              const Text('NestFinder', style: AppTextStyles.logo),
            ],
          ),
        ),

        // Menu (chỉ hiện trên desktop)
        if (isDesktop)
          Row(
            children: [
              _navItem(context, 'Trang chủ', AppRouter.home),
              _navItem(context, 'Phòng trọ', AppRouter.basket),
              _navItem(context, 'Cộng đồng', AppRouter.home),
            ],
          ),

        // Nút Liên hệ → về home (có form)
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, AppRouter.home),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 24 : 16,
              vertical: isDesktop ? 18 : 12,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 0,
          ),
          child: const Text('Liên hệ nhóm',
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }

  Widget _navItem(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, route),
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
          textStyle: AppTextStyles.navLink,
        ),
        child: Text(title),
      ),
    );
  }

  // ─── 2. HERO ──────────────────────────────────────────────────────
  Widget _buildHero(BuildContext context, bool isDesktop) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: isDesktop ? 56 : 36,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
            children: const [
              TextSpan(text: "Chúng tôi là "),
              TextSpan(text: "sinh viên",
                  style: TextStyle(fontStyle: FontStyle.italic)),
              TextSpan(text: ", nhà phát triển, và\n"),
              TextSpan(text: "người đồng hành",
                  style: TextStyle(fontStyle: FontStyle.italic)),
              TextSpan(text: " tìm phòng trọ."),
            ],
          ),
        ),
        const SizedBox(height: 40),
        // Nút → sang màn hình phòng trọ/basket
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, AppRouter.basket),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 0,
          ),
          child: const Text('Khám phá hệ thống',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }

  // ─── 3. IMAGE GALLERY ─────────────────────────────────────────────
  Widget _buildImageGallery(BuildContext context, bool isDesktop) {
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: _buildLeftImage()),
          const SizedBox(width: 40),
          Expanded(flex: 6, child: _buildRightImageAndCaption(context)),
        ],
      );
    }
    return Column(
      children: [
        _buildLeftImage(),
        const SizedBox(height: 24),
        _buildRightImageAndCaption(context),
      ],
    );
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
        child: Text('Ảnh môi trường sống / Sinh viên',
            style: TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget _buildRightImageAndCaption(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (MediaQuery.of(context).size.width > 800) const SizedBox(height: 80),
        Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text('Ảnh đội ngũ phát triển',
                style: TextStyle(color: Colors.grey)),
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: const TextSpan(
            style: AppTextStyles.caption,
            children: [
              TextSpan(
                text: "Hà Nội, Việt Nam — ",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
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

  // ─── 4. CONTENT ───────────────────────────────────────────────────
  Widget _buildContent(bool isDesktop) {
    final titleWidget = Padding(
      padding: EdgeInsets.only(bottom: isDesktop ? 0 : 16.0),
      child: const Text(
        'VỀ DỰ ÁN NESTFINDER',
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: Colors.black87),
      ),
    );

    final bodyWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Chúng tôi tin vào một cộng đồng minh bạch. Sự minh bạch được thể hiện qua:',
          style: AppTextStyles.body,
        ),
        SizedBox(height: 24),
        Text(
          'Mức giá rõ ràng. Vị trí chính xác. Thông tin chủ trọ xác thực. Không có chi phí môi giới ảo. Đánh giá chân thực từ những người đã từng thuê. Môi trường an ninh được đảm bảo.',
          style: AppTextStyles.body,
        ),
        SizedBox(height: 24),
        Text('Đội ngũ phát triển dự án:',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.6,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Text(
          '1. Hải  - MSSV: 23010677\n2. Khánh - MSSV: 22010487\n3. Sơn  - MSSV: 23010878',
          style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.8),
        ),
      ],
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: titleWidget),
          Expanded(flex: 9, child: bodyWidget),
        ],
      );
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleWidget, bodyWidget]);
  }
}
