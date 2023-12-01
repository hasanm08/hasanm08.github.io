import 'package:flutter/material.dart';

import '../../Components/RotatingCircle.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 140,
              width: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/hasanm208.jpg"),
                            fit: BoxFit.contain)),
                  ),
                  const RotatingCircle(
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: const Text(
              "Amir Hassan Amirmahani",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: "kalame"),
            ),
          ),
          const SizedBox(
            width: 400,
            child: Divider(
              endIndent: 12,
              thickness: 1,
              indent: 12,
              color: Colors.black26,
            ),
          ),
          infoRow("Age", "${DateTime.now().year - 1999} years", context),
          infoRow("Country", "Iran", context),
          infoRow("City", "Kerman", context),
          infoRow("Education ", "B.Sc Computer Eng Bahonar Uni", context),
          infoRow("Julia Age", "${DateTime.now().year - 2020} years", context),
          infoRow(
              "Flutter Age", "${DateTime.now().year - 2019} years", context),
          infoRow(
              "Arduino Age", "${DateTime.now().year - 2018} years", context),
          infoRow("Python Age", "${DateTime.now().year - 2018} years", context),
          infoRow("C# Age", "${DateTime.now().year - 2017} years", context),
        ],
      ),
    );
  }

  infoRow(String title, String description, BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
