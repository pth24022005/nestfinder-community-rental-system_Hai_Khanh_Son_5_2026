import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRouter {
  AppRouter._();

  static const home   = '/';
  static const about  = '/about';
  static const basket = '/basket';
  // Thêm route mới ở đây:
  // static const rooms   = '/rooms';
  // static const profile = '/profile';

  static const initial = home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _fade(const HomeScreen());
      case about:
        return _fade(const AboutScreen());
      case basket:
        return _fade( BasketScreen());
      default:
        return _fade(const HomeScreen());
    }
  }

  static PageRouteBuilder _fade(Widget page) => PageRouteBuilder(
        pageBuilder: (_, _, _) => page,
        transitionsBuilder: (_, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 200),
      );
}
