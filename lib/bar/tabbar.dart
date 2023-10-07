import 'package:flutter/material.dart';
import 'package:fire_smoke/screan/manual.dart';
import 'package:fire_smoke/screan/prediction.dart';
import 'package:fire_smoke/screan/firepanicle.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Predict(),
    const Manual(),
    RicePanicle(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: const Text('Fire Smoke Classification'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Prediction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Manual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grain),
            label: 'Fire',
          ),
        ],
      ),
    );
  }
}
