import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/services/router.dart';
import 'package:google_stadia_app_concept/services/navigation_service.dart';
import 'package:google_stadia_app_concept/styleguide/AppImages.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

class SecondaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.yellow,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    AppImages.game_sekiro,
                    height: AppSizes.heightMultiplier * 40,
                    fit: BoxFit.fitHeight,
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: AppSizes.heightMultiplier * 7,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppSizes.heightMultiplier * 2),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width: AppSizes.heightMultiplier * 0.125),
                            borderRadius: BorderRadius.all(Radius.circular(
                                AppSizes.heightMultiplier * 0.5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSizes.heightMultiplier,
                                  horizontal: AppSizes.heightMultiplier * 1.5),
                              child: InkWell(
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: AppSizes.heightMultiplier * 3,
                                ),
                                onTap: () {
                                  locator<NavigationService>().goBack();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSizes.heightMultiplier,
                                  horizontal: AppSizes.heightMultiplier * 1.5),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: AppSizes.heightMultiplier * 3,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.greenAccent,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.deepOrange,
            ),
          )
        ],
      ),
    );
  }
}
