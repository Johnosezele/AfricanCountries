import '../../../data/models/country.dart';

abstract class CountriesState {
  const CountriesState();
}

class CountriesInitial extends CountriesState {
  const CountriesInitial();
}

class CountriesLoading extends CountriesState {
  const CountriesLoading();
}

class CountriesLoaded extends CountriesState {
  final List<Country> countries;
  
  const CountriesLoaded(this.countries);
}

class CountriesError extends CountriesState {
  final String message;
  
  const CountriesError(this.message);
}
