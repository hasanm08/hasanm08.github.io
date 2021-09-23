import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Access Source in:")),
        TextButton(
          onPressed: () async =>
              await _showUrl('https://github.com/hasanm08/hasanm08.github.io'),
          child: Text(
            "https://github.com/hasanm08/hasanm08.github.io",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.blue, decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  Future<void> _showUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
