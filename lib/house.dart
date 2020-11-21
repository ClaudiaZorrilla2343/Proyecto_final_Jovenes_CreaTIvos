import 'package:flutter/material.dart';
import 'package:proyecto_final/notas.dart';
import 'package:proyecto_final/perfil.dart';

class House extends StatefulWidget {
  @override
  _HouseState createState() => _HouseState();
}

class _HouseState extends State<House> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Notas(),
    Perfil(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              icon: Icon(Icons.calendar_today, color: Colors.white),
              label: ("Notas")),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.perm_identity,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.perm_identity,
              color: Colors.white,
              size: 30.0,
            ),
            label: ("Perfil"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        backgroundColor: Colors.orange[600],
      ),
    );
  }
}
