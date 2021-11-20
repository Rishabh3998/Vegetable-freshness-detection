//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegetable_app/home.dart';

class LoginClass extends StatefulWidget {
  @override
  // ignore: missing_return
  State<StatefulWidget> createState() {
    return _LoginClass();
  }
}

class _LoginClass extends State<LoginClass> {
  String? _email, _pwd;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7DC6F),
      appBar: AppBar(
        backgroundColor: const Color(0xff196F3D),
        elevation: 0.0,
        title: const Text('Login',
            style: TextStyle(
                fontFamily: 'Comfortaa',
                color: Color(0xffF7DC6F),
                fontSize: 30.0)),
      ),
      body: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please Enter your Email';
                      }
                    },
                    onSaved: (input) => _email = input!,
                    // style: kLabelStyle,
                    style: const TextStyle(color: Color(0xff196F3D)),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (input) {
                      if (input!.length < 8) {
                        return 'Please Enter correct Password';
                      }
                    },
                    onSaved: (input) => _pwd = input!,
                    // style: kLabelStyle,
                    style: const TextStyle(color: Color(0xff196F3D)),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                    obscureText: true,
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                  height: 50,
                  width: 250,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: Color(0xffF7DC6F))),
                    color: const Color(0xff196F3D),
                    textColor: const Color(0xffF7DC6F),
                    padding: const EdgeInsets.all(8.0),
                    onPressed: login,
                    child: const Text(
                      'Login',
                      style: TextStyle(fontFamily: 'Comfortaa'),
                    ),
                  )),
              const SizedBox(
                height: 25.0,
              ),
              GestureDetector(
                onTap: Register,
                child: const Text(
                  'New User?  Create an Account',
                  style: TextStyle(
                    color: Color(0xff196F3D),
                    fontFamily: 'Comfortaa',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> login() async {
    final FormState = _formkey.currentState;
    if (FormState!.validate()) {
      FormState.save();
      try {
        final User user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email!, password: _pwd!))
            .user!;
        Navigator.pushReplacement(context,
            MaterialPageRoute<Map>(builder: (BuildContext context) {
          return HomeClass(user);
        }));
      } catch (e) {
        print(e);
      }
    }
  }

  void Register() {
    Navigator.pushReplacementNamed(context, '/screen4');
  }
}
