import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/styleguide/AppTextStyles.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

class PopularWithFriendsWidget extends StatelessWidget {
  final String imagePath;

  const PopularWithFriendsWidget({Key key, @required this.imagePath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.heightMultiplier,
          vertical: AppSizes.heightMultiplier),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: AppSizes.heightMultiplier * 1.5),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(AppSizes.heightMultiplier * 1.3),
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          Positioned(
            bottom: AppSizes.heightMultiplier,
            left: AppSizes.heightMultiplier * 2.5,
            right: AppSizes.heightMultiplier * 2.5,
            child: InkWell(
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.all(
                    Radius.circular(AppSizes.heightMultiplier * 1)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.heightMultiplier,
                      vertical: AppSizes.heightMultiplier * 0.5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppSizes.heightMultiplier * 1)),
                  ),
                  child: Text(
                    "Play",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.playWhiteTextStyle,
                  ),
                ),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
