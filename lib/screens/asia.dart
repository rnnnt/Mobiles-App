import 'package:app0/api/country_favorite.dart';
import 'package:flutter/material.dart';
import 'package:app0/api/country_model.dart';
import 'package:app0/api/country_service.dart';

class Asia extends StatefulWidget {
  const Asia({super.key});

  @override
  State<Asia> createState() => _AsiaState();
}

class _AsiaState extends State<Asia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            children: [
              // Imagen de fondo
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/back_asia.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Botón y título alineados arriba
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    icon: const Icon(
                      Icons.arrow_back, 
                      color: Colors.white, 
                      size: 32, 
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8, right: 16, bottom: 12),
                    child: Text(
                      'Ásia',
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Finlandica',
                        shadows: [
                          Shadow(
                            blurRadius: 30,
                            color: Colors.black,
                            offset: Offset(2, 2),
                          ),
                        ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: FutureBuilder<List<Country>>(
        future: CountryService.fetchCountries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay países'));
          }
          // Filtra solo los países de América del Norte
          final countries = snapshot.data!
              .where((c) => (c.subregion).contains('Asia'))
              .toList();
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              final isFavorite = CountryFavorites.favorites.any((c) => c.name == country.name);
              // Verifica si el país ya está en favoritos
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(2, 2),
                      spreadRadius: 0.0
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Image.network(country.flagUrl, width: 65, height: 40, fit: BoxFit.cover),
                  title: Text(
                    country.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Capital: ${country.capital}'),
                      Text('Región: ${country.region}'),
                      Text('Subregión: ${country.subregion}'),
                      Text('Población: ${country.population}'),
                      Text('Área: ${country.area} km²'),
                      Text('Idiomas: ${country.languages.join(', ')}'),
                      Text('Moneda: ${country.currency}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      ),
                    onPressed: () {
                      setState(() {
                        if (isFavorite) {
                          CountryFavorites.remove(country);
                        }
                        else {
                          CountryFavorites.add(country);
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isFavorite
                              ? '${country.name} eliminado de favoritos'
                              : '${country.name} agregado a favoritos',
                            ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}