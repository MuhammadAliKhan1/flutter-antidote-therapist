import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:antidote/global.dart';

class EarningAndSession extends StatefulWidget {
  @override
  _EarningAndSessionState createState() => _EarningAndSessionState();
}

class _EarningAndSessionState extends State<EarningAndSession> {
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
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: AppColors.blue,
                  ),
                ),
                Spacer(),
                Image(
                  image: AppImages.logo,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Text("\n\n"),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      AutoSizeText("\$50.00",
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                      AutoSizeText("Account Balance",
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText("\tSession History",
                style: GoogleFonts.roboto(
                    color: AppColors.blue,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      isThreeLine: true,
                      leading: CircleAvatar(
                          radius: 30, child: Image(image: AppImages.decentMan)),
                      title: AutoSizeText("Thp. Dikhsa Sen",
                          style: GoogleFonts.roboto(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      subtitle: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              AutoSizeText("Sleeping Disorder",
                                  style: GoogleFonts.roboto(
                                      color: AppColors.grey, fontSize: 12))
                            ],
                          ),
                          Row(children: <Widget>[
                            AutoSizeText("Wed, 11:00 AM",
                                style: GoogleFonts.roboto(
                                    color: AppColors.grey, fontSize: 12))
                          ]),
                          Row(children: <Widget>[
                            AutoSizeText("View note",
                                style: GoogleFonts.roboto(
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                          ])
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          AutoSizeText("\$25.00",
                              style: GoogleFonts.roboto(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          AutoSizeText('Completed',
                              style: GoogleFonts.roboto(
                                  color: AppColors.green, fontSize: 12))
                        ],
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
