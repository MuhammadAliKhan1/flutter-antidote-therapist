import 'package:antidote/widgets/alertdialogtabs.dart';
import 'package:antidote/widgets/shadeButton.dart';
import 'package:flutter/material.dart';
import 'package:antidote/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfileSetting extends StatefulWidget {
  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  bool sunday = false;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool marriageCounselling = false;
  bool depression = false;
  bool anxiety = false;
  bool angerManagement = false;

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
          AutoSizeText("\tSelect Your Days & Time",
              style: GoogleFonts.roboto(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          AutoSizeText("\tYou’re available 4 days a week",
              style: GoogleFonts.roboto(
                color: AppColors.deepGrey,
                fontSize: 15,
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ShadeButton(
                  buttonText: "Sunday",
                  buttonName: sunday,
                  width: 100,
                  function: actionForDays,
                ),
                ShadeButton(
                  buttonName: monday,
                  buttonText: "Monday",
                  width: 100,
                  function: actionForDays,
                ),
                ShadeButton(
                  buttonName: tuesday,
                  buttonText: "Tuesday",
                  width: 100,
                  function: actionForDays,
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ShadeButton(
                  buttonText: "Wednesday",
                  buttonName: wednesday,
                  width: 100,
                  function: actionForDays,
                ),
                ShadeButton(
                  buttonName: thursday,
                  buttonText: "Thursday",
                  width: 100,
                  function: actionForDays,
                ),
                ShadeButton(
                  buttonName: friday,
                  buttonText: "Friday",
                  width: 100,
                  function:  actionForDays,
                )
              ]),
          Row(children: <Widget>[
            Spacer(
              flex: 2,
            ),
            ShadeButton(
              buttonText: "Saturday",
              buttonName: saturday,
              width: 100,
              function: actionForDays,
            ),
            Spacer(
              flex: 30,
            )
          ]),
          AutoSizeText("\tSelect Your Days & Time",
              style: GoogleFonts.roboto(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          AutoSizeText("\tYou have 2 categorization",
              style: GoogleFonts.roboto(
                color: AppColors.deepGrey,
                fontSize: 15,
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ShadeButton(
                  buttonText: "Marriage Councelling",
                  buttonName: marriageCounselling,
                  width: 150,
                  function: actionforMC,
                ),
                ShadeButton(
                  buttonName: depression,
                  buttonText: "Depression",
                  width: 100,
                  function: actionforD,
                ),
                ShadeButton(
                  buttonName: anxiety,
                  buttonText: "Anxiety",
                  width: 100,
                  function: actionforA,
                )
              ]),
          Row(children: <Widget>[
            Spacer(),
            ShadeButton(
              buttonText: "Anger Management",
              buttonName: angerManagement,
              width: 150,
              function: actionforAM,
            ),
            Spacer(
              flex: 20,
            )
          ]),
        ]));
  }

  void actionforMC() {
    setState(() {
      marriageCounselling = !marriageCounselling;
    });
  }

  void actionforAM() {
    setState(() {
      angerManagement = !angerManagement;
    });
  }

  void actionforD() {
    setState(() {
      depression = !depression;
    });
  }

  void actionforA() {
    setState(() {
      anxiety = !anxiety;
    });
  }

  void actionForDays() {
    setState(() {
      anxiety = !anxiety;
    });
    showDialog(
        context: context,
        builder: (context) => Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  child: AlertDialogTabs(),
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1.1,
                ),
              ),
            ));
  }
}
