import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/contact_button.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Access Source in:"),
        ContactButton(
            icon: Icons.code,
            link: 'https://github.com/hasanm08/hasanm08.github.io',
            title: 'Github Repo')
      ],
    );
  }
}
