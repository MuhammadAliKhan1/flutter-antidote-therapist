import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global.dart';

class Social_SignIn extends StatelessWidget {
  final String buttonType;
  final Function function;

  Social_SignIn({this.buttonType, this.function});
  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case Buttons.Facebook:
        return new MaterialButton(
          color: Colors.blue.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 30.0, left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/icon_fb.png'),
                  height: 16,
                ),
                Text(
                  'Login With Facebook',
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          onPressed: function ?? () {},
        );
      case Buttons.Google:
        return new MaterialButton(
          color: Colors.red.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 45.0, left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/icon_google.png'),
                  height: 16,
                ),
                Text(
                  'Login With Google',
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          onPressed: function ?? () {},
        );
      default:
    }
  }
}
