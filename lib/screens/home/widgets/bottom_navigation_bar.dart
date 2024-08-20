import 'package:flutter/material.dart';
import 'package:flutter_magenta/screens/home/views/profile_view.dart';

import '../views/home_view.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentPageIndex = 0;

  final List<Widget> _page = [
    const HomeView(),
    const ProfileView(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: _page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemSelected,
        currentIndex: currentPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apps_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.apps_rounded,
              size: 32,
            ),
            label: 'Apps',
            backgroundColor: Colors.transparent, // 取消背景色
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.person_rounded,
              size: 32,
            ),
            label: 'Profile',
            backgroundColor: Colors.transparent, // 取消背景色
          ),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 16), // 設定選中狀態的文字大小
        unselectedLabelStyle: const TextStyle(fontSize: 14), // 設定未選中狀態的文字大小
      ),
    );
  }
}
