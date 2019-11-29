import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_stadia_app_concept/constant/routes.dart';
import 'package:google_stadia_app_concept/model/AppData.dart';
import 'package:google_stadia_app_concept/services/i18n.dart';
import 'package:google_stadia_app_concept/services/navigation_service.dart';
import 'package:google_stadia_app_concept/styleguide/AppColors.dart';
import 'package:google_stadia_app_concept/styleguide/AppImages.dart';
import 'package:google_stadia_app_concept/styleguide/AppTextStyles.dart';
import 'package:google_stadia_app_concept/variables/GlobalVariables.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';
import 'package:google_stadia_app_concept/widgets/ContentHeadingWidget.dart';
import 'package:google_stadia_app_concept/widgets/LastPlayerGameTileWidget.dart';
import 'package:google_stadia_app_concept/widgets/RoundedImageWidget.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token){
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalVariables.init(context);
    final logoHeight = AppSizes.screenHeight * 0.4;

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Stack(
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
                          InkWell(
                            child: Icon(
                              Icons.menu,
                              color: AppColors.primaryTextColor,
                              size: AppSizes.heightMultiplier * 3,
                            ),
                            onTap: () {
                              navigatorKey.currentState
                                  .pushNamed(Routes.SecondaryPage);
                            },
                          ),
                          InkWell(
                            child: Icon(
                              Icons.search,
                              color: AppColors.primaryTextColor,
                              size: AppSizes.heightMultiplier * 3,
                            ),
                            onTap: () {
                              final snackBar = SnackBar(content: Text(FlutterConfig.get('APP_NAME')));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
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
                                    ranking: 12,
                                    imageSize: AppSizes.heightMultiplier * 7.3,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizes.heightMultiplier * 2),
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: i18n("hello"),
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
                                          i18n("hours_played"),
                                          style: AppTextStyles
                                              .hoursPlayedLabelTextStyle,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppSizes.heightMultiplier * 0.5,
                                    ),
                                    Text(
                                      "297 ${i18n("hours")}",
                                      style: AppTextStyles.hoursPlayedTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ContentHeadingWidget(
                            heading: i18n("last_played_games"),
                            marginVertical: AppSizes.heightMultiplier * 2,
                          ),
                          for (var i = 0; i < AppData.lastPlayedGames.length; i++)
                            LastPlayerGameTileWidget(
                              lastPlayedGame: AppData.lastPlayedGames[i],
                              gameProgress: AppData.lastPlayedGames[i].gameProgress,
                            ),
                          ContentHeadingWidget(
                            heading: i18n("friends"),
                            marginVertical: AppSizes.heightMultiplier * 2,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          for (var i = 0; i < AppData.friends.length; i++)
                            RoundedImageWidget(
                              imagePath: AppData.friends[i].imagePath,
                              isOnline: AppData.friends[i].isOnline,
                              name: AppData.friends[i].name,
                              imageSize: AppSizes.heightMultiplier * 7.3,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
