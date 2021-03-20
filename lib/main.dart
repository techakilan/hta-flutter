import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hta/routes/custom_router.dart';
import 'package:hta/routes/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: rootRoute,
      onGenerateRoute: CustomRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
