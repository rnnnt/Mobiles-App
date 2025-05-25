import 'package:flutter/material.dart';
import 'package:app0/api/country_favorite.dart';

class TabFavorite extends StatelessWidget {
  const TabFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = CountryFavorites.favorites;

    if (favorites.isEmpty) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'No hay favoritos',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    
    return Container(
      color: Colors.white, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 24, bottom: 8),
            child: Text(
              'Favoritos:  ${favorites.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final country = favorites[index];
                return Container(
                  height: 140,
                  margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          country.flagUrl,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.12),
                        ),
                        Center(
                          child: Text(
                            country.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 60,
                                  color: Color.fromARGB(255, 55, 55, 55),
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}