import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Colors.teal,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Icon(
                      Icons.public,
                      size: 400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Travelin',
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 60,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2, 4),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.teal,
        padding: const EdgeInsets.only(bottom: 64.0, top: 16.0, left: 24.0, right: 24.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/bottomNav');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 229, 239, 239), // Color del botón
            padding: const EdgeInsets.symmetric(horizontal: 40),
            minimumSize: const Size.fromHeight(70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: const Text(
            'Explorar el mundo',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Lobster',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}