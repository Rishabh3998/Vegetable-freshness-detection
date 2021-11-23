// SignUp Page

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable_app/mainlogin_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

String? _email, _pwd, _name;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // bool changeButton = false;

  // moveToLogin(BuildContext context) async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(
  //       () {
  //         changeButton = true;
  //       },
  //     );
  //     await Future.delayed(
  //       const Duration(
  //         milliseconds: 300,
  //       ),
  //     );
  //     await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => MainLoginPage(),
  //       ),
  //     );
  //     setState(
  //       () {
  //         changeButton = false;
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/7.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          "Create Account",
                          style: GoogleFonts.raleway(
                            fontStyle: FontStyle.normal,
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 180.0,
                        ),
                        TextFormField(
                          cursorColor: Colors.white,
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Name cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (input) => _name = input!,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hoverColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: const UnderlineInputBorder(),
                            hintText: "Name",
                            hintStyle: GoogleFonts.raleway(
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            focusColor: Colors.white,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          cursorColor: Colors.white,
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Email cannot be empty';
                            }
                            return null;
                          },
                          onSaved: (input) => _email = input!,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hoverColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            border: const UnderlineInputBorder(),
                            hintText: "Email",
                            hintStyle: GoogleFonts.raleway(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                            focusColor: Colors.white,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          validator: (input) {
                            if (input!.length < 8) {
                              return 'Password should be more then 8 characters';
                            }
                            return null;
                          },
                          onSaved: (input) => _pwd = input!,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hoverColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              color: Colors.white,
                              onPressed: () {
                                _toggle();
                              },
                            ),
                            border: const UnderlineInputBorder(),
                            hintText: "Password",
                            hintStyle: GoogleFonts.raleway(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                            focusColor: Colors.white,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ElevatedButton(
                          child: Text("Sign Up",
                              style: GoogleFonts.raleway(
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 19.0,
                              )),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: const Size(double.infinity, 50.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              textStyle: const TextStyle(
                                color: Colors.black,
                              )),
                          onPressed: signUp,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.white,
                                  height: 36,
                                )),
                          ),
                          Text(
                            "or",
                            style: GoogleFonts.raleway(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: const Divider(
                                  color: Colors.white,
                                  height: 36,
                                )),
                          ),
                        ]),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          child: Text("Log In with Email",
                              style: GoogleFonts.raleway(
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 19.0,
                              )),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            minimumSize: const Size(double.infinity, 50.0),
                            side: const BorderSide(
                                width: 1.0, color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            textStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainLoginPage()));
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          // icon: Icon(
                          //   Icons.g,
                          //   color: Colors.pink,
                          //   size: 24.0,
                          // ),
                          child: Text("Log In with Google",
                              style: GoogleFonts.raleway(
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 19.0,
                              )),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            minimumSize: const Size(double.infinity, 50.0),
                            side: const BorderSide(
                                width: 1.0, color: Colors.blue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            textStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MainLoginPage()));
                            // setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    // ignore: non_constant_identifier_names
    final FormState = _formKey.currentState;
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
