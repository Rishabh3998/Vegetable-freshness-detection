import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable_app/login_page.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "404",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.raleway().fontFamily,
              fontSize: 50.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            " Something Went Wrong",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.raleway().fontFamily,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Text(
              "Log in",
              style: GoogleFonts.raleway(
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(Size(150.0, 50.0)),
              textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                fontSize: 20.0,
              )),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
    ));
  }
}
