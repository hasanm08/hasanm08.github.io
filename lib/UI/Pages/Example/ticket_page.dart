import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/Example/ticket_footer.dart';
import 'package:hasanm08/UI/Pages/Example/ticket_header.dart';



class TicketPage extends StatelessWidget {
  final String? firstLocation;
  final String? secondLocation;
  const TicketPage({Key? key, this.firstLocation, this.secondLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'Search Result',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TicketHeader(
                firstLocation: firstLocation ?? "",
                secondLocation: secondLocation ?? "",
              ),
              const TicketFooter()
            ],
          ),
        ));
  }
}
