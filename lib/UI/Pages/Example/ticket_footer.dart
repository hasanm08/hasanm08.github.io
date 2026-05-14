import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/flight_card.dart';

class TicketFooter extends StatelessWidget {
  const TicketFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Best Deals for Next 6 Months',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: const <Widget>[
                FlightCard(
                  date: "01 Far 1399",
                  percentOff: "34",
                  price: "500",
                  rating: 3.5,
                  flightTo: "Rafsanjani",
                  oldPrice: "999",
                ),
                FlightCard(
                  date: "02 Esf 1398",
                  percentOff: "45",
                  price: "600",
                  rating: 5,
                  flightTo: "Rafsanjani",
                  oldPrice: "1000",
                ),
                FlightCard(
                  date: "01 Far 1399",
                  percentOff: "34",
                  price: "300",
                  rating: 3.5,
                  flightTo: "Rafsanjani",
                  oldPrice: "999",
                ),
                FlightCard(
                  date: "02 Esf 1398",
                  percentOff: "45",
                  price: "700",
                  rating: 5,
                  flightTo: "Rafsanjani",
                  oldPrice: "1000",
                ),
              ],
            )
          ],
        ));
  }
}
