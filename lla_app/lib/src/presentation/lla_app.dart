import 'package:flutter/material.dart';
import 'package:lla_app/presentation.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LLAApp extends StatefulWidget {
  const LLAApp({Key? key}) : super(key: key);

  @override
  State<LLAApp> createState() => _LLAAppState();
}

class _LLAAppState extends State<LLAApp> {
  int _currentIndex = 0;
  final _iconSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LLA App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Learning items'),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            LearningItemsScreen(),
            Text('Likes'),
            Text('Profile'),
          ],
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
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
      selectedItemColor: Colors.purple,
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
