

import 'package:flutter/material.dart';
import 'package:musicmodel/features/favoutitePage.dart';
import 'package:musicmodel/features/homePage.dart';
import 'package:musicmodel/features/profilePage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
     var _pages = [
    HomePage(),
    FavouritePage(),
    ProfilePage()
    ];
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
           selectedItemColor: Colors.white60,
          unselectedItemColor: Colors.white60,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.black54,  
          currentIndex: _selectedindex,
          onTap: (index) => setState(() => _selectedindex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
           
          ]),
    );

    
  }
}