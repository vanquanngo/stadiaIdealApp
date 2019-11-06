import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_stadia_app_concept/common/ContentHeadingWidget.dart';
import 'package:google_stadia_app_concept/common/LastPlayerGameTileWidget.dart';
import 'package:google_stadia_app_concept/common/RoundedImageWidget.dart';
import 'package:google_stadia_app_concept/model/AppData.dart';
import 'package:google_stadia_app_concept/styleguide/AppColors.dart';
import 'package:google_stadia_app_concept/styleguide/AppImages.dart';
import 'package:google_stadia_app_concept/styleguide/AppTextStyles.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logoHeight = AppSizes.screenHeight * 0.4;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(AppSizes.screenWidth * 0.5, 10),
            child: Transform.rotate(
                angle: -0.1,
                child: SvgPicture.asset(AppImages.logo,
                    height: logoHeight, color: AppColors.logoTintColor)),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: AppSizes.heightMultiplier * 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.heightMultiplier * 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.menu,
                        color: AppColors.primaryTextColor,
                        size: AppSizes.heightMultiplier * 3,
                      ),
                      Icon(
                        Icons.search,
                        color: AppColors.primaryTextColor,
                        size: AppSizes.heightMultiplier * 3,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.heightMultiplier * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppSizes.heightMultiplier * 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RoundedImageWidget(
                                imagePath: AppImages.player1,
                                isOnline: true,
                                showRanking: true,
                                ranking: 12,
                                imageSize: AppSizes.heightMultiplier * 7.3,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizes.heightMultiplier * 2),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Hello",
                                        style: AppTextStyles.userNameTextStyle),
                                    TextSpan(
                                      text: '\n',
                                    ),
                                    TextSpan(
                                        text: "Quan Ngo",
                                        style: AppTextStyles.userNameTextStyle)
                                  ]),
                                ),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AppSizes.heightMultiplier,
                            bottom: AppSizes.heightMultiplier,
                            top: AppSizes.heightMultiplier),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppSizes.heightMultiplier * 1.5)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: AppSizes.heightMultiplier * 1.9,
                                right: AppSizes.heightMultiplier * 1.9,
                                top: AppSizes.heightMultiplier * 1.9,
                                bottom: AppSizes.heightMultiplier * 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "HOURS PLAYED",
                                      style: AppTextStyles
                                          .hoursPlayedLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppSizes.heightMultiplier * 0.5,
                                ),
                                Text(
                                  "297 Hours",
                                  style: AppTextStyles.hoursPlayedTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ContentHeadingWidget(
                        heading: "Last played games",
                        marginVertical: AppSizes.heightMultiplier * 1.5,
                      ),
                      for (var i = 0; i < AppData.lastPlayedGames.length; i++)
                        LastPlayerGameTileWidget(
                          lastPlayedGame: AppData.lastPlayedGames[i],
                          gameProgress: AppData.lastPlayedGames[i].gameProgress,
                        )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}