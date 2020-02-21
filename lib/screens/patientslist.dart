import 'package:antidote/widgets/alertdialogtabs.dart';
import 'package:flutter/material.dart';
import 'package:antidote/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PatientsList extends StatefulWidget {
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  bool bookButton = false;

  final note = TextEditingController();

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
                  InkWell(
                    child: Image(
                      image: AppImages.gear,
                      height: 40,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/profile_filter');
                    },
                  ),
                ],
              ),
            ),
          )),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                AutoSizeText("\tPatients",
                    style: GoogleFonts.roboto(
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40))
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: <Widget>[
              Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    leading: Stack(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 30,
                            child: Image(image: AppImages.decentMan)),
                        Positioned(
                          right: 1,
                          child: Image(
                            image: AppImages.onlineStatus,
                            height: MediaQuery.of(context).size.height / 30,
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                        )
                      ],
                    ),
                    title: AutoSizeText('Thp. Harry Gamson',
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                            color: AppColors.blue, fontSize: 20)),
                    isThreeLine: true,
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            AutoSizeText("Sleeping Disorder",
                                maxLines: 1,
                                style: GoogleFonts.roboto(
                                    color: AppColors.grey, fontSize: 15)),
                            Spacer()
                          ],
                        ),
                        Row(children: <Widget>[
                          AutoSizeText("Wed, 11:00 AM",
                              maxLines: 1,
                              style: GoogleFonts.roboto(
                                  color: AppColors.grey, fontSize: 15)),
                          Spacer()
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: AutoSizeText("View note",
                                    maxLines: 1,
                                    style: GoogleFonts.roboto(
                                        color: AppColors.deepGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10)),
                                      title: Text('View note',
                                          style: GoogleFonts.roboto(
                                              color: AppColors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      content: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Note",
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          AppColors.lightGrey,
                                                      fontSize: 15)),
                                            ),
                                            TextFormField(
                                              maxLines: 5,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)))),
                                              controller: note,
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Enter the Message';
                                                }
                                                return null;
                                              },
                                            ),
                                            RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: AutoSizeText("Post",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  )),
                                              color: AppColors.blue,
                                              onPressed: () {},
                                            ),
                                            FlatButton(
                                              child: Text(
                                                "Cancel",
                                                style: GoogleFonts.roboto(
                                                    color: AppColors.blue,
                                                    fontSize: 15),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              AutoSizeText("Completed",
                                  maxLines: 1,
                                  style: GoogleFonts.roboto(
                                      color: AppColors.green, fontSize: 15)),
                            ])
                      ],
                    ),
                  )),
              Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    leading: Stack(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 30,
                            child: Image(image: AppImages.decentMan)),
                        Positioned(
                          right: 1,
                          child: Image(
                            image: AppImages.onlineStatus,
                            height: MediaQuery.of(context).size.height / 30,
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                        )
                      ],
                    ),
                    title: AutoSizeText('Thp. Harry Gamson',
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                            color: AppColors.blue, fontSize: 20)),
                    isThreeLine: true,
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            AutoSizeText("Sleeping Disorder",
                                maxLines: 1,
                                style: GoogleFonts.roboto(
                                    color: AppColors.grey, fontSize: 15)),
                            Spacer()
                          ],
                        ),
                        Row(children: <Widget>[
                          AutoSizeText("Wed, 11:00 AM",
                              maxLines: 1,
                              style: GoogleFonts.roboto(
                                  color: AppColors.grey, fontSize: 15)),
                          Spacer()
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: AutoSizeText("Add note",
                                    maxLines: 1,
                                    style: GoogleFonts.roboto(
                                        color: AppColors.deepGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10)),
                                      title: Text('Add note',
                                          style: GoogleFonts.roboto(
                                              color: AppColors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      content: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Note",
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          AppColors.lightGrey,
                                                      fontSize: 15)),
                                            ),
                                            TextFormField(
                                              maxLines: 5,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)))),
                                              controller: note,
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Enter the Message';
                                                }
                                                return null;
                                              },
                                            ),
                                            RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: AutoSizeText("Post",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  )),
                                              color: AppColors.blue,
                                              onPressed: () {},
                                            ),
                                            FlatButton(
                                              child: Text(
                                                "Cancel",
                                                style: GoogleFonts.roboto(
                                                    color: AppColors.blue,
                                                    fontSize: 15),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              AutoSizeText("Mark as complete",
                                  maxLines: 1,
                                  style: GoogleFonts.roboto(
                                      color: AppColors.darkRed, fontSize: 15)),
                            ])
                      ],
                    ),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
