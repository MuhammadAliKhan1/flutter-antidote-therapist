import 'package:antidote/widgets/shadeButton.dart';
import 'package:flutter/material.dart';
import '../global.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileFilter extends StatefulWidget {
  @override
  _ProfileFilterState createState() => _ProfileFilterState();
}

class _ProfileFilterState extends State<ProfileFilter> {
  bool all = false;
  bool completed = false;
  bool ongoing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: SafeArea(
              child: AppBar(
                leading: Container(),
                elevation: 1,
                backgroundColor: Colors.white,
                flexibleSpace: Row(
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.blue,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    Image(
                      image: AppImages.logo,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )),
        body: ListView(children: <Widget>[
          AutoSizeText("\tPatient Type",
              style: GoogleFonts.roboto(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 40)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ShadeButton(
                  buttonText: "All",
                  buttonName: all,
                  width: 100,
                ),
                ShadeButton(
                  buttonName: completed,
                  buttonText: "Completed",
                  width: 100,
                ),
                ShadeButton(
                  buttonName: ongoing,
                  buttonText: "Ongoing",
                  width: 100,
                )
              ]),
        ]));
  }
}
