import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/contact_button.dart';
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
              icon: Icons.phone,
              link: 'tel:+98 991 018 7797',
            ),
            ContactButton(
              title: l10n.contactGmail,
              icon: Icons.mail,
              link:
                  'mailto:hasanmahani08@gmail.com?subject=Let\'s work together',
            ),
            ContactButton(
              title: l10n.contactInstagram,
              icon: Icons.camera,
              link: 'https://www.instagram.com/hasanm108',
            ),
            ContactButton(
              title: l10n.contactTelegram,
              icon: Icons.chat,
              link: 'https://t.me/hasanm08',
            ),
            ContactButton(
              title: l10n.contactTwitter,
              icon: Icons.chat,
              link: 'https://twitter.com/hasanm08',
            ),
            ContactButton(
              title: l10n.contactWhatsapp,
              icon: Icons.chat,
              link:
                  'https://api.whatsapp.com/send?phone=+989910187797&text=Let\'s work together&source=&data=&app_absent=',
            ),
            ContactButton(
              title: l10n.contactGithub,
              icon: Icons.code,
              link: 'https://github.com/hasanm08',
            ),
            ContactButton(
              title: l10n.contactGitlab,
              icon: Icons.code,
              link: 'https://gitlab.com/hasanmahani08',
            ),
            ContactButton(
              title: l10n.contactLinkedin,
              icon: Icons.info,
              link: 'https://linkedin.com/in/hasanm08',
            ),
            ContactButton(
              title: l10n.contactStackoverflow,
              icon: Icons.code,
              link: 'https://stackoverflow.com/users/14041364/hasanm08',
            ),
          ],
        ),
      ),
    );
  }
}
