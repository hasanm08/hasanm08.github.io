import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/contact_button.dart';
import 'package:hasanm08/UI/Components/contact_logos.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:hasanm08/l10n/app_localizations.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: PortfolioStaggeredWrap(
          alignment: WrapAlignment.center,
          children: [
            ContactButton(
              title: l10n.contactCall,
              logo: ContactLogos.phone,
              link: 'tel:+98 991 018 7797',
            ),
            ContactButton(
              title: l10n.contactGmail,
              logo: ContactLogos.gmail,
              link:
                  'mailto:hasanmahani08@gmail.com?subject=Let\'s work together',
            ),
            ContactButton(
              title: l10n.contactInstagram,
              logo: ContactLogos.instagram,
              link: 'https://www.instagram.com/hasanm108',
            ),
            ContactButton(
              title: l10n.contactYoutube,
              logo: ContactLogos.youtube,
              link: 'https://www.youtube.com/channel/UCIEB6as7fm5lsAm_naQ8kyA',
            ),
            ContactButton(
              title: l10n.contactTelegram,
              logo: ContactLogos.telegram,
              link: 'https://t.me/hasanm08',
            ),
            ContactButton(
              title: l10n.contactTwitter,
              logo: ContactLogos.x,
              link: 'https://twitter.com/hasanm08',
            ),
            ContactButton(
              title: l10n.contactWhatsapp,
              logo: ContactLogos.whatsapp,
              link:
                  'https://api.whatsapp.com/send?phone=+989910187797&text=Let\'s work together&source=&data=&app_absent=',
            ),
            ContactButton(
              title: l10n.contactGithub,
              logo: ContactLogos.github,
              link: 'https://github.com/hasanm08',
            ),
            ContactButton(
              title: l10n.contactGitlab,
              logo: ContactLogos.gitlab,
              link: 'https://gitlab.com/hasanmahani08',
            ),
            ContactButton(
              title: l10n.contactLinkedin,
              logo: ContactLogos.linkedin,
              link: 'https://linkedin.com/in/hasanm08',
            ),
            ContactButton(
              title: l10n.contactStackoverflow,
              logo: ContactLogos.stackoverflow,
              link: 'https://stackoverflow.com/users/14041364/hasanm08',
            ),
          ],
        ),
      ),
    );
  }
}
