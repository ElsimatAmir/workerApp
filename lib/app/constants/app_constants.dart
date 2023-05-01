import 'package:flutter/material.dart';
import 'package:worker/app/constants/app_colors_constants.dart';

class AppConstants {
  static const appName = 'Worker';

  // default values for the app
  static const defaultPadding = 16.0;
  static const defaultTextSize = 14.0;
  static const defaultBorderRadius = 16.0;

  // UI Spinner to use when its loading
  static const spinner = Center(
    child: CircularProgressIndicator(
      strokeWidth: 3,
      color: AppColorsConstants.orange,
    ),
  );

  //text style for headers in app as H1
  static const textStyleH1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColorsConstants.black,
  );

  //text style for small text
  static const textStyleSmallText = TextStyle(
    fontSize: AppConstants.defaultTextSize,
    color: AppColorsConstants.darkGrey,
  );

  //text style for default Text
  static const textStyleDefaultText = TextStyle(
    fontSize: AppConstants.defaultTextSize + 2,
    fontWeight: FontWeight.bold,
    color: AppColorsConstants.black,
  );
}
