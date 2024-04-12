import 'package:flutter/material.dart';
import 'package:hasanm08/Utils/example_utils.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Currently Watched items",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Spacer(),
              Text("VIEW ALL",
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).primaryColor))
            ],
          ),
        ),
        SizedBox(
          height: ExampleUtils.height(context) * .25 < 170
              ? ExampleUtils.height(context) * .25
              : 170,
          child: ListView.builder(
              itemBuilder: (context, index) => ExampleUtils.cities[index],
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemCount: ExampleUtils.cities.length,
              scrollDirection: Axis.horizontal),
        ),
      ],
    );
  }
}
