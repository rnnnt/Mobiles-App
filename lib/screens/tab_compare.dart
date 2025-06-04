import 'package:app0/api/country_model.dart';
import 'package:app0/api/country_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabCompare extends StatefulWidget {
  const TabCompare({super.key});

  @override
  State<TabCompare> createState() => _TabCompareState();
}

class _TabCompareState extends State<TabCompare> {

  Country? selectedCountry1;
  Country? selectedCountry2;
  List<Country> allCountries = [];
  List<Country> filtered1 = [];
  List<Country> filtered2 = [];
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  //***** */
    void resetComparison() {
    setState(() {
      selectedCountry1 = null;
      selectedCountry2 = null;
      controller1.clear();
      controller2.clear();
      filtered1 = allCountries;
      filtered2 = allCountries;
    });
  }

  @override
  void initState() {
    super.initState();
    CountryService.fetchCountries().then((countries) {
      setState(() {
        allCountries = countries;
        filtered1 = countries;
        filtered2 = countries;
      });
    });
    controller1.addListener(_filter1);
    controller2.addListener(_filter2);
  }

  void _filter1() {
    setState(() {
      filtered1 = allCountries
        .where((c) => c.name.toLowerCase().contains(controller1.text.toLowerCase()))
        .toList();
    });
  }

  void _filter2() {
    setState(() {
      filtered2 = allCountries
        .where((c) => c.name.toLowerCase().contains(controller2.text.toLowerCase()))
        .toList();
    });
  }

  Widget countryCard(Country? country) {
    if (country == null) {
      return const SizedBox.shrink();
    }
    return Card(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8), // 12 30
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Image.network(country.flagUrl, width: 60, height: 40, fit: BoxFit.cover,),
              const SizedBox(width: 12),
              Text(
                country.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Capital: ${country.capital}'),
                    Text('Región: ${country.region}'),
                    Text('Subregion: ${country.subregion}'),
                    Text('Población: ${country.population}'),
                    Text('Área: ${country.area} km²'),
                    Text('Idioma(s): ${country.languages.join(', ')}'),
                    Text('Moneda: ${country.currency}'),
                    Text('Símbolo: ${country.currencySymbol}'),
                    Text('Gentilicio: ${country.demonym}'),
                    Text('Zona horaria: ${country.timezones.join(', ')}'),
                    Text('Código de país: ${country.ccn3}'),
                    Text('Día de inicio de la semana: ${country.startOfWeek}'),
                    Text('Bloques de región: ${country.regionBlocs}'),
                    Text('Estado: ${country.status}'),
                    Text('Independiente: ${country.independent ? 'Sí' : 'No'}'),
                  ],
              )
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.white,
    body: allCountries.isEmpty
      ? const Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                        SizedBox(
                          height: 90,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(0.14),
                                  offset: const Offset(0, 4),
                                  spreadRadius: 0.0,
                                ),
                              ]
                            ),
                            child: TextField(
                              controller: controller1,
                              decoration: InputDecoration(
                                hintText: 'Buscar país 1',
                                hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.all(15),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset('assets/icons/Search.svg'),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

            Align(
  alignment: Alignment.centerRight,
  child: ElevatedButton.icon(
    onPressed: resetComparison,
    icon: const Icon(Icons.refresh),
    label: const Text("Nueva comparación"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
),

const SizedBox(height: 24),

                        if (controller1.text.isNotEmpty && selectedCountry1 == null)
                          Positioned(
                            top: 60,
                            left: 0,
                            right: 0,
                            child: Material(
                              color: const Color(0xFFE3F2FD),
                              elevation: 8,
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                height: 150,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: filtered1
                                      .map((c) => ListTile(
                                            leading: Image.network(c.flagUrl, width: 40, height: 30, fit: BoxFit.cover),
                                            title: Text(c.name),
                                            onTap: () {
                                              setState(() {
                                                selectedCountry1 = c;
                                                controller1.text = c.name;
                                              });
                                            },
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: 90,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black.withOpacity(0.14),
                                offset: const Offset(0, 4),
                                spreadRadius: 0.0,
                              ),
                            ]
                          ),
                          child: TextField(
                            controller: controller2,
                            decoration: InputDecoration(
                              hintText: 'Buscar país 2',
                              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(15),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset('assets/icons/Search.svg'),
                                ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (controller2.text.isNotEmpty && selectedCountry2 == null)
                          Positioned(
                            top: 60,
                            left: 0,
                            right: 0,
                            child: Material(
                              color: const Color(0xFFE3F2FD),
                              elevation: 8,
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                height: 150,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: filtered2
                                      .map((c) => ListTile(
                                            leading: Image.network(c.flagUrl, width: 40, height: 30, fit: BoxFit.cover),
                                            title: Text(c.name),
                                            onTap: () {
                                              setState(() {
                                                selectedCountry2 = c;
                                                controller2.text = c.name;
                                              });
                                            },
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: countryCard(selectedCountry1)),
                Expanded(child: countryCard(selectedCountry2)),
              ],

            ),
            
          ],
        ),
      ),
    );
  }
}