//import 'dart:io';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_app/about.dart';
import 'package:vegetable_app/login_page.dart';
import 'package:vegetable_app/mainlogin_page.dart';
import 'package:vegetable_app/signup.dart';
import 'package:vegetable_app/signup_page.dart';
import 'package:vegetable_app/welcome.dart';

// import 'package:foodaayush/firstsreen.dart';
// import 'package:foodaayush/mainnutriscreen.dart';
// import 'package:foodaayush/rancidity_check.dart';
// import 'package:foodaayush/signup.dart';

// import 'package:foodaayush/classify.dart';
// import 'login.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // future:
  // Firebase.initializeApp();
  //final cameras = await availableCameras();
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
        // '/screen3': (BuildContext context) => HomeClass(user),
        '/screen4': (BuildContext context) => SignUpPage(),
        // '/screen5': (BuildContext context) => MainNutriScreen(),
        '/screen6': (BuildContext context) => AboutUs(),
        // // "/screen5": (BuildContext context) =>
        // //     new Freshcam(camera: cameras.first)
        // '/screen7': (BuildContext context) => Classifier(),
        // '/screen8': (BuildContext context) => Rancidity()
      },
      title: "Detector",
      home: AboutUs(),
    );
  }
}
