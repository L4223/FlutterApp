import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = Get.put(TextEditingController());

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 280),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  "Please verify yourself",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
                  ),
                ),
              )),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Handy Nummer",
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text("+49"),
                    )),
                maxLength: 12,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/pin");
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => PinPage(_controller.text)));
                },
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
