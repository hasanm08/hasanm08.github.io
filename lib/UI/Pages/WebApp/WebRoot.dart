import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/WebApp/MenuButton.dart';
import 'package:hasanm08/blocs/menuBloc.dart';
import 'package:provider/provider.dart';

class WebRoot extends StatelessWidget {
  const WebRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuBloc(),
      builder: (context, child) => Padding(
        padding: const EdgeInsets.all(0.0),
        child: Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///menu
              Container(
                decoration: const BoxDecoration(
                  border: null,
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/coding.png'))),
                          ),
                        ),
                        // MenuButton(
                        //   icon: Icons.home,
                        //   text: "Home",
                        //   index: 0,
                        // ),
                        MenuButton(
                          icon: Icons.person,
                          text: "About",
                          index: 0,
                        ),
                        MenuButton(
                          icon: Icons.call,
                          text: "Contact",
                          index: 1,
                        ),
                        MenuButton(
                          icon: Icons.work,
                          text: "Projects",
                          index: 2,
                        ),
                        MenuButton(
                          icon: Icons.more_horiz,
                          text: "More",
                          index: 3,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("Made With:",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Exo2",
                                color: Colors.white)),
                        FlutterLogo(
                          style: FlutterLogoStyle.horizontal,
                          textColor: Colors.white,
                          size: 70,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Selector<MenuBloc, Widget>(
                selector: (_, bloc) => bloc.body,
                builder: (context, value, child) => Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: value,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeClipper extends CustomClipper {
  @override
  getClip(Size size) {
    return Path()..moveTo(size.width / 4, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
