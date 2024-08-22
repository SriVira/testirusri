import 'package:flutter/material.dart';
import 'package:testirusri/models/countries_model.dart';
import 'package:testirusri/widgets/image/primary_network_image.dart';
import 'package:testirusri/widgets/text/primary_text.dart';
import 'package:testirusri/widgets/text/secondary_text.dart';

class CountryListItem extends StatelessWidget {
  final CountriesModel country;
  const CountryListItem({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PrimaryNetworkImage(
        imageUrl: country.flags.png,
        width: 100,
        fit: BoxFit.fill,
      ),
      title: PrimaryText(
        text: country.name.common,
        fontSize: 16,
      ),
      subtitle: SecondaryText(
        text: country.capital.isNotEmpty ? country.capital[0] : "None",
        fontSize: 14,
      ),
    );
  }
}
