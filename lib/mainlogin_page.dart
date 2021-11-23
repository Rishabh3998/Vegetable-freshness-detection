import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegetable_app/home.dart';
import 'package:vegetable_app/home.dart';
// import 'package:vegetable_app/home_page.dart';
import 'package:vegetable_app/signup_page.dart';

class MainLoginPage extends StatefulWidget {
  @override
  _MainLoginPageState createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {
  String? _email, _pwd;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true;

  // String _password;
  bool changeButton = false;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // moveToHome(BuildContext context) async {
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
  //     // await Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //     builder: (context) => HomePage(),
  //     //   ),
  //     // );
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
            Center(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/4.jpg'),
                    fit: BoxFit.none,
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        "Welcome Back",
                        style: GoogleFonts.raleway(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 200.0,
                      ),
                      Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _email = value!,
                                cursorColor: Colors.white,
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
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3.0),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                obscureText: _obscureText,
                                cursorColor: Colors.white,
                                validator: (value) {
                                  if (value!.length < 8) {
                                    return 'Password should be more then 7 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _pwd = value!,
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
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3.0),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 30.0,
                              ),
                              ElevatedButton(
                                child: Text(
                                  "Log In with Email",
                                  style: GoogleFonts.raleway(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.0,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  minimumSize:
                                      const Size(double.infinity, 50.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: Login,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              // Divider(
                              //   thickness: 2.0,
                              //   color: Colors.white70,
                              // ),
                              Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 20.0),
                                    child: const Divider(
                                      color: Colors.white,
                                      height: 36,
                                    ),
                                  ),
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
                                    ),
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                height: 10.0,
                              ),
                              ElevatedButton(
                                // icon: Icon(
                                //   Icons.g,
                                //   color: Colors.pink,
                                //   size: 24.0,
                                // ),
                                child: Text(
                                  "Log In with Google",
                                  style: GoogleFonts.raleway(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.0,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  minimumSize:
                                      const Size(double.infinity, 50.0),
                                  side: const BorderSide(
                                      width: 1.0, color: Colors.blue),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
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
                              const SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.raleway(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.0,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  minimumSize:
                                      const Size(double.infinity, 50.0),
                                  side: const BorderSide(
                                      width: 1.0, color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()));
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> Login() async {
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
