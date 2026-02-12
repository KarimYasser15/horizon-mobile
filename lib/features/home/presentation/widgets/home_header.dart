import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horizon_mobile/config/assets_manager.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  const HomeHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringsManager.goodMorning,
                style: TextStyleManager.interRegular.copyWith(fontSize: 13.sp),
              ),
              Text(
                userName,
                style: TextStyleManager.interBold.copyWith(fontSize: 20.sp),
              ),
            ],
          ),
          Container(
            width: 40.r,
            height: 40.r,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: const Color(0xffF1F5F9),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              IconsManager.profile,
              colorFilter: ColorFilter.mode(
                const Color(0xff94A3B8),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
