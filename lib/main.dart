import 'package:flutter/material.dart';
import 'router/app_router.dart';

void main() => runApp(const NestFinderApp());

class NestFinderApp extends StatelessWidget {
  const NestFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NestFinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF417529)),
        useMaterial3: true,
      ),
      initialRoute: AppRouter.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
