abstract class CountryDetailEvent {
  const CountryDetailEvent();
}

class FetchCountryDetailEvent extends CountryDetailEvent {
  final String countryName;
  
  const FetchCountryDetailEvent(this.countryName);
}
