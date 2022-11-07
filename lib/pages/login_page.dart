import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:list/local_auth_api.dart';
import '../auth.dart';
import 'package:avatar_glow/avatar_glow.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    checkAuthentification();
  }

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Get.toNamed("/home");
      }
    });
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
        onPressed: signInWithEmailAndPassword,
        child: Text('Login',
            style: TextStyle(
              fontSize: 27,
            )),
      ),
    );
  }

  Widget _registerButton() {
    return TextButton(
      onPressed: () {
        Get.toNamed("/phone");
      },
      child: Text('Register instead'),
    );
  }

  Widget _authentication_with_faceid() {
    return TextButton(
        onPressed: () async {
          final isAuthenticated = await LocalAuthApi.authenticate();

          if (isAuthenticated) {
            print("Autorisiert");
          }
        },
        child: Text("Gesichtserkennung"));
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
              child: SizedBox(
                width: 100,
                height: 100,
                child: IconButton(
                  onPressed: () {
                    Get.toNamed("/home");
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_rounded,
                    size: 50,
                  ),
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_registerButton(), _authentication_with_faceid()],
            )
          ],
        ),
      ),
    );
  }
}
