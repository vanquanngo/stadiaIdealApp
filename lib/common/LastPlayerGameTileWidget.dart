import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/common/GameProgressWidget.dart';
import 'package:google_stadia_app_concept/model/LastPlayedGameModel.dart';
import 'package:google_stadia_app_concept/styleguide/AppTextStyles.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

class LastPlayerGameTileWidget extends StatelessWidget {
  final LastPlayedGameModel lastPlayedGame;
  final double gameProgress;

  const LastPlayerGameTileWidget(
      {Key key, @required this.lastPlayedGame, @required this.gameProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textMaxWidth =
        ((AppSizes.isPortrait ? AppSizes.screenWidth : AppSizes.screenHeight) -
                    AppSizes.heightMultiplier * 6) *
                0.66 -
            AppSizes.heightMultiplier * 7;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.heightMultiplier),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSizes.heightMultiplier)),
                      child: Image.asset(
                        lastPlayedGame.imagePath,
                        height: AppSizes.heightMultiplier * 6.5,
                        width: AppSizes.heightMultiplier * 5.4,
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
                            shape: BoxShape.circle, color: Colors.white),
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
                      horizontal: AppSizes.heightMultiplier * 1.5),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: textMaxWidth),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: lastPlayedGame.name,
                            style: AppTextStyles.headingTwoTextStyle),
                        TextSpan(text: '\n'),
                        TextSpan(
                            text: "${lastPlayedGame.hoursPlayed} hours played",
                            style: AppTextStyles.bodyTextStyle)
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GameProgressWidget(
              gameProgress: gameProgress,
            ),
          )
        ],
      ),
    );
  }
}
