import 'package:antidote/screens/profilesetting.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [AppColors.lightBlue, AppColors.darkBlue],
                        ),
                      ),
                      child: Row(children: <Widget>[
                        Spacer(),
                        Align(
                          child: IconButton(
                            icon: Icon(
                              Icons.settings,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileSetting()));
                            },
                            color: Colors.white,
                          ),
                          alignment: Alignment.topRight,
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Container(
                        color: AppColors.offWhite,
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.lerp(
                      Alignment.topCenter, Alignment.bottomCenter, 0.4),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 70,
                    height: MediaQuery.of(context).size.height - 160,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 15,
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Column(children: <Widget>[
                                  Spacer(
                                    flex: 3,
                                  ),
                                  AutoSizeText("Harry Garison",
                                      maxLines: 1,
                                      style: GoogleFonts.roboto(
                                          color: AppColors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Spacer(),
                                  Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height / 25,
                                    child: Center(
                                      child: Text("Edit Profile",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                      color: AppColors.hardblue,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            Divider(),
                            Flexible(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Column(children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      AutoSizeText("Mobile Number",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      AutoSizeText("+851 9885 0994",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              color: AppColors.normalGrey))
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      AutoSizeText("Email ID",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      AutoSizeText("harry@gmail.com ",
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: AppColors.normalGrey,
                                          ))
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      AutoSizeText('Gender',
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      AutoSizeText("Male",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              color: AppColors.normalGrey))
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      AutoSizeText("Date Of Birth",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      AutoSizeText("Jan 12 2020",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              color: AppColors.normalGrey))
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      AutoSizeText("Location",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      AutoSizeText("USA",
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: AppColors.normalGrey,
                                          ))
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      AutoSizeText("Logout",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              color: AppColors.hardRed,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    height: 30,
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          child: CircleAvatar(
                            child: Image(image: AppImages.baldMan),
                            radius: 50,
                          ),
                          alignment: Alignment.topCenter,
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
    );
  }
}
