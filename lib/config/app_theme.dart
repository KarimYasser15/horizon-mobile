import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.whitishGrey,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((
        Set<WidgetState> states,
      ) {
        final Color color;
        if (states.contains(WidgetState.error)) {
          color = ColorsManager.red;
        } else if (states.contains((WidgetState.focused))) {
          color = ColorsManager.blue;
        } else {
          color = ColorsManager.white;
        }
        return TextStyleManager.interRegular.copyWith(color: color);
      }),
      errorMaxLines: 3,
      errorStyle: TextStyle(
        color: ColorsManager.red,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyleManager.interRegular.copyWith(
        color: ColorsManager.black,
      ),
      hintStyle: TextStyleManager.interRegular.copyWith(
        color: ColorsManager.grey,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: ColorsManager.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: ColorsManager.white, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: ColorsManager.white, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: ColorsManager.white, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.white, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
