import 'package:flutter/material.dart';
import 'package:lla_app/presentation.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _iconSize = 32.0;
  final List<String> _titles = const [
    'Learning items',
    'Flashcards',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return buildHome();
  }

  Widget buildHome() {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _titles[_currentIndex],
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 24,
              ),
            ),
          ],
        ),
        centerTitle: false,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          LearningItemsScreen(),
          TopicsScreen(),
          Text('Profile'),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  SalomonBottomBar buildBottomNavigationBar() {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      unselectedItemColor: Colors.black.withOpacity(0.7),
      selectedItemColor: AppColors.primary,
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.widgets, size: _iconSize),
          title: const Text("Home"),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.library_books, size: _iconSize),
          title: const Text("Flashcards"),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.person_outline_rounded, size: _iconSize),
          title: const Text("Profile"),
        ),
      ],
    );
  }
}
