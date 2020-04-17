import 'package:antidote/models/inherited/therapist_data.dart';
import 'package:antidote/models/therapist_model.dart';
import 'package:antidote/models/user_model.dart';
import 'package:antidote/screens/bookappointmentprofile.dart';
import 'package:antidote/screens/chat_screen.dart';
import 'package:antidote/screens/earningandsession.dart';
import 'package:antidote/screens/notification.dart';
import 'package:antidote/screens/patientslist.dart';
import 'package:antidote/widgets/dashboard-widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:antidote/global.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double rating;
  @override
  Widget build(BuildContext context) {
    final TherapistInherit inheritedData = TherapistInherit.of(context);
    final Therapist therapistData = inheritedData.therapistData;
  
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SafeArea(
          child: AppBar(
            leading: Container(),
            elevation: 1,
            backgroundColor: Colors.white,
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Image(
                    image: AppImages.accountWithDollar,
                    height: 40,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EarningAndSession(),
                      ),
                    );
                  },
                ),
                Image(
                  image: AppImages.logo,
                ),
                InkWell(
                  child: Image(
                    image: AppImages.notification,
                    height: 40,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationAntidote(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: AutoSizeText(
                      "Welcome",
                      style: GoogleFonts.roboto(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    subtitle: AutoSizeText(
                      therapistData.name,
                      style: GoogleFonts.roboto(
                          color: AppColors.blue, fontSize: 18),
                    ),
                    trailing: CircleAvatar(
                      radius: 30,
                      child: therapistData.photoUrl == null
                          ? Image(image: AppImages.baldMan)
                          : NetworkImage(
                              therapistData.photoUrl,
                            ),
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AutoSizeText(
                        "\tRecent Patients",
                        style: GoogleFonts.roboto(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      InkWell(
                        child: AutoSizeText(
                          "View All\t",
                          style: GoogleFonts.roboto(
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientsList(),
                            ),
                          );
                        },
                      ),
                    ])
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection(FireStoreKeys.patientsCollection)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> patientList =
                        snapshot.data.documents;
                    return Container(
                      height: 165,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: patientList.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return DashboardListWidget(
                            rating: 5,
                            name: patientList[index].data['name'],
                            category: 'No Category',
                            photoUrl: patientList[index].data['photoUrl'],
                            routeTo: ChatScreen(
                              patientData: User.fromSnapshot(
                                patientList[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoSizeText("\tOngoing Patients",
                    style: GoogleFonts.roboto(
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                InkWell(
                  child: AutoSizeText("View All\t",
                      style: GoogleFonts.roboto(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientsList()));
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 165,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookAnAppointmentProfile(
                              patientData: null,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                CircleAvatar(
                                    radius: 30,
                                    child: Image(image: AppImages.decentMan)),
                                Positioned(
                                  right: 1,
                                  child: Image(
                                    image: AppImages.onlineStatus,
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width:
                                        MediaQuery.of(context).size.width / 30,
                                  ),
                                )
                              ],
                            ),
                            SmoothStarRating(
                              starCount: 5,
                              size: 25,
                              allowHalfRating: false,
                              filledIconData: Icons.star,
                              color: AppColors.blue,
                              borderColor: AppColors.blue,
                            ),
                            AutoSizeText("Thp. Dikhsa Sen",
                                style: GoogleFonts.roboto(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            AutoSizeText(
                              "Sleeping Disorder",
                              style: GoogleFonts.roboto(
                                color: AppColors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }


}
