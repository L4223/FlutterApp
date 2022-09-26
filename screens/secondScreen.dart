import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2"),
      ),
      body:
        Column(
          children: [
            Container(
                child: Center(
                  child: Text("Ich bin der Zweite Screen",
                    textAlign: TextAlign.center,
                  textScaleFactor: 2,)
                ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.keyboard_return, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Colors.blue, // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
            )


          ],
        )
    );

  }
}
