import 'package:app0/screens/africa.dart';
import 'package:app0/screens/asia.dart';
import 'package:app0/screens/bottom_nav.dart';
import 'package:app0/screens/oceania.dart';
import 'package:app0/screens/southAmerica.dart';
import 'package:app0/screens/north_america.dart';
import 'package:app0/screens/europe.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App0',
      
      routes: {
        '/': (context) => BottomNav(),
        '/northAmerica': (context) => NorthAmerica(),
        '/southAmerica': (context) => SouthAmerica(),
        '/europe': (context) => Europe(),
        '/asia': (context) => Asia(),
        '/africa': (context) => Africa(),
        '/oceania': (context) => Oceania(),
        
      },
      initialRoute: '/',
      // Cambia la ruta inicial a la pantalla de introducción
    );
  }
}
