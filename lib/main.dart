import 'package:flutter/material.dart';
import 'home_page.dart';
import 'content_page.dart';
import 'about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'NestFinder', home: MainNavigator());
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndexSelected = 0;

  // Danh sách các trang đã được tách file
  final List<Widget> _pages = const [HomePage(), ContentPage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndexSelected, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndexSelected,
        onTap: (index) => setState(() => _currentIndexSelected = index),
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Content", icon: Icon(Icons.article)),
          BottomNavigationBarItem(label: "About", icon: Icon(Icons.info)),
        ],
      ),
    );
  }
}
