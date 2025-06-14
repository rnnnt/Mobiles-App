import 'package:travelin/screens/africa.dart';
import 'package:travelin/screens/asia.dart';
import 'package:travelin/screens/bottom_nav.dart';
import 'package:travelin/screens/login.dart';
import 'package:travelin/screens/oceania.dart';
import 'package:travelin/screens/southAmerica.dart';
import 'package:travelin/screens/north_america.dart';
import 'package:travelin/screens/europe.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travelin',
      
      routes: {
        '/': (context) => LoginScreen(),
        '/bottomNav': (context) => BottomNav(),
        '/northAmerica': (context) => NorthAmerica(),
        '/southAmerica': (context) => SouthAmerica(),
        '/europe': (context) => Europe(),
        '/asia': (context) => Asia(),
        '/africa': (context) => Africa(),
        '/oceania': (context) => Oceania(),
        
      },
      initialRoute: '/',
    );
  }
}

// No leí la rúbrica :(