import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:antidote/helpers/locator.dart';
import 'package:antidote/helpers/navigation_service.dart';
import 'package:antidote/helpers/shared_preferences.dart';

abstract class Routes {
  static const String home = '/home_master';
  static const String main = '/main';
  static const String profileFilter = '/profile_filter';
}

abstract class SplashScreenConfig {
  static const String logoAssetName = 'assets/antidote.png';
  static const Color backgroundColor = Colors.white;
}

abstract class AppPadding {
  static const List<double> formFieldPadding = [40, 60];
}

abstract class Buttons {
  static const String Google = 'Google Sign In';
  static const String Facebook = 'Facebook Sign In';
}

//UserCache userCache = new UserCache();
final Future<SharedPreferences> sharedPreferences =
    SharedPreferences.getInstance();

abstract class AppColors {
  //Colors
  static const blue = Color(0xff10799F);
  static const grey = Color(0xff616161);
  static const lightBlue = Color(0xff49B8CB);
  static const lightGrey = Color(0xff8E8E8E);
  static const deepGrey = Color(0xff565656);
  static const red = Color(0xffEE5858);
  static const darkBlue = Color(0xff1A769F);
  static const normalGrey = Color(0xff787878);
  static const darkRed = Color(0xffE73531);
  static const hardRed = Color(0xffEB231E);
  static const hardblue = Color(0xff17779D);
  static const offWhite = Color(0xffF2F3F5);
  static const seaGreen = Color(0xff37CBA5);
  static const dullWhite = Color(0xffC4C4C4);
  static const skyBlue = Color(0xff46B3C8);
  static const slightOffWhite = Color(0xffE4E5E7);
  static const White = Color(0xffEEEEEE);
  static const slightGrey = Color(0xff9E9E9E);
  static const green = Color(0xff26BA2C);
}

abstract class FireStoreKeys {
  static const String patientsCollection = 'patients';
  static const String therapistsCollection = 'therapists';
  static const String diaryCollection = 'diary';
  static const String messagesCollection = 'message';
  static const String chatCollection = 'chatSession';
}

abstract class AppImages {
  //Images
  static const AssetImage accountWithDollar = AssetImage('assets/account.png');
  static const AssetImage logo = AssetImage('assets/logo.png');
  static const AssetImage notification = AssetImage('assets/notification.png');
  static const AssetImage baldMan = AssetImage("assets/profile_image1.png");
  static const AssetImage decentMan = AssetImage("assets/profile_image2.png");
  static const AssetImage logoWithTitle =
      AssetImage("assets/logo_with_title.png");
  static const AssetImage explore = AssetImage("assets/explore.png");
  static const AssetImage forum = AssetImage("assets/forum.png");
  static const AssetImage chat = AssetImage("assets/chat.png");
  static const AssetImage profile = AssetImage("assets/profile.png");
  static const AssetImage gear = AssetImage("assets/gear.png");
  static const AssetImage chat_text = AssetImage("assets/chat_text.png");
  static const AssetImage exploreText = AssetImage("assets/explore_text.png");
  static const AssetImage profileText = AssetImage("assets/profile_text.png");
  static const AssetImage calendarIcon = AssetImage("assets/calendar.png");
  static const AssetImage message_envelope = AssetImage("assets/envelope.png");
  static const AssetImage videoSymbol = AssetImage("assets/video_symbol.png");
  static const AssetImage phoneIcon = AssetImage("assets/phone.png");
  static const AssetImage notAvailable = AssetImage("assets/not_available.png");
  static const AssetImage available = AssetImage("assets/available.png");
  static const AssetImage selectedDay = AssetImage("assets/selected_day.png");
  static const AssetImage pay = AssetImage("assets/pay.png");
  static const AssetImage paypalLogo = AssetImage("assets/paypal_logo.png");
  static const AssetImage onlineStatus = AssetImage("assets/onlineStatus.png");
  static const AssetImage typing = AssetImage("assets/typing.png");
  static const AssetImage microphone = AssetImage("assets/microphone.png");
  static const AssetImage pickupCall = AssetImage("assets/answer_call.png");
  static const AssetImage hangupCall = AssetImage("assets/hangup_call.png");
}

abstract class LoginStatus {
  static bool fLoginStatus = false;
  static bool gLoginStatus = false;
}

abstract class RouteNames {
  static const String splashScreen = 'splash';
  static const String homeScreen = 'home';
  static const String loginScreen = 'login';
  static const String signUpScreen = 'signup';
}

//UserCache userCache = new UserCache();
SharedPreferencesHandler prefHandle = SharedPreferencesHandler();
bool isLoading = false;
String therapistNumber;
final NavigationService navigationService = locator<NavigationService>();
final twillioAPIKey = 'SK3d3ca157c18a3adf2532bd51f18d82fc';

// Agora AppId
const APP_ID = 'd14d747a7f834715bb8b30c69c242467';
//TODO: Add Google Login to IOS .plist file
//TODO: Add Facebook Login to IOS .plist file
//TODO: add internet permission ios
//TODO: add firestore permssion ios
