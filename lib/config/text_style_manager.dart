import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizon_mobile/config/colors_manager.dart';

class TextStyleManager {
  static TextStyle interRegular = GoogleFonts.inter(
    color: ColorsManager.grey,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static TextStyle interMedium = GoogleFonts.inter(
    color: ColorsManager.black,
    fontWeight: FontWeight.w500,
    fontSize: 13.sp,
  );
  static TextStyle interSemiBold = GoogleFonts.inter(
    color: ColorsManager.black,
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
  );
  static TextStyle interBold = GoogleFonts.inter(
    color: ColorsManager.black,
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
  );
}
