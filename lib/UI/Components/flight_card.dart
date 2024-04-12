import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/Example/tag_component.dart';
import 'package:hasanm08/Utils/example_utils.dart';

class FlightCard extends StatelessWidget {
  final String? price;
  final String? flightTo;
  final String? percentOff;
  final String? date;
  final double? rating;
  final String? oldPrice;

  const FlightCard(
      {Key? key,
      this.date,
      this.flightTo,
      this.percentOff,
      this.price,
      this.rating,
      this.oldPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: ExampleUtils.width(context) * .8,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.lerp(
                    const Radius.elliptical(10, 20),
                    const Radius.circular(20),
                    2)!),
                border: Border.all(color: ExampleUtils.borderColor(context)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '${price!}\$',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: ExampleUtils.width(context) * .02,
                      ),
                      Text(
                        '${oldPrice!}\$',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ExampleUtils.height(context) * .03,
                  ),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: -5.0,
                    children: <Widget>[
                      TagComponent(
                        label: date!,
                        avatar: const Icon(
                          Icons.calendar_today,
                          size: 18,
                        ),
                      ),
                      TagComponent(
                        label: flightTo!,
                        avatar: const Icon(Icons.flight_takeoff, size: 18),
                      ),
                      TagComponent(
                        label: rating.toString(),
                        avatar: const Icon(Icons.star, size: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: ExampleUtils.height(context) * .025,
              right: 15,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                width: ExampleUtils.width(context) * .09,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: ExampleUtils.discountBackground(context)
                        .withOpacity(.2)),
                child: Center(
                  child: Text(
                    '${percentOff!}%',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: ExampleUtils.discountBackground(context)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
