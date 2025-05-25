class Country {
  final String name;
  final String region;
  final String subregion;
  final String flagUrl;
  final String capital;
  final int population;
  final double area;
  final List<String> languages;
  final String currency;
  final String currencySymbol;
  final String demonym;
  final List<String> timezones;
  final String ccn3;
  final String startOfWeek;
  final String regionBlocs;
  final String status;
  final bool independent;

  Country({
    required this.name, 
    required this.region, 
    required this.subregion, 
    required this.flagUrl,
    required this.capital,
    required this.population,
    required this.area,
    required this.languages,
    required this.currency,
    required this.currencySymbol,
    required this.demonym,
    required this.timezones,
    required this.ccn3,
    required this.startOfWeek,
    required this.regionBlocs,
    required this.status,
    required this.independent,    
    });

  factory Country.fromJson(Map<String, dynamic> json) {
    // Idiomas
    List<String> langs = [];
    if (json['languages'] != null) {
      langs = (json['languages'] as Map<String, dynamic>).values.map((e) => e.toString()).toList();
    }

    // Moneda
    String coin = '';
    String coinSymbol = '';
    if (json['currencies'] != null) {
      var coinMap = json['currencies'] as Map<String, dynamic>;
      if (coinMap.isNotEmpty) {
        var first = coinMap.values.first;
        coin = coinMap.values.first['name'] ?? 'No currency';
        coinSymbol = first['symbol'] ?? 'No symbol';
      }
    }

    // Demonym
    String demonym = '';
    if (json['demonyms'] != null && json['demonyms']['eng'] != null) {
      demonym = json['demonyms']['eng']['m'] ?? '';
    }

    // Tiempo en la zona
    List<String> timezones = [];
    if (json['timezones'] != null) {
      timezones = List<String>.from(json['timezones']);
    }

    return Country(
      name: json['name']['common'] ?? 'No name',
      region: json['region'] ?? 'No region',
      subregion: json['subregion'] ?? 'No subregion',
      flagUrl: json['flags']?['png'] ?? '',
      capital: (json['capital'] != null && (json['capital'] as List).isNotEmpty)
          ? json['capital'][0] ?? 'No capital'
          : 'No capital',
      population: json['population'] ?? 0,
      area: (json['area'] ?? 0.0).toDouble(),
      languages: langs,
      currency: coin,
      currencySymbol: coinSymbol,
      demonym: demonym,
      timezones: timezones,
      ccn3: json['ccn3'] ?? 'No ccn3',
      startOfWeek: json['startOfWeek'] ?? 'No startOfWeek',
      regionBlocs: (json['regionalBlocs'] != null && (json['regionalBlocs'] as List).isNotEmpty)
          ? json['regionalBlocs'][0]
          : 'No regionBlocs',
      status: json['status'] ?? 'No status',
      independent: json['independent'] ?? false,
    );
  }
}