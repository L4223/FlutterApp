import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  final name = "Mark Mustermann";
  final studiengang = "Medieningenieur";
  final semester = "3";

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 24, color: Colors.deepPurple);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(
                  'assets/images/kermit.jpg',
                )),
            Text(
              name,
              style: style,
            ),
            Text("Studiengang: $studiengang", style: style),
            Text("Semester: $semester", style: style),
          ],
        ),
      ),
    );
  }
}
