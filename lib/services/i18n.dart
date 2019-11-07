import 'package:google_stadia_app_concept/localizations/AppLocalizations.dart';
import 'package:google_stadia_app_concept/variables/GlobalVariables.dart';

String i18n(String key) {
  return AppLocalizations.of(GlobalVariables.context).translate(key);
}