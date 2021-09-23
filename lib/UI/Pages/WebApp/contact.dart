import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/ContactButton.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          ContactButton(
              title: "Make a Call",
              icon: Icons.phone,
              link: 'tel:+98 991 018 7797'),
          ContactButton(
              title: "Gmail",
              icon: Icons.mail,
              link:
                  'mailto:hasanmahani08@gmail.com?subject=Let\'s work together'),
          ContactButton(
              title: "Instagram",
              icon: Icons.camera,
              link: 'https://www.instagram.com/hasanm108'),
          ContactButton(
              title: "Telegram",
              icon: Icons.chat,
              link: 'https://t.me/hasanm08'),
          ContactButton(
              title: "Twitter",
              icon: Icons.chat,
              link: 'https://twitter.com/hasanm08'),
          ContactButton(
              title: "Whatsapp",
              icon: Icons.chat,
              link:
                  'https://api.whatsapp.com/send?phone=+989910187797&text=Let\'s work together&source=&data=&app_absent='),
          ContactButton(
              title: "GitHub",
              icon: Icons.code,
              link: 'https://github.com/hasanm08'),
          ContactButton(
              title: "GitLab",
              icon: Icons.code,
              link: 'https://gitlab.com/hasanmahani08'),
          ContactButton(
              title: "LinkedIn",
              icon: Icons.info,
              link: 'https://linkedin.com/in/hasanm08')
        ],
      ),
    );
  }
}
