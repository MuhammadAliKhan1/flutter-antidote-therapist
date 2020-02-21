import 'package:antidote/global.dart';
import 'package:antidote/widgets/shadeButton.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertDialogTabs extends StatefulWidget {
  @override
  _AlertDialogTabsState createState() => _AlertDialogTabsState();
}

class _AlertDialogTabsState extends State<AlertDialogTabs>
    with SingleTickerProviderStateMixin {
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  bool six = false;
  bool seven = false;
  bool eight = false;
  bool nine = false;
  bool ten = false;
  bool eleven = false;
  bool twelve = false;
  TabController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text(
            "\tSelect Your Slots",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: AppColors.blue,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "\tWednesday",
            style: GoogleFonts.roboto(
                fontSize: 15,
                color: AppColors.deepGrey,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ShadeButton(
                buttonName: one,
                width: 90,
                buttonText: "1:00 AM",
                function: actionforone,
              ),
              ShadeButton(
                buttonName: two,
                width: 90,
                buttonText: "1:00 AM",
                function: actionfortwo,
              ),
              ShadeButton(
                buttonName: three,
                width: 90,
                buttonText: "1:00 PM",
                function: actionforthree,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ShadeButton(
                buttonName: four,
                width: 90,
                buttonText: "11:00 AM",
                function: actionforfour,
              ),
              ShadeButton(
                buttonName: five,
                width: 90,
                buttonText: "1:00 AM",
                function: actionforfive,
              ),
              ShadeButton(
                buttonName: six,
                width: 90,
                buttonText: "1:00 PM",
                function: actionforsix,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ShadeButton(
                buttonName: seven,
                width: 90,
                buttonText: "11:00 AM",
                function: actionforseven,
              ),
              ShadeButton(
                buttonName: eight,
                width: 90,
                buttonText: "1:00 AM",
                function: actionforeight,
              ),
              ShadeButton(
                buttonName: nine,
                width: 90,
                buttonText: "1:00 PM",
                function: actionfornine,
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 24,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 20,
            width: double.infinity,
            child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: AutoSizeText(
                    "Done",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
            decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          )
        ],
      ),
    );
  }

  void actionforone() {
    setState(() {
      one = !one;
    });
  }

  void actionfortwo() {
    setState(() {
      two = !two;
    });
  }

  void actionforthree() {
    setState(() {
      three = !three;
    });
  }

  void actionforfour() {
    setState(() {
      four = !four;
    });
  }

  void actionforfive() {
    setState(() {
      five = !five;
    });
  }

  void actionforsix() {
    setState(() {
      six = !six;
    });
  }

  void actionforseven() {
    setState(() {
      seven = !seven;
    });
  }

  void actionforeight() {
    setState(() {
      eight = !eight;
    });
  }

  void actionfornine() {
    setState(() {
      nine = !nine;
    });
  }

  void actionforten() {
    setState(() {
      ten = !ten;
    });
  }

  void actionforeleven() {
    setState(() {
      eleven = !eleven;
    });
  }

  void actionfortwelve() {
    setState(() {
      twelve = !twelve;
    });
  }
}
