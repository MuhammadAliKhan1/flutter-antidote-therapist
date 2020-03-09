import 'package:antidote/screens/bookappointmentprofile.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../global.dart';

class DashboardListWidget extends StatelessWidget {
  final double rating;
  final String name;
  final String category;
  final String photoUrl;
  final Widget routeTo;

  const DashboardListWidget({
    Key key,
    @required this.rating,
    @required this.name,
    @required this.category,
    @required this.photoUrl,
    @required this.routeTo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (routeTo != null)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => routeTo,
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
                  child: Image(
                    image: photoUrl == null
                        ? AppImages.baldMan
                        : NetworkImage(
                            photoUrl,
                          ),
                  ),
                ),
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
            SmoothStarRating(
              starCount: 5,
              size: 25,
              allowHalfRating: false,
              filledIconData: Icons.star,
              color: AppColors.blue,
              borderColor: AppColors.blue,
              rating: rating,
            ),
            AutoSizeText(
              name,
              style: GoogleFonts.roboto(
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            AutoSizeText(
              category,
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
  }
}
