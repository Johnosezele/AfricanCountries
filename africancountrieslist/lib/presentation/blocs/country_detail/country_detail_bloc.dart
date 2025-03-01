import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/countries_repository.dart';
import 'country_detail_event.dart';
import 'country_detail_state.dart';

class CountryDetailBloc extends Bloc<CountryDetailEvent, CountryDetailState> {
  final CountriesRepository _repository;

  CountryDetailBloc({required CountriesRepository repository})
      : _repository = repository,
        super(const CountryDetailInitial()) {
    on<FetchCountryDetailEvent>(_onFetchCountryDetail);
  }

  Future<void> _onFetchCountryDetail(
    FetchCountryDetailEvent event,
    Emitter<CountryDetailState> emit,
  ) async {
    try {
      emit(const CountryDetailLoading());
      final country = await _repository.getCountryByName(event.countryName);
      emit(CountryDetailLoaded(country));
    } catch (e) {
      emit(CountryDetailError(e.toString()));
    }
  }
}
