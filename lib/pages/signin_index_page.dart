import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hta/api/api_service.dart';
import 'package:hta/model/signin_model.dart';
import 'package:hta/routes/route_names.dart';
import 'package:hta/utils/api_progress_spinner.dart';
import 'package:hta/utils/clippath_util.dart';
import 'package:hta/utils/custom_decoration.dart';
import 'package:hta/utils/validation_util.dart';
//import 'package:hta/routes/route_names.dart';

class SigninIndexPage extends StatefulWidget {
  @override
  _SigninIndexPageState createState() => _SigninIndexPageState();
}

class _SigninIndexPageState extends State<SigninIndexPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  SigninRequestModel requestModel;
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
    requestModel = new SigninRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ApiProgressSpinner(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Locale selectedLocale = EasyLocalization.of(context).locale;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              if (selectedLocale == Locale('en', 'US'))
                ClipPath(
                  clipper: DrawClipSmallLTR(),
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.orange.withOpacity(0.5),
                        Colors.deepOrange.withOpacity(0.5)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                    )),
                  ),
                ),
              if (selectedLocale == Locale('en', 'US'))
                ClipPath(
                  clipper: DrawClipBigLTR(),
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.deepOrange,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                    )),
                  ),
                ),
              if (selectedLocale == Locale('ar', 'SA'))
                ClipPath(
                  clipper: DrawClipSmallRTL(),
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.orange.withOpacity(0.5),
                        Colors.deepOrange.withOpacity(0.5)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                    )),
                  ),
                ),
              if (selectedLocale == Locale('ar', 'SA'))
                ClipPath(
                  clipper: DrawClipBigRTL(),
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.deepOrange,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                    )),
                  ),
                ),

              //padding: const EdgeInsets.only(left: 40, top: 100),
              Container(
                height: size.height,
                width: size.width,
                child: Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 40, left: 40, top: 100),
                          child: Text(tr('welcome_message'),
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(left: 40, top: 120, right: 40),
                            child: Container(
                              child: TextFormField(
                                decoration: customInputDecoration(
                                    tr('email_input_placeholder'),
                                    Icon(Icons.email)),
                                validator: customValidate,
                                onSaved: (value) =>
                                    {requestModel.email = value},
                              ),
                            )),
                        Padding(
                            padding:
                                EdgeInsets.only(left: 40, top: 10, right: 40),
                            child: Container(
                              child: TextFormField(
                                obscureText: true,
                                decoration: customInputDecoration(
                                    tr('password_input_placeholder'),
                                    Icon(Icons.lock)),
                                validator: customValidate,
                                onSaved: (value) =>
                                    {requestModel.password = value},
                              ),
                            )),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 20),
                            child: InkWell(
                              onTap: () {
                                print("forgot password pressed");
                              },
                              child: Text(
                                tr('forgot_password_text'),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 40, top: 20, left: 40),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(signupRoute);
                              },
                              child: Text(
                                tr('signup_text'),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: TextButton(
                              onPressed: () {
                                if (validateAndSave()) {
                                  setState(() {
                                    isApiCallProcess = true;
                                  });
                                  APIService apiService = new APIService();
                                  apiService.login(requestModel).then((value) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });
                                    if (value == null) {
                                      final unknownErrorSnackBar = SnackBar(
                                        content: Text(
                                            'Sorry! An Unknown error occurred'),
                                        duration: const Duration(seconds: 5),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(unknownErrorSnackBar);
                                      return;
                                    }

                                    if (!value.hasError) {
                                      if (value.token.isNotEmpty) {
                                        formKey.currentState.reset();
                                        Navigator.of(context)
                                            .pushReplacementNamed(homeRoute);
                                      }
                                    } else {
                                      final loginFailedSnackBar = SnackBar(
                                        content: Text(value.message),
                                        duration: const Duration(seconds: 2),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(loginFailedSnackBar);
                                    }
                                  });
                                } else {
                                  print("validation failed");
                                }
                              },
                              child: Material(
                                elevation: 10,
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.deepOrange,
                                        Colors.orange
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomLeft,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  height: 40,
                                  child: Center(
                                    child: Text(tr('login_text'),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                TextButton.icon(
                                    label: Text(
                                      'ENGLISH',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    icon: Image.network(
                                        'https://cdn2.iconfinder.com/data/icons/flags_gosquared/64/United-States_flat.png',
                                        height: 50,
                                        width: 50),
                                    onPressed: () {
                                      setState(() {
                                        EasyLocalization.of(context)
                                            .setLocale(Locale('en', 'US'));
                                      });
                                    }),
                                TextButton.icon(
                                    label: Text(
                                      '????????',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    icon: Image.network(
                                      'https://cdn1.iconfinder.com/data/icons/ensign-11/512/194_Ensign_Flag_Nation_oman-128.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        EasyLocalization.of(context)
                                            .setLocale(Locale('ar', 'SA'));
                                      });
                                    }),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
