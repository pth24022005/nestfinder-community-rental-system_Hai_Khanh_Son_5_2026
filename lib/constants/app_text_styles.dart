import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const logo = TextStyle(
    color: AppColors.primary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const navLink = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );
  static const pageTitle = TextStyle(
    fontSize: 52,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: -1,
  );
  static const sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );
  static const body = TextStyle(fontSize: 16, color: Colors.black87, height: 1.6);
  static const caption = TextStyle(fontSize: 13, color: Colors.black54, height: 1.5);
  static const label = TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black87);
  static const buttonLabel = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white);
  static const itemName  = TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const itemPrice = TextStyle(fontSize: 15, color: AppColors.primary, fontWeight: FontWeight.w600);
  static const itemTotal = TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textDark);
}
