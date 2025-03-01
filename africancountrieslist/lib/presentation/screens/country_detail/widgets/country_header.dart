import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/country.dart';

class CountryHeader extends StatelessWidget {
  final Country country;

  const CountryHeader({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          country.flagUrl,
          height: AppConstants.imageHeight * 1.5,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Text(
              country.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
