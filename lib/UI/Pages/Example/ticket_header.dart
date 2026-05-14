import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/custom_clipper_component.dart';
import 'package:hasanm08/Utils/example_utils.dart';

class TicketHeader extends StatelessWidget {
  const TicketHeader(
      {super.key, required this.firstLocation, required this.secondLocation});
  final String firstLocation;
  final String secondLocation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomClipperComponent(),
            child: Container(
              height: ExampleUtils.height(context) * .272, //400
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withAlpha(240)
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: ExampleUtils.height(context) * .04,
              ),
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.symmetric(
                    horizontal: ExampleUtils.height(context) * .035),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(ExampleUtils.height(context) * .035),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              /*locs[0]*/ '$firstLocation\n (City name Can have any lentgh)',
                              style: const TextStyle(fontSize: 16.0),
                              // key: from,
                            ),
                            Divider(
                              color: Colors.black12,
                              height: ExampleUtils.height(context) * .04,
                            ),
                            Text(
                              /*locs[1]*/ secondLocation /*+ ' Imam reza Holy Shrine'*/,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                              // key: to,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(
                                Icons.import_export,
                                color: Colors.black,
                                size: ExampleUtils.height(context) * .07,
                              ),
                              onPressed: () {
                                // TODO Swap To And From texts
                              }))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
