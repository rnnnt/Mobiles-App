import 'package:app0/api/country_model.dart';
import 'package:app0/api/country_service.dart';
import 'package:flutter/material.dart';

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
         if (selectedCountry1 != null && controller1.text != selectedCountry1!.name) {
      selectedCountry1 = null;
      }
    });
  }

  void _filter2() {
    setState(() {
      filtered2 = allCountries
        .where((c) => c.name.toLowerCase().contains(controller2.text.toLowerCase()))
        .toList();
          if (selectedCountry2 != null && controller2.text != selectedCountry2!.name) {
      selectedCountry2 = null;
      }
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
      appBar: AppBar(
        title: Text('Selecciona los países a comparar', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.white,
        ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child:Column(
                    children: [
                      TextField(
                        controller: controller1,
                        decoration: InputDecoration(
                          labelText: 'Buscar País 1',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      if (controller1.text.isNotEmpty && selectedCountry1 == null)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.black.withOpacity(0.08),
                              ),
                            ],
                          ),
                          constraints: const BoxConstraints(maxHeight: 180),
                          child: ListView(
                            shrinkWrap: true,
                            children: filtered1
                                .map((c) => ListTile(
                                      leading: Image.network(c.flagUrl, width: 32, height: 24, fit: BoxFit.cover),
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
                    Expanded(child: countryCard(selectedCountry1)),
                    ],
                  ),
                   

              ),
              SizedBox(width: 20),
              Expanded(
              child:Column(
                    children: [
                      TextField(
                        controller: controller2,
                        decoration: InputDecoration(
                          labelText: 'Buscar País 2',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      if (controller2.text.isNotEmpty && selectedCountry2 == null)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.black.withOpacity(0.08),
                              ),
                            ],
                          ),
                          constraints: const BoxConstraints(maxHeight: 180),
                          child: ListView(
                            shrinkWrap: true,
                            children: filtered2
                                .map((c) => ListTile(
                                      leading: Image.network(c.flagUrl, width: 32, height: 24, fit: BoxFit.cover),
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
                    Expanded(child: countryCard(selectedCountry2))
                    ],
                  ), 
              ),
            
              ],
          )
        )
      );  
    }
}