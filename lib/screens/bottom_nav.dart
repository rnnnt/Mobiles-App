import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelin/screens/tab_favorite.dart';
import 'package:travelin/screens/tab_home.dart';
import 'package:travelin/screens/tab_compare.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int _currentIndex = 0;
  final List<Map<String, dynamic>> _page = [
    {'page': TabHome(), 'text': 'Inicio', 'color':0xff009688,'icon': Icons.home_rounded},
    {'page': TabFavorite(), 'text': 'Favoritos', 'color':0xffd19402, 'icon': Icons.favorite}, //change color to teal
    {'page': TabCompare(), 'text': 'Comparar', 'color':0xff003366, 'icon': Icons.compare}, //change color to navy blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_currentIndex]['text'], 
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Finlandica',
          color: (Colors.white)),
          ),
        centerTitle: true,
        backgroundColor: Color(_page[_currentIndex]['color']),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50)
          ),
        ),
        actions: [ // Botón de cerrar sesión
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            iconSize: 30,
            tooltip: 'Cerrar sesión',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          SizedBox(width: 19) // Espacio entre el botón y el borde dereccho
        ],
      ),
      body: _page[_currentIndex]['page'],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40)
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: [
          BottomNavigationBarItem(
            icon: Icon(_page[0]['icon']),
            label: _page[0]['text'],
            backgroundColor: Color(_page[0]['color']),
            ),

          BottomNavigationBarItem(
            icon: Icon(_page[1]['icon']),
            label: _page[1]['text'],
            backgroundColor: Color(_page[1]['color']),
            ),
          
          BottomNavigationBarItem(
            icon: Icon(_page[2]['icon']),
            label: _page[2]['text'],
            backgroundColor: Color(_page[2]['color']),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          ),
        ),
    );
  }
}
