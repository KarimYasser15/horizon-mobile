import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const NetworkImage(
              'https://i.pravatar.cc/150?u=sarah',
            ),
          ),
        ],
      ),
    );
  }
}
