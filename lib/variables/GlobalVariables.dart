import 'package:flutter/cupertino.dart';

class GlobalVariables {
  static BuildContext context;
  static init(BuildContext cxt) {
    context = cxt;
  }
}