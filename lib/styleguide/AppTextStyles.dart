import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/styleguide/AppColors.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

class AppTextStyles {
  static TextStyle userNameTextStyle = TextStyle(
      fontSize: AppSizes.heightMultiplier * 3,
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.w400);

  static TextStyle rankTextStyle = TextStyle(
      fontSize: AppSizes.heightMultiplier * 2,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static TextStyle hoursPlayedLabelTextStyle = TextStyle(
    fontSize: AppSizes.heightMultiplier * 1.22,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle hoursPlayedTextStyle = TextStyle(
    fontSize: AppSizes.heightMultiplier * 3,
    color: AppColors.secondaryTextColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle headingOneTextStyle = TextStyle(
    fontSize: AppSizes.heightMultiplier * 2,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingTwoTextStyle = TextStyle(
    fontSize: AppSizes.heightMultiplier * 1.5,
    color: Colors.grey.shade900,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyTextStyle = TextStyle(
    fontSize: AppSizes.heightMultiplier * 1.5,
    color: Colors.grey.shade600,
  );

  static TextStyle newGameTextStyle =
      TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700);

  static TextStyle newGameNameTextStyle =
      TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700);

  static TextStyle playWhiteTextStyle = TextStyle(
      fontSize: 14, color: AppColors.firstColor, fontWeight: FontWeight.w700);
}
