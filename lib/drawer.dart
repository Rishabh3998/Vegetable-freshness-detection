//Drawer

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vegetable_app/about.dart';
import 'package:vegetable_app/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegetable_app/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vegetable_app/mainlogin_page.dart';
import 'package:vegetable_app/myAccount.dart';
import 'package:vegetable_app/signup_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;

// User? user = FirebaseAuth.instance.currentUser;

void inputData() async {
  User? user = auth.currentUser;
  final uid = user?.uid == null ? null : user!.uid;
  print(user);
  // return uid;
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                user?.displayName != null ? user!.displayName! : "Name",
                style: TextStyle(fontSize: 25.0),
              ),
              accountEmail: Text(
                user?.email != null ? user!.email! : "Email",
                style: TextStyle(fontSize: 15.0),
              ),
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: AssetImage('assets/5.jpg'),
              // ),
              decoration: BoxDecoration(
                color: Colors.black,
                // image: DecorationImage(
                //   image: AssetImage('assets/images/7.jpg'),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            // ListTile(
            //   title: const Text('My Account'),
            //   leading: const Icon(Icons.person),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => MyAccount(
            //           user: user,
            //         ),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              title: const Text('Log In'),
              leading: const Icon(Icons.login_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainLoginPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Sign Up'),
              leading: const Icon(Icons.app_registration),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: inputData,
            ),
            const Divider(
              indent: 15.0,
              endIndent: 15.0,
              thickness: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: const Text('About Us'),
              leading: const Icon(Icons.info_outline),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUs(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Want to Collaborate ?'),
              leading: const Icon(Icons.share),
              onTap: _launchURL,
            ),
            // ListTile(
            //   title: const Text('Rate and Review'),
            //   leading: const Icon(Icons.rate_review),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
            ListTile(
              title: const Text('Log Out'),
              leading: const Icon(Icons.logout_rounded),
              onTap: logout,
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const _url = 'https://github.com/Rishabh3998/Vegetable-freshness-detection';
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  displayToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xffC5C5C5),
      textColor: Colors.black,
      fontSize: 20.0,
    );
  }

  Future logout() async {
    await auth.signOut().then(
          (value) => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
            (route) => false,
          ),
        );
  }
}
