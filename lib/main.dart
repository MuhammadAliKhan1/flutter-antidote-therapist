import 'package:antidote/screens/home.dart';
import 'package:antidote/screens/login.dart';
import 'package:antidote/screens/patientfilter.dart';
import 'package:antidote/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antidote/theme.dart';
import 'global.dart';

void main() => runApp(AntidoteApp());

class AntidoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        body: SplashScreen(),
      ),
      routes: {
        Routes.home: (context) => new Home(),
        Routes.main: (context) => new LoginScreen(),
        Routes.profileFilter: (context) => new ProfileFilter()
      },
    );
  }
}
