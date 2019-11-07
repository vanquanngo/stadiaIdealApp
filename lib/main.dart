import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/pages/SecondaryPage.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

//void main() => runApp(DevicePreview(
//      builder: (context) => MyApp(),
//    ));
void main() => runApp(MyApp());

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
              theme: ThemeData(
                  canvasColor: Colors.white,
                  primarySwatch: Colors.blue,
                  fontFamily: 'Oxygen'),
              home: SecondaryPage(),
            );
          },
        );
      },
    );
  }
}
