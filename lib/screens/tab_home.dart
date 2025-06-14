import 'package:flutter/material.dart';

class TabHome extends StatelessWidget {
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de continentes
    final continentes = [
      {
        'nombre': 'América del Norte',
        'ruta': '/northAmerica',
        'image': 'assets/icons/north-america.png',      
      },
      {
        'nombre': 'América del Sur',
        'ruta': '/southAmerica',
        'image': 'assets/icons/south-america.png',
      },
      {
        'nombre': 'Europa',
        'ruta': '/europe',
        'image': 'assets/icons/europe.png',
      },
      {
        'nombre': 'Asia',
        'ruta': '/asia',
        'image': 'assets/icons/asia.png',
      },
      {
        'nombre': 'África',
        'ruta': '/africa',
        'image': 'assets/icons/africa.png',
      },
      {
        'nombre': 'Oceanía',
        'ruta': '/oceania',
        'image': 'assets/icons/oceania.png',
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          const Text(
            'Continentes',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Finlandica',
              color: Color.fromARGB(255, 91, 139, 158),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          ...continentes.map((continente) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, continente['ruta'] as String);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 249, 255),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.11),
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Image.asset(
                      continente['image'] as String,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        continente['nombre'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Finlandica',
                          color: Color.fromARGB(255, 30, 110, 142),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}