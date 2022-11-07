import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../auth.dart';
import 'package:avatar_glow/avatar_glow.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
    Get.toNamed("/login");
  }

  Widget _entryField(
      String title, TextEditingController controller, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButton() {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: createUserWithEmailAndPassword,
        child: Text('Register',
            style: TextStyle(
              fontSize: 27,
            )),
      ),
    );
  }

  Widget _glowLogo() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: AvatarGlow(
        endRadius: 80,
        duration: Duration(seconds: 1),
        glowColor: Colors.blueAccent,
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: Duration(seconds: 4),
        startDelay: Duration(seconds: 3),
        child: Material(
            elevation: 10.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey[100],
              child: Icon(
                Icons.remove_red_eye,
                size: 45,
              ),
              radius: 40.0,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _glowLogo(),
            _entryField('E-Mail', _controllerEmail, false),
            _entryField('Password', _controllerPassword, true),
            _errorMessage(),
            _submitButton(),
          ],
        ),
      ),
    );
  }
}
