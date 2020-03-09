import 'package:antidote/models/inherited/therapist_data.dart';
import 'package:antidote/screens/home.dart';
import 'package:antidote/screens/login.dart';
import 'package:antidote/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antidote/theme.dart';
import 'global.dart';
import 'helpers/locator.dart';
import 'helpers/navigation_service.dart';

void main() {
  setupLocator();
  runApp(
    AntidoteApp(),
  );
}

class AntidoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return TherapistInherit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Antidote',
        theme: theme,
        navigatorKey: locator<NavigationService>().navigatorKey,
        initialRoute: 'splash',
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case RouteNames.splashScreen:
              return MaterialPageRoute(builder: (context) => SplashScreen());
            case RouteNames.loginScreen:
              return MaterialPageRoute(builder: (context) => LoginScreen());
            case RouteNames.homeScreen:
              return MaterialPageRoute(builder: (context) => Home());
            default:
              return MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No path for ${routeSettings.name}'),
                  ),
                ),
              );
          }
        },
      ),
      therapistData: null,
    );
  }
}
