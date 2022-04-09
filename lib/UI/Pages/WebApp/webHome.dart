import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hasanm08/blocs/menuBloc.dart';
import 'package:provider/provider.dart';

class WebHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 150,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("HELLO",
                    style: TextStyle(
                        fontFamily: "Exo2", fontSize: 18, color: Colors.black)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("I'm AmirHassan",
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: "Exo2",
                          color: Colors.blue,
                          wordSpacing: 0,
                          letterSpacing: 1.4)),
                ),
                const Text("Freelance Mobile/Desktop developer &",
                    style: TextStyle(
                        fontSize: 18, fontFamily: "Exo2", color: Colors.black)),
                const Text("Love learning Deep Learning.",
                    style: TextStyle(
                        fontSize: 18, fontFamily: "Exo2", color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Text("Hire Me",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Exo2",
                              color: Colors.white)),
                    ),
                    onPressed: () {
                      Provider.of<MenuBloc>(context, listen: false).setIndex(2);
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ],
    );
  }
}
