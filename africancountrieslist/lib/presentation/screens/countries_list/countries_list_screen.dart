import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_constants.dart';
import '../../blocs/countries/countries_bloc.dart';
import '../../blocs/countries/countries_event.dart';
import '../../blocs/countries/countries_state.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_indicator.dart';
import '../country_detail/country_detail_screen.dart';
import 'widgets/country_card.dart';

class CountriesListScreen extends StatelessWidget {
  const CountriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
      ),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesInitial) {
            context.read<CountriesBloc>().add(const FetchCountriesEvent());
            return const LoadingIndicator();
          } else if (state is CountriesLoading) {
            return const LoadingIndicator();
          } else if (state is CountriesLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return CountryCard(
                  country: country,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryDetailScreen(
                          countryName: country.name,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is CountriesError) {
            return ErrorView(
              message: state.message,
              onRetry: () {
                context.read<CountriesBloc>().add(const FetchCountriesEvent());
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
