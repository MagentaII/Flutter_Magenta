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
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: _onItemSelected,
          selectedIndex: currentPageIndex,
          indicatorColor: Colors.transparent,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.apps),
              label: 'Apps',
            ),
            NavigationDestination(
                icon: Icon(Icons.person_rounded), label: 'Profile')
          ]),
    );
  }
}
