import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/styleguide/AppColors.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';

class GameProgressWidget extends StatefulWidget {
  final double gameProgress;

  const GameProgressWidget({Key key, @required this.gameProgress})
      : super(key: key);
  @override
  _GameProgressWidgetState createState() => _GameProgressWidgetState();
}

class _GameProgressWidgetState extends State<GameProgressWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> progressAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    Future.delayed(Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    progressAnimation = Tween<double>(
        begin: 0,
        end: ((AppSizes.isPortrait
            ? AppSizes.screenWidth - AppSizes.heightMultiplier * 6
            : AppSizes.screenHeight -
            AppSizes.heightMultiplier * 6) *
            0.33) *
            widget.gameProgress)
        .animate(controller);
    final width = (AppSizes.isPortrait
            ? AppSizes.screenWidth - AppSizes.heightMultiplier * 6
            : AppSizes.screenHeight - AppSizes.heightMultiplier * 6) *
        0.33;
    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (context, widget) {
        return GestureDetector(
          onTap: () {
            controller.reverse();
          },
          onDoubleTap: () {
            controller.forward();
          },
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: AppSizes.heightMultiplier * 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSizes.heightMultiplier * 0.5)),
                      border: Border.all(
                          color: AppColors.tertiaryTextColor,
                          width: AppSizes.heightMultiplier * 0.1)),
                ),
                Container(
                  width: progressAnimation.value,
                  height: AppSizes.heightMultiplier * 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSizes.heightMultiplier * 0.5)),
                      gradient: AppColors.appGradient),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
