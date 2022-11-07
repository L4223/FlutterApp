import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/pages/home.dart';
import 'package:list/pages/login_page.dart';
import 'package:list/routes.dart';
import 'auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RoutesClass.routes,
      home: checkForAuth(),
    );
  }
}

Widget checkForAuth() {
  return StreamBuilder(
    stream: Auth().authStateChanges,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return HomePage();
      } else {
        return const LoginPage();
      }
    },
  );
}
