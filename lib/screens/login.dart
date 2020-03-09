import 'package:antidote/models/therapist_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:antidote/theme.dart';
import 'package:antidote/widgets/fullscreenloader.dart';
import 'package:antidote/widgets/textformfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../global.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Used in form
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  TextEditingController phoneRegController = TextEditingController();
  TextEditingController nameRegController = TextEditingController();
  TextEditingController passRegController = TextEditingController();
  PanelController _pc = new PanelController();
  Function refresh;

  @override
  void initState() {
    refresh = () {
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                AbsorbPointer(
                  child: _buildBody(context),
                  absorbing: isLoading,
                ),
                SlidingUpPanel(
                  controller: _pc,
                  backdropEnabled: true,
                  collapsed: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Create a therapist',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            color: theme.primaryColor,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          ' (WILL BE REMOVED) ',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                  panel: _buildFormTherapist(),
                ),
              ],
            ),
          ),
        ),
        isLoading ? FullScreenLoader() : Container()
      ],
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                    width: MediaQuery.of(context).size.width * 2,
                    image: AssetImage(
                      SplashScreenConfig.logoAssetName,
                    ),
                  ),
                  tag: 'antidote-logo',
                ),
              ),
              Flexible(
                flex: 2,
                child: _buildForm(),
              ),
            ],
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 100,
          ),
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
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
                if (_formKey.currentState.validate()) {
                  _handleSignIn();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Form _buildFormTherapist() {
    return Form(
      key: _formKeyRegister,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          bottom: 50,
        ),
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
                controller: nameRegController,
                hintText: 'Enter Full Name',
                icon: AssetImage(
                  'assets/placeholder.png',
                ),
                validatorFunction: (String text) {
                  if (text.isEmpty) {
                    return 'Input name';
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
                controller: phoneRegController,
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
                controller: passRegController,
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
                  'Register',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                color: theme.primaryColor,
                onPressed: () async {
                  if (_formKeyRegister.currentState.validate()) {
                    String number = phoneRegController.text.toString();
                    String password = passRegController.text.toString();
                    String name = nameRegController.text.toString();
                    clearTextFormFieldsRegister();
                    setState(() {
                      isLoading = true;
                    });
                    DocumentSnapshot therapist = await Firestore.instance
                        .collection(FireStoreKeys.therapistsCollection)
                        .document(number)
                        .get();

                    if (!therapist.exists) {
                      Map<String, dynamic> map = {
                        'mobileNumber': number.toString(),
                        'password': password.toString(),
                        'name': name.toString(),
                      };
                      await Firestore.instance
                          .collection(FireStoreKeys.therapistsCollection)
                          .document(number)
                          .setData(
                            Therapist.fromMap(map).toJson(),
                            merge: true,
                          );
                    }
                    clearTextFormFieldsRegister();
                    _pc.close();
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clearTextFormFieldsRegister() {
    nameRegController.clear();
    phoneRegController.clear();
    passRegController.clear();

    FocusScope.of(context).requestFocus(FocusNode());
  }

  void clearTextFormFieldsLogin() {
    phoneController.clear();
    passController.clear();

    FocusScope.of(context).requestFocus(FocusNode());
  }

  Future _handleSignIn() async {
    await prefHandle.clearPreferences();
    String number = phoneController.text.toString();
    String password = passController.text.toString();

    clearTextFormFieldsLogin();
    setState(() => isLoading = true);

    try {
      DocumentSnapshot therapist = await Firestore.instance
          .collection(FireStoreKeys.therapistsCollection)
          .document(number)
          .get();
      setState(() {
        isLoading = false;
      });
      if (therapist.exists &&
          password == therapist.data['password'].toString()) {
        print(number);
        prefHandle.setPreference('therapistNumber', number);
        therapistNumber = number;
        await navigationService.navigateToPushReplacement(
          RouteNames.homeScreen,
        );
      } else {
        clearTextFormFieldsLogin();
        throw ('ERROR');
      }
    } catch (ex) {
      print(ex);
      Alert(
        context: context,
        type: AlertType.error,
        title: "User doesn't exist",
        desc: "Username/password provided are incorrect.",
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
      clearTextFormFieldsLogin();
      setState(
        () => isLoading = false,
      );
    }
  }
}
