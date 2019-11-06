import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/styleguide/AppTextStyles.dart';

class ContentHeadingWidget extends StatelessWidget {
  final String heading;
  final double marginVertical;

  const ContentHeadingWidget(
      {Key key, @required this.heading, this.marginVertical})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: marginVertical),
      child: Text(
        heading,
        style: AppTextStyles.headingOneTextStyle,
      ),
    );
  }
}
