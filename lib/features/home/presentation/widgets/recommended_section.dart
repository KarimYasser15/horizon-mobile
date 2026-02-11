import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringsManager.recommended,
            style: TextStyleManager.interSemiBold.copyWith(fontSize: 16.sp),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              StringsManager.seeAll,
              style: TextStyleManager.interSemiBold.copyWith(
                fontSize: 12.sp,
                color: ColorsManager.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
