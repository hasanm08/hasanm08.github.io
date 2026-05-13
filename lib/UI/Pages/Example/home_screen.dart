import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/cities_slider.dart';
import 'package:hasanm08/UI/Pages/Example/home_header.dart';
import 'package:hasanm08/Utils/example_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 50, width = 50;
  late ScrollController scrollController;
  @override
  void initState() {
    addController();
    super.initState();
  }

  void addController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          setState(() {
            ExampleUtils.shrinkHeader = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: //Colors.purple,
              Colors.indigo,
          secondaryHeaderColor: // Colors.blue
              Colors.teal),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          hoverElevation: 0,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("More Info :"),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.white,
                            ),
                            child: Image.asset('assets/images/gmail.png'),
                            onPressed: () async {
                              const url =
                                  'mailto:hasanmahani08@gmail.com?subject=I am using your flutter project so';
                              // const url = 'https://mail.google.com/mail/u/0/?view=cm&fs=1&tf=1&to=hasanmahani08@gmail.com&su=I+am+using+MIN+pa08+so&ui=2&tf=1';
                              if (await canLaunchUrl(Uri.dataFromString(url))) {
                                await launchUrl(Uri.dataFromString(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.blue,
                            ),
                            child: Image.asset('assets/images/instagram.png'),
                            onPressed: () async {
                              const url =
                                  'https://www.instagram.com/hasanm108/';
                              if (await canLaunchUrl(Uri.dataFromString(url))) {
                                await launchUrl(Uri.dataFromString(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.white,
                            ),
                            child: Image.asset('assets/images/telegram.png'),
                            onPressed: () async {
                              const url = 'https://t.me/hasanm08';
                              if (await canLaunchUrl(Uri.dataFromString(url))) {
                                await launchUrl(Uri.dataFromString(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.white,
                            ),
                            child: Image.asset('assets/images/whatsapp.png'),
                            onPressed: () async {
                              const url = 'https://wa.me/+989910187797';
                              if (await canLaunchUrl(Uri.dataFromString(url))) {
                                await launchUrl(Uri.dataFromString(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: Theme.of(context).primaryColor.withValues(alpha: .5),
          child: const Icon(Icons.info_outline),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: Column(
            children: <Widget>[
              HomeHeader(
                locations: ExampleUtils.locations,
              ),
              const CitiesSlider(),
              const CitiesSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
