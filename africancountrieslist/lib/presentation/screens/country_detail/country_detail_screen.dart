import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/countries_repository.dart';
import '../../blocs/country_detail/country_detail_bloc.dart';
import '../../blocs/country_detail/country_detail_event.dart';
import '../../blocs/country_detail/country_detail_state.dart';
import '../../widgets/error_dialog.dart';
import '../../widgets/loading_indicator.dart';
import 'widgets/country_header.dart';
import 'widgets/country_info_section.dart';

class CountryDetailScreen extends StatelessWidget {
  final String countryName;

  const CountryDetailScreen({
    super.key,
    required this.countryName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryDetailBloc(
        repository: context.read<CountriesRepository>(),
      )..add(FetchCountryDetailEvent(countryName)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(countryName),
        ),
        body: BlocBuilder<CountryDetailBloc, CountryDetailState>(
          builder: (context, state) {
            if (state is CountryDetailLoading) {
              return const LoadingIndicator();
            } else if (state is CountryDetailLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CountryHeader(country: state.country),
                    CountryInfoSection(country: state.country),
                  ],
                ),
              );
            } else if (state is CountryDetailError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ErrorDialog.show(
                  context,
                  title: 'Country Information Unavailable',
                  message: state.message,
                  onRetry: () {
                    context
                        .read<CountryDetailBloc>()
                        .add(FetchCountryDetailEvent(countryName));
                  },
                );
              });
              return const SizedBox.shrink();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
