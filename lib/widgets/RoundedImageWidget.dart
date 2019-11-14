import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/styleguide/AppColors.dart';
import 'package:google_stadia_app_concept/styleguide/AppTextStyles.dart';
import 'package:google_stadia_app_concept/variables/SizeConfig.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RoundedImageWidget extends StatelessWidget {
  final isOnline;
  final int ranking;
  final String imagePath;
  final double imageSize;
  final String name;

  const RoundedImageWidget({
    Key key,
    this.isOnline = false,
    this.ranking,
    @required this.imagePath,
    this.name,
    this.imageSize = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.heightMultiplier),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: imageSize + AppSizes.heightMultiplier,
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  painter: RoundedImageBorder(isOnline: isOnline),
                  child: Container(
                    child: ClipOval(
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: imageSize,
                        height: imageSize,
                      ),
                    ),
                  ),
                ),
                if (ranking != null)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: ClipOval(
                      child: Container(
                        height: AppSizes.heightMultiplier * 3.5,
                        width: AppSizes.heightMultiplier * 3.5,
                        decoration:
                            BoxDecoration(gradient: AppColors.appGradient),
                        child: Center(
                          child: Text(
                            ranking.toString(),
                            style: AppTextStyles.rankTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (name != null)
            Text(
              name,
              style: AppTextStyles.bodyTextStyle,
            )
        ],
      ),
    );
  }
}

class RoundedImageBorder extends CustomPainter {
  final bool isOnline;

  RoundedImageBorder({this.isOnline});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    if (isOnline) {
      borderPaint.shader = AppColors.appGradient.createShader(
          Rect.fromCircle(center: center, radius: size.width / 2));
    } else {
      borderPaint.color = AppColors.tertiaryTextColor;
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(360), false, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
