import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_stadia_app_concept/constant/routes.dart';
import 'package:google_stadia_app_concept/localizations/AppLocalizations.dart';
import 'package:google_stadia_app_concept/services/navigation_service.dart';
import 'package:google_stadia_app_concept/services/router.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

//void main() => runApp(DevicePreview(
//      builder: (context) => MyApp(),
//    ));
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            AppSizes().init(constraints, orientation);
            return MaterialApp(
              title: 'Google Stadia App Concept',
              debugShowCheckedModeBanner: false,
              supportedLocales: [
                Locale('en', 'US'),
                Locale('vi', 'VN'),
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              theme: ThemeData(
                  canvasColor: Colors.white,
                  primarySwatch: Colors.blue,
                  fontFamily: 'Oxygen'),
              navigatorKey: navigatorKey,
              onGenerateRoute: generateRoute,
              initialRoute: Routes.SecondaryPage,
            );
          },
        );
      },
    );
  }
}
