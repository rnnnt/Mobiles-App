import 'dart:convert';
import 'package:http/http.dart' as http;
import 'country_model.dart';

class CountryService {
  static Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar países');
    }
  }
}