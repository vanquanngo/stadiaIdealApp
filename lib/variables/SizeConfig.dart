import 'package:flutter/cupertino.dart';

class AppSizes {
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double screenWidth;
  static double screenHeight;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;

  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockSizeHorizontal = screenWidth / 100;
    _blockSizeVertical = screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    AppSizes.heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;

    print("heightmuti $AppSizes.heightMultiplier");
    print("widthmuti $imageSizeMultiplier");
    print("width $screenWidth");
    print("height $screenHeight");
    print("isPotrait $isPortrait");
  }
}
