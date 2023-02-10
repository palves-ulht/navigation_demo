import 'package:flutter/material.dart';

import 'pages/chat_page.dart';
import 'pages/favorites_page.dart';
import 'pages/home_page.dart';
import 'pages/person_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 2;
  final screens = [
    HomePage(),
    FavoritesPage(),
    ChatPage(),
    PersonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // don't set appbar here, each page will set its own
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(()  => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ]
      ),
    );
  }
}