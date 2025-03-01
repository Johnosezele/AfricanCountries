import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/countries_repository.dart';
import 'countries_event.dart';
import 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountriesRepository _repository;

  CountriesBloc({required CountriesRepository repository})
      : _repository = repository,
        super(const CountriesInitial()) {
    on<FetchCountriesEvent>(_onFetchCountries);
  }

  Future<void> _onFetchCountries(
    FetchCountriesEvent event,
    Emitter<CountriesState> emit,
  ) async {
    try {
      emit(const CountriesLoading());
      final countries = await _repository.getAfricanCountries();
      emit(CountriesLoaded(countries));
    } catch (e) {
      emit(CountriesError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _repository.dispose();
    return super.close();
  }
}
