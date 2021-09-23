import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/hasanm108.jpg"),
                      fit: BoxFit.contain)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Amir Hassan AmirMahani",
              style: TextStyle(
                  fontSize: 22, color: Colors.black, fontFamily: "Pacifico"),
            ),
          ),
          Container(
            width: 400,
            child: Divider(
              endIndent: 12,
              thickness: 1,
              indent: 12,
              color: Colors.black26,
            ),
          ),
          infoRow("Age", (DateTime.now().year - 1999).toString() + " years",
              context),
          infoRow("Country", "Iran", context),
          infoRow("City", "Kerman", context),
          infoRow("Education ", "B.Sc Computer Eng Bahonar Uni", context),
          infoRow("Julia Age",
              (DateTime.now().year - 2020).toString() + " years", context),
          infoRow("Flutter Age",
              (DateTime.now().year - 2019).toString() + " years", context),
          infoRow("Arduino Age",
              (DateTime.now().year - 2018).toString() + " years", context),
          infoRow("Python Age",
              (DateTime.now().year - 2018).toString() + " years", context),
          infoRow("C# Age", (DateTime.now().year - 2017).toString() + " years",
              context),
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
            style: Theme.of(context).textTheme.bodyText1,
          )),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
