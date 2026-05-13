import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/custom_clipper_component.dart';
import 'package:hasanm08/UI/Pages/Example/item.dart';
import 'package:hasanm08/UI/Pages/Example/ticket_page.dart';
import 'package:hasanm08/Utils/example_utils.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({required this.locations, super.key});
  final List<String> locations;
  @override
  HomeHeaderState createState() => HomeHeaderState();
}

class HomeHeaderState extends State<HomeHeader> {
  bool isFlightSelected = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.locations[1]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var defaultHeight =
        ExampleUtils.height(context) * (ExampleUtils.shrinkHeader ? 0.2 : 0.65);
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomClipperComponent(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 370),
            height: defaultHeight < 450 ? defaultHeight : 500,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).secondaryHeaderColor
            ])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: ExampleUtils.height(context) / 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: ExampleUtils.width(context) * 0.05,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            ExampleUtils.selectedLocation =
                                int.parse(index.toString());
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              widget.locations[ExampleUtils.selectedLocation],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuItem<int>>[
                            PopupMenuItem(
                              value: 0,
                              child: Text(
                                widget.locations[0],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Text(
                                widget.locations[1],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                          ];
                        },
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ExampleUtils.height(context) / 16,
                ),
                const Text(
                  'Where Would  \n you want to go',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ExampleUtils.height(context) * 0.0375),
                Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: textEditingController,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 13),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            child: InkWell(
                              child: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TicketPage(
                                      firstLocation: widget.locations[
                                          ExampleUtils.selectedLocation],
                                      secondLocation:
                                          textEditingController.text);
                                }));
                              },
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: ExampleUtils.height(context) * 0.025,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Item(
                          icon: Icons.flight_takeoff,
                          text: "Flights",
                          selected: isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: ExampleUtils.width(context) * 0.055,
                    ),
                    InkWell(
                      child: Item(
                          icon: Icons.hotel,
                          text: "Hotels",
                          selected: !isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = false;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
