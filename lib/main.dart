//import 'dart:io';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_app/about.dart';
import 'package:vegetable_app/home_page.dart';
import 'package:vegetable_app/login_page.dart';
import 'package:vegetable_app/mainlogin_page.dart';
import 'package:vegetable_app/services.dart';
import 'package:vegetable_app/signup_page.dart';
import 'package:vegetable_app/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // future:
  Firebase.initializeApp();
  // final cameras = await availableCameras();
  //final firstCamera = cameras.first;
  runApp(
    MyApp(
        //camera: firstCamera,

        ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // ignore: non_constant_identifier_names
        '/screen1': (BuildContext context) => Welcomescreen(),
        '/screen2': (BuildContext context) => LoginPage(),
        '/screen3': (BuildContext context) => HomePage(),
        '/screen4': (BuildContext context) => SignUpPage(),
        '/screen6': (BuildContext context) => AboutUs(),
        // // "/screen5": (BuildContext context) =>
        // //     new Freshcam(camera: cameras.first)
        // '/screen7': (BuildContext context) => HomePage(),
        // '/screen8': (BuildContext context) => Rancidity()
      },
      title: "Detector",
      home: const Welcomescreen(),
    );
  }
}
