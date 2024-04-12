import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/custom_animated_3d_card.dart';

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
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              height: 250,
              width: 500,
              child: CustomAnimated3DCard(
                characterImage: "assets/images/hasanm308.png",
                coverImage: "assets/images/hasanm308.jpeg",
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
