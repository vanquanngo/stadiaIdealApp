import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/constant/routes.dart';
import 'package:google_stadia_app_concept/views/LandingPage.dart';
import 'package:google_stadia_app_concept/views/SecondaryPage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.LandingPage:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case Routes.SecondaryPage:
      return MaterialPageRoute(builder: (context) => SecondaryPage());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
