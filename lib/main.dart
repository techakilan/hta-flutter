import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hta/api/shared_service.dart';
import 'package:hta/routes/custom_router.dart';
import 'package:hta/routes/route_names.dart';
import 'package:provider/provider.dart';

String _defaultInitialRoute = signinRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  bool isLoggedIn = await SharedService.isLoggedIn();

  if (isLoggedIn) {
    _defaultInitialRoute = homeRoute;
  }

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
        path:
            'assets/translations', // <-- change the path of the translation files
        startLocale: Locale('ar', 'SA'),
        fallbackLocale: Locale('en', 'US'),
        saveLocale: true,
        child: MyApp()),
  );
}

class SiginInStatusChangeNotifier extends ChangeNotifier {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new SiginInStatusChangeNotifier(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: _defaultInitialRoute,
        onGenerateRoute: CustomRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
