import 'dart:convert';
import 'package:antidote/helpers/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:antidote/theme.dart';
import 'package:antidote/widgets/fullscreenloader.dart';
import 'package:antidote/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../global.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isFetchingSharedPreferences = false;
  SharedPreferencesHandler preferences = SharedPreferencesHandler();
  GoogleSignIn _googleSignIn;
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();
  @override
  void initState() {
    super.initState();
    this._googleSignIn = GoogleSignIn(scopes: ['email']);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: _buildBody(context),
        ),
        _isLoading ? FullScreenLoader() : Container()
      ],
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Hero(
                  child: Image(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(
                      SplashScreenConfig.logoAssetName,
                    ),
                  ),
                  tag: 'antidote-logo',
                ),
              ),
              Flexible(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppPadding.formFieldPadding[0],
                          right: AppPadding.formFieldPadding[0],
                        ),
                        child: AntidoteTextFormField(
                          controller: phoneController,
                          hintText: 'Enter Your Phone No',
                          icon: AssetImage('assets/icon_phone.png'),
                          validatorFunction: (String text) {
                            if (text.isEmpty) {
                              return 'Input phone number';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppPadding.formFieldPadding[0],
                          right: AppPadding.formFieldPadding[0],
                        ),
                        child: AntidoteTextFormField(
                          controller: passController,
                          hintText: 'Enter Your Password',
                          icon: AssetImage('assets/icon_lock.png'),
                          validatorFunction: (String text) {
                            if (text.isEmpty) {
                              return 'Input password';
                            }
                          },
                        ),
                      ),
                      Container(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.width / 7,
                          minWidth: MediaQuery.of(context).size.width / 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          color: theme.primaryColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 20,
          ),
        ),
      ),
    );
  }

  Future _handleSignInGoogle() async {
    //userCache.clear();
    await preferences.clearPreferences();
    await _googleSignIn.signOut();
    setState(() => _isLoading = true);
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      if (googleUser != null)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
        );
      /* String userId = await service.initiateLogin();
      await userCache.getUser(userId); */
/* 
      await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ()),
          (Route<dynamic> route) => false); */

      // Navigator.of(context).pushNamedAndRemoveUntil(
      //   Routes.home_master,
      //   ModalRoute.withName(Routes.main),
      // );
    } catch (ex) {
      print(ex);
      Alert(
        context: context,
        type: AlertType.error,
        title: "Oops!",
        desc: "An error has occurred",
        buttons: [
          DialogButton(
            child: Text("DISMISS",
                style: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.white,
                    )),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ).show();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future _handleSignInFacebook() async {
    //userCache.clear();
    await preferences.clearPreferences();
    setState(() => _isLoading = true);
    try {
      final result = await facebookLogin.logIn(['email']);

      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final token = result.accessToken.token;
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
          final profile = jsonDecode(graphResponse.body);
          setState(() {
            userProfile = profile;
            _isLoggedIn = true;
          });
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => Home(),
            ),
          );
          break;

        case FacebookLoginStatus.cancelledByUser:
          setState(() => _isLoggedIn = false);
          break;
        case FacebookLoginStatus.error:
          setState(() => _isLoggedIn = false);
          break;
      }
      /* String userId = await service.initiateLogin();
      await userCache.getUser(userId); */
/* 
      await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ()),
          (Route<dynamic> route) => false); */

      // Navigator.of(context).pushNamedAndRemoveUntil(
      //   Routes.home_master,
      //   ModalRoute.withName(Routes.main),
      // );
    } catch (ex) {
      print(ex);
      Alert(
        context: context,
        type: AlertType.error,
        title: "Oops!",
        desc: "An error has occurred",
        buttons: [
          DialogButton(
            child: Text("DISMISS",
                style: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.white,
                    )),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ).show();
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
