class Country {
  final String name;
  final String officialName;
  final List<String> capital;
  final Map<String, String> languages;
  final String flagUrl;
  final String region;
  final String subregion;
  final List<String> borders;
  final int population;
  final double area;
  final String currency;
  final String currencySymbol;
  final List<String> timezones;
  final bool landlocked;
  final String flagDescription;
  final String googleMapsUrl;

  Country({
    required this.name,
    required this.officialName,
    required this.capital,
    required this.languages,
    required this.flagUrl,
    required this.region,
    required this.subregion,
    required this.borders,
    required this.population,
    required this.area,
    required this.currency,
    required this.currencySymbol,
    required this.timezones,
    required this.landlocked,
    required this.flagDescription,
    required this.googleMapsUrl,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> name = json['name'] as Map<String, dynamic>? ?? {};
    final Map<String, dynamic>? currencies = json['currencies'] as Map<String, dynamic>?;
    final firstCurrency = currencies?.entries.firstOrNull;
    final Map<String, dynamic> flags = json['flags'] as Map<String, dynamic>? ?? {};
    final Map<String, dynamic> maps = json['maps'] as Map<String, dynamic>? ?? {};

    return Country(
      name: name['common'] as String? ?? '',
      officialName: name['official'] as String? ?? '',
      capital: List<String>.from(json['capital'] ?? []),
      languages: Map<String, String>.from(json['languages'] ?? {}),
      flagUrl: flags['png'] as String? ?? '',
      region: json['region'] as String? ?? '',
      subregion: json['subregion'] as String? ?? '',
      borders: List<String>.from(json['borders'] ?? []),
      population: json['population'] as int? ?? 0,
      area: (json['area'] as num?)?.toDouble() ?? 0.0,
      currency: firstCurrency?.value['name'] as String? ?? '',
      currencySymbol: firstCurrency?.value['symbol'] as String? ?? '',
      timezones: List<String>.from(json['timezones'] ?? []),
      landlocked: json['landlocked'] as bool? ?? false,
      flagDescription: flags['alt'] as String? ?? '',
      googleMapsUrl: maps['googleMaps'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': {
      'common': name,
      'official': officialName,
    },
    'capital': capital,
    'languages': languages,
    'flags': {
      'png': flagUrl,
      'alt': flagDescription,
    },
    'region': region,
    'subregion': subregion,
    'borders': borders,
    'population': population,
    'area': area,
    'currencies': currency.isNotEmpty ? {
      'code': {
        'name': currency,
        'symbol': currencySymbol,
      }
    } : {},
    'timezones': timezones,
    'landlocked': landlocked,
    'maps': {
      'googleMaps': googleMapsUrl,
    },
  };
}
