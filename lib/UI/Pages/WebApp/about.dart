import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/custom_animated_3d_card.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:hasanm08/l10n/app_localizations.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final years = DateTime.now().year - 1999;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: PortfolioStaggeredColumn(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              height: 250,
              width: 500,
              child: CustomAnimated3DCard(
                characterImage: 'assets/images/hasanm308.png',
                coverImage: 'assets/images/hasanm308.jpeg',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Amir Hassan Amirmahani',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: scheme.onSurface,
                fontFamily: 'kalame',
              ),
            ),
          ),
          SizedBox(
            width: 400,
            child: Divider(
              endIndent: 12,
              thickness: 1,
              indent: 12,
              color: scheme.outlineVariant,
            ),
          ),
          infoRow(
            l10n.ageLabel,
            '$years ${l10n.yearsSuffix}',
            context,
          ),
          infoRow(l10n.countryLabel, l10n.countryValue, context),
          infoRow(l10n.cityLabel, l10n.cityValue, context),
          infoRow(l10n.educationLabel, l10n.educationValue, context),
          infoRow(
            l10n.juliaAgeLabel,
            '${DateTime.now().year - 2020} ${l10n.yearsSuffix}',
            context,
          ),
          infoRow(
            l10n.flutterAgeLabel,
            '${DateTime.now().year - 2019} ${l10n.yearsSuffix}',
            context,
          ),
          infoRow(
            l10n.arduinoAgeLabel,
            '${DateTime.now().year - 2018} ${l10n.yearsSuffix}',
            context,
          ),
          infoRow(
            l10n.pythonAgeLabel,
            '${DateTime.now().year - 2018} ${l10n.yearsSuffix}',
            context,
          ),
          infoRow(
            l10n.csharpAgeLabel,
            '${DateTime.now().year - 2017} ${l10n.yearsSuffix}',
            context,
          ),
        ],
      ),
    );
  }

  Widget infoRow(String title, String description, BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurface,
                    fontFamily: About.l10nFont(context),
                  ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(
              description,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.85),
                    fontFamily: About.l10nFont(context),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  static String l10nFont(BuildContext context) {
    return AppLocalizations.of(context).isFa ? 'kalame' : 'Exo2';
  }
}
