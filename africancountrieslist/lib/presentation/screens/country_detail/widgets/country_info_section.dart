import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/country.dart';

class CountryInfoSection extends StatelessWidget {
  final Country country;

  const CountryInfoSection({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (country.capital.isNotEmpty) ...[
            _buildInfoTile(
              context,
              title: 'Capital',
              content: country.capital.first,
              icon: Icons.location_city,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
          ],
          if (country.languages.isNotEmpty) ...[
            _buildInfoTile(
              context,
              title: 'Languages',
              content: country.languages.values.join(', '),
              icon: Icons.language,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: AppConstants.defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
