class Country {
  final String name;
  final List<String> capital;
  final Map<String, String> languages;
  final String flagUrl;

  Country({
    required this.name,
    required this.capital,
    required this.languages,
    required this.flagUrl,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] as String,
      capital: List<String>.from(json['capital'] ?? []),
      languages: Map<String, String>.from(json['languages'] ?? {}),
      flagUrl: json['flags']['png'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': {'common': name},
    'capital': capital,
    'languages': languages,
    'flags': {'png': flagUrl},
  };
}
