import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/country.dart';
import 'detail_section.dart';

class CountryInfoSection extends StatelessWidget {
  final Country country;

  const CountryInfoSection({
    super.key,
    required this.country,
  });

  String _formatNumber(int number) {
  return number.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]},',
  );
}

String _formatArea(double area) {
  return '${_formatNumber(area.round())} km²';
}


@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      children: [
        DetailSection(
          title: 'Basic Information',
          children: [
            DetailItem(
              label: 'Official Name',
              value: country.officialName,
            ),
            DetailItem(
              label: 'Capital',
              value: country.capital.join(', '),
            ),
            DetailItem(
              label: 'Region',
              value: '${country.region}, ${country.subregion}',
            ),
          ],
        ),
        DetailSection(
          title: 'Demographics',
          children: [
            DetailItem(
              label: 'Population',
              value: _formatNumber(country.population),
            ),
            DetailItem(
              label: 'Area',
              value: _formatArea(country.area),
            ),
            DetailItem(
              label: 'Languages',
              value: country.languages.values.join(', '),
            ),
          ],
        ),
        if (country.currency.isNotEmpty)
          DetailSection(
            title: 'Economy',
            children: [
              DetailItem(
                label: 'Currency',
                value: '${country.currency} (${country.currencySymbol})',
              ),
            ],
          ),
        DetailSection(
          title: 'Geography',
          children: [
            DetailItem(
              label: 'Timezones',
              value: country.timezones.join(', '),
            ),
            if (country.borders.isNotEmpty)
              DetailItem(
                label: 'Borders',
                value: country.borders.join(', '),
              ),
            DetailItem(
              label: 'Terrain',
              value: country.landlocked ? 'Landlocked' : 'Coastal',
            ),
          ],
        ),
        if (country.flagDescription.isNotEmpty)
          DetailSection(
            title: 'Flag Description',
            children: [
              Text(
                country.flagDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
      ],
    ),
  );
}
}
