import 'dart:async';
import 'package:flutter/material.dart';
import '../countries_list/countries_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CountriesListScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/animations/map_of_africa_gif.gif',
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            const SizedBox(height: 24),
            // Text(
            //   'African Countries',
            //   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            //         fontWeight: FontWeight.bold,
            //       ),
            // ),
          ],
        ),
      ),
    );
  }
}
