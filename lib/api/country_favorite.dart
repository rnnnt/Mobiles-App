import 'package:travelin/api/country_model.dart';

class CountryFavorites {
  static final List<Country> favorites = [];
  static void add(Country country) {
    if (!favorites.any((c) => c.name == country.name)) {
      favorites.add(country);
    }
  }
  static void remove(Country country) {
    favorites.removeWhere((c) => c.name == country.name);
  }
}