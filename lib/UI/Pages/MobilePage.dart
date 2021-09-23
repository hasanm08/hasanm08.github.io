import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/ContactButton.dart';

class MobilePage extends StatelessWidget {
  MobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          cacheExtent: 3,
          children: [
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/hasanm108.jpg"),
                        fit: BoxFit.contain)),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Amir Hassan AmirMahani",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: "Pacifico"),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Text(
                  "Flutter Developer",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Exo2",
                      letterSpacing: 8),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Text(
                  "C# Developer",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Exo2",
                      letterSpacing: 8),
                ),
              ),
            ),
            Container(
              width: 300,
              child: Divider(
                endIndent: 12,
                thickness: 1,
                indent: 12,
                color: Colors.black26,
              ),
            ),
            Center(
              child: Wrap(
                children: [
                  ContactButton(
                      color: Colors.black,
                      title: "Make a Call",
                      icon: Icons.phone,
                      link: 'tel:+98 991 018 7797'),
                  ContactButton(
                      color: Colors.black,
                      title: "Gmail",
                      icon: Icons.mail,
                      link:
                          'mailto:hasanmahani08@gmail.com?subject=Let\'s work together'),
                  ContactButton(
                      color: Colors.black,
                      title: "Instagram",
                      icon: Icons.camera,
                      link: 'https://www.instagram.com/hasanm108'),
                  ContactButton(
                      color: Colors.black,
                      title: "Telegram",
                      icon: Icons.chat,
                      link: 'https://t.me/hasanm08'),
                  ContactButton(
                      color: Colors.black,
                      title: "Twitter",
                      icon: Icons.chat,
                      link: 'https://twitter.com/hasanm08'),
                  ContactButton(
                      color: Colors.black,
                      title: "Whatsapp",
                      icon: Icons.chat,
                      link:
                          'https://api.whatsapp.com/send?phone=+989910187797&text=Let\'s work together&source=&data=&app_absent='),
                  ContactButton(
                      color: Colors.black,
                      title: "GitHub",
                      icon: Icons.code,
                      link: 'https://github.com/hasanm08'),
                  ContactButton(
                      color: Colors.black,
                      title: "GitLab",
                      icon: Icons.code,
                      link: 'https://gitlab.com/hasanmahani08'),
                  ContactButton(
                      color: Colors.black,
                      title: "LinkedIn",
                      icon: Icons.info,
                      link: 'https://linkedin.com/in/hasanm08'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
