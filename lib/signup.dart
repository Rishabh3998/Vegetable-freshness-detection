import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

String? _email, _pwd;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _RegisterState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7DC6F),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffF7DC6F)),
        backgroundColor: const Color(0xff196F3D),
        elevation: 0.0,
        title: const Text('Register',
            style: TextStyle(
                fontFamily: 'Comfortaa',
                color: Color(0xffF7DC6F),
                fontSize: 30.0)),
      ),
      body: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please Enter your Email';
                  }
                },
                onSaved: (input) => _email = input!,
                style: const TextStyle(color: Color(0xff196F3D)),
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                validator: (input) {
                  if (input!.length < 8) {
                    return 'Please Enter password with length of atleast 8 characters';
                  }
                },
                onSaved: (input) => _pwd = input!,
                style: const TextStyle(color: Color(0xff196F3D)),
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: const BorderSide(color: Color(0xffF7DC6F))),
                color: const Color(0xff196F3D),
                textColor: const Color(0xffF7DC6F),
                padding: const EdgeInsets.all(8.0),
                onPressed: signUp,
                child: const Text(
                  'Register',
                  style: TextStyle(fontFamily: 'Comfortaa'),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> signUp() async {
    final FormState = _formkey.currentState;
    if (FormState!.validate()) {
      FormState.save();
      try {
        final User user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _email!, password: _pwd!))
            .user!;
        user.sendEmailVerification();
        Navigator.pushReplacementNamed(context, '/screen2');
      } catch (e) {
        print(e);
      }
    }
  }
}
