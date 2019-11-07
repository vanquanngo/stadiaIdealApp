import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/constant/routes.dart';
import 'package:google_stadia_app_concept/pages/LandingPage.dart';
import 'package:google_stadia_app_concept/pages/SecondaryPage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_stadia_app_concept/services/navigation_service.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.LandingPage:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case Routes.SecondaryPage:
      return MaterialPageRoute(
          builder: (context) => SecondaryPage());
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


GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}