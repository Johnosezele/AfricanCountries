import 'package:flutter/material.dart';
import '../../../../data/models/country.dart';
import '../../../../core/constants/app_constants.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryCard({
    super.key,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppConstants.defaultPadding / 2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppConstants.cardBorderRadius),
              ),
              child: Image.network(
                country.flagUrl,
                height: AppConstants.imageHeight,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    height: AppConstants.imageHeight,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: AppConstants.imageHeight,
                    child: Center(
                      child: Icon(Icons.error_outline),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (country.capital.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Capital: ${country.capital.first}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                  if (country.languages.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Languages: ${country.languages.values.join(", ")}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
