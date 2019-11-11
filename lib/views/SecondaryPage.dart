import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/model/AppData.dart';
import 'package:google_stadia_app_concept/services/i18n.dart';
import 'package:google_stadia_app_concept/services/navigation_service.dart';
import 'package:google_stadia_app_concept/styleguide/AppColors.dart';
import 'package:google_stadia_app_concept/styleguide/AppImages.dart';
import 'package:google_stadia_app_concept/styleguide/AppTextStyles.dart';
import 'package:google_stadia_app_concept/variables/GlobalVariables.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';
import 'package:google_stadia_app_concept/widgets/ContentHeadingWidget.dart';
import 'package:google_stadia_app_concept/widgets/PopularWithFriendsWidget.dart';

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
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.heightMultiplier * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ContentHeadingWidget(
                    heading: "Popular with friends",
                    marginVertical: AppSizes.heightMultiplier * 2,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          for (var i = 0;
                              i < AppData.gamesOfFriends.length;
                              i++)
                            PopularWithFriendsWidget(
                              imagePath: AppData.gamesOfFriends[i].imagePath,
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.heightMultiplier * 2),
                  child: ContentHeadingWidget(
                    heading: "Continue playing",
                    marginVertical: AppSizes.heightMultiplier,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppSizes.heightMultiplier * 2,
                          right: AppSizes.heightMultiplier * 2,
                          top: AppSizes.heightMultiplier,
                          bottom: AppSizes.heightMultiplier * 2,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: AppColors.appGradient,
                              borderRadius: BorderRadius.circular(
                                  AppSizes.heightMultiplier * 1.5)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: AppSizes.heightMultiplier),
                            child: Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              AppSizes.heightMultiplier)),
                                      child: Image.asset(
                                        AppData.lastPlayedGames[0].imagePath,
                                        height: AppSizes.heightMultiplier * 15,
                                        width: AppSizes.heightMultiplier * 10,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: AppSizes.heightMultiplier,
                                      right: AppSizes.heightMultiplier,
                                      top: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.red,
                                          size: AppSizes.heightMultiplier * 3,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppSizes.heightMultiplier * 1.5),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            AppSizes.heightMultiplier * 20),
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                AppData.lastPlayedGames[0].name,
                                            style: AppTextStyles
                                                .newGameNameTextStyle),
                                        TextSpan(text: '\n'),
                                        TextSpan(
                                            text:
                                                "${AppData.lastPlayedGames[0].hoursPlayed} hours played",
                                            style:
                                                AppTextStyles.newGameTextStyle)
                                      ]),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 20,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
