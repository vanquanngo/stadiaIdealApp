import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/services/i18n.dart';
import 'package:google_stadia_app_concept/services/navigation_service.dart';
import 'package:google_stadia_app_concept/styleguide/AppColors.dart';
import 'package:google_stadia_app_concept/styleguide/AppImages.dart';
import 'package:google_stadia_app_concept/styleguide/AppTextStyles.dart';
import 'package:google_stadia_app_concept/variables/GlobalVariables.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

class SecondaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalVariables.init(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  AppImages.game_sekiro,
                  height: AppSizes.heightMultiplier * 40,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.5),
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSizes.heightMultiplier * 0.5),
                        ),
                      ),
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
                                navigatorKey.currentState.pop();
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
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: AppSizes.heightMultiplier * 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: i18n("new_game"),
                                    style: AppTextStyles.newGameTextStyle),
                                TextSpan(text: '\n'),
                                TextSpan(
                                  text: "Shekiro Shadow dies twice",
                                  style: AppTextStyles.newGameNameTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.heightMultiplier * 2.5,
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.heightMultiplier * 4,
                                  vertical: AppSizes.heightMultiplier * 0.5),
                              decoration: BoxDecoration(
                                gradient: AppColors.appGradient,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      AppSizes.heightMultiplier * 0.5),
                                ),
                              ),
                              child: Text(
                                "Play",
                                style: AppTextStyles.newGameTextStyle,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
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
