import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:notredame/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prier le Rosaire avec Ozias Ledu'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.all(10.0),
              child: Image.asset('assets/images/cathedrale.jpg')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: maincolor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Mystère',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: maincolor,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else if (index == 1) {
      Navigator.pushNamed(context, '/categories');
    } else {
      Navigator.pushNamed(context, '/contacts');
    }
  }
}
