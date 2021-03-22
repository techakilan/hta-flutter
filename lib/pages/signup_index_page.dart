import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hta/api/api_service.dart';
import 'package:hta/model/api_models/signup_model.dart';
import 'package:hta/routes/route_names.dart';
import 'package:hta/utils/clippath_util.dart';
import 'package:hta/utils/custom_decoration.dart';
import 'package:hta/utils/validation_util.dart';

class SignupIndexPage extends StatefulWidget {
  @override
  _SignupIndexPageState createState() => _SignupIndexPageState();
}

class _SignupIndexPageState extends State<SignupIndexPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  SignupRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = new SignupRequestModel();
  }

  @override
  Widget build(BuildContext context) {
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
                        child: Text(tr('signup_text'),
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
                                  tr('firstname'), Icon(Icons.person_add)),
                              validator: customValidate,
                              onSaved: (value) =>
                                  {requestModel.firstname = value},
                            ),
                          )),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 40, top: 10, right: 40),
                          child: Container(
                            child: TextFormField(
                              decoration: customInputDecoration(
                                  tr('lastname'), Icon(Icons.person_add_alt_1)),
                              validator: customValidate,
                              onSaved: (value) =>
                                  {requestModel.lastname = value},
                            ),
                          )),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 40, top: 10, right: 40),
                          child: Container(
                            child: TextFormField(
                              decoration: customInputDecoration(
                                  tr('email_input_placeholder'),
                                  Icon(Icons.email)),
                              validator: customValidate,
                              onSaved: (value) => {requestModel.email = value},
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
                                apiService.register(requestModel).then((value) {
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
                                  } else {
                                    if (!value.hasError) {
                                      formKey.currentState.reset();
                                      final signupSucessSnackbar = SnackBar(
                                        content: Text(
                                            'User registered Successfully'),
                                        duration: const Duration(seconds: 5),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(signupSucessSnackbar);
                                      return;
                                    } else {
                                      final signupFailedSnackbar = SnackBar(
                                        content: Text(value.message),
                                        duration: const Duration(seconds: 2),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(signupFailedSnackbar);
                                    }
                                  }
                                });
                              } else {
                                print('validation failed');
                              }
                            },
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.deepOrange, Colors.orange],
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
                                  child: Text(tr('signup_text'),
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 10.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Already registered?',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Padding(padding: EdgeInsets.only(right: 10)),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed(signinRoute);
                                  },
                                  child: Text('Sign In',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
