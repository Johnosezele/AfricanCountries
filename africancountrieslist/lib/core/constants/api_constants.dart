class ApiConstants {
  static const String baseUrl = 'https://restcountries.com/v3.1';
  static const String africaRegionEndpoint = '$baseUrl/region/africa';
  static const String countryByNameEndpoint = '$baseUrl/name';
  
  static String getCountryByName(String name) => '$countryByNameEndpoint/$name';
  
  static const Map<String, String> defaultFields = {
    'fields': 'name,languages,capital,flags,population,area,currencies,region,subregion,timezones,borders,maps,landlocked'
  };
}
