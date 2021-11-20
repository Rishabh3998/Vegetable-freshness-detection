import 'package:flutter/material.dart';
import 'package:vegetable_app/login_page.dart';
import 'package:vegetable_app/mainlogin_page.dart';
import 'package:vegetable_app/signup_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Rishabh Kumar",
                style: TextStyle(fontSize: 25.0),
              ),
              accountEmail: Text(
                'rsk1998200@gmail.com',
                style: TextStyle(fontSize: 15.0),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/5.jpg'),
              ),
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
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('My Account'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Categories/Log In'),
              leading: const Icon(Icons.category_rounded),
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
              title: const Text('Saved/Sign Up'),
              leading: const Icon(Icons.save),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                // Update the state of the app.
                // ...
              },
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
              },
            ),
            ListTile(
              title: const Text('Share with Friends'),
              leading: const Icon(Icons.share),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Rate and Review'),
              leading: const Icon(Icons.rate_review),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Feedback/Report Error'),
              leading: const Icon(Icons.feed),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
