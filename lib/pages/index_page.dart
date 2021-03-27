import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hta/routes/route_names.dart';
import 'package:hta/utils/back_pressed.dart';
import 'package:hta/utils/clippath_util.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Locale selectedLocale = EasyLocalization.of(context).locale;

    return WillPopScope(
      onWillPop: () {
        return onBackPressed(context);
      },
      child: Scaffold(
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 40, left: 40, top: 100),
                          child: Text('Thank you',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, top: 120, right: 40),
                          child: Container(
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(16.0),
                              color: Colors.orange,
                            ),
                            child: Text('Hope you enjoyed using the App!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, top: 20, right: 40),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, signinRoute);
                            },
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: 125,
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
                                  child: Text('Go back to App',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
