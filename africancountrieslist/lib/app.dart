import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_constants.dart';
import 'core/themes/app_theme.dart';
import 'data/repositories/countries_repository.dart';
import 'presentation/blocs/countries/countries_bloc.dart';
import 'presentation/screens/countries_list/countries_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CountriesRepository(),
      child: BlocProvider(
        create: (context) => CountriesBloc(
          repository: context.read<CountriesRepository>(),
        ),
        child: MaterialApp(
          title: AppConstants.appTitle,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const CountriesListScreen(),
        ),
      ),
    );
  }
}
