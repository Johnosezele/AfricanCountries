import '../../../data/models/country.dart';

abstract class CountryDetailState {
  const CountryDetailState();
}

class CountryDetailInitial extends CountryDetailState {
  const CountryDetailInitial();
}

class CountryDetailLoading extends CountryDetailState {
  const CountryDetailLoading();
}

class CountryDetailLoaded extends CountryDetailState {
  final Country country;
  
  const CountryDetailLoaded(this.country);
}

class CountryDetailError extends CountryDetailState {
  final String message;
  
  const CountryDetailError(this.message);
}
