import 'package:comics/connectivity/no-internet.dart';
import 'package:comics/screens/compte_screen.dart';
import 'package:comics/screens/home_screen.dart';
import 'package:comics/screens/library_screen.dart';
import 'package:flutter/material.dart';

class UserTabScreen extends StatefulWidget {
  static const routeName = 'UserTabScreen/';

  @override
  _UserTabScreenState createState() => _UserTabScreenState();
}

class _UserTabScreenState extends State<UserTabScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;
  String userId = '';

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(key: PageStorageKey('homeS')),
        'title': 'Explorer',
      },
      {
        'page': LibraryScreen(key: PageStorageKey('libraryS')),
        'title': 'Mes Comics',
      },
      {
        'page': CompteScreen(key: PageStorageKey('compteS')),
        'title': 'Compte',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent[400],
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedPageIndex,
        onTap: (value) {
          setState(() {
            _selectedPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              size: 20,
            ),
            label: 'Explorer',
            activeIcon: Icon(
              Icons.explore,
              size: 20,
            ),
            tooltip: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
              size: 20,
            ),
            activeIcon: Icon(
              Icons.book,
              size: 20,
            ),
            label: 'Mes Comics',
            tooltip: 'Mes Comics',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
              size: 20,
            ),
            activeIcon: Icon(
              Icons.person_rounded,
              size: 20,
            ),
            label: 'Compte',
            tooltip: 'Compte',
          ),
        ],
      ),
    );
  }
}
