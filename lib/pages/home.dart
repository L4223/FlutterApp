import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/pages/chart_page.dart';
import 'package:list/pages/fav_page.dart';
import 'package:list/pages/list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      // padding: EdgeInsets.only(bottom: 70, top: 70),
      minimumSize: Size(350, 90),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: style,
                onPressed: () => Get.toNamed("/profile"),
                child: Text('Profil',
                    style: TextStyle(
                      fontSize: 27,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: style,
                onPressed: () => Get.toNamed("/favorites"),
                child: Text('Meine Stundenpläne',
                    style: TextStyle(
                      fontSize: 27,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: style,
                onPressed: () => Get.toNamed("/chart"),
                child: Text('Diagramm',
                    style: TextStyle(
                      fontSize: 27,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: style,
                onPressed: () => Get.toNamed("/profileInput"),
                child: Text('Voting',
                    style: TextStyle(
                      fontSize: 27,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: style,
                onPressed: () => Get.toNamed("/list"),
                child: Text('Alle Stundenpläne',
                    style: TextStyle(
                      fontSize: 27,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInputPage extends StatefulWidget {
  const ProfileInputPage({Key? key}) : super(key: key);

  @override
  State<ProfileInputPage> createState() => _ProfileInputPageState();
}

class _ProfileInputPageState extends State<ProfileInputPage> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Medieningenieur"), value: "Medieningenieur"),
      DropdownMenuItem(child: Text("Informatik"), value: "Informatik"),
      DropdownMenuItem(
          child: Text("Multi Media Production"),
          value: "Multi Media Production"),
      DropdownMenuItem(child: Text("Maschinenbau"), value: "Maschinenbau"),
    ];
    return menuItems;
  }

  final TextEditingController _controllerSemester = TextEditingController();
  final TextEditingController _controllerMatrikelnr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String selectedValue = "Medieningenieur";

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Wer bist du?",
                style: TextStyle(fontSize: 35),
              ),
            )),
            SizedBox(
              width: 300,
              height: 60,
              child: DropdownButton(
                value: selectedValue,
                items: dropdownItems,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: TextField(
                controller: _controllerSemester,
                decoration: InputDecoration(
                  labelText: "Semester",
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: TextField(
                controller: _controllerMatrikelnr,
                decoration: InputDecoration(
                  labelText: "Matrikelnummer",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  saveUserInfo();
                },
                child: Text("Weiter"))
          ],
        ),
      ),
    );
  }

  void saveUserInfo() {
    print("Semester: $_controllerSemester.text");
    print("Matrikelnummer: $_controllerMatrikelnr.text");

    Get.toNamed("/home");
  }
}
