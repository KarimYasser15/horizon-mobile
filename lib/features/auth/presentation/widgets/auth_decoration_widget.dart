import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';
import 'package:horizon_mobile/core/widgets/app_logo.dart';
import 'package:horizon_mobile/core/widgets/default_padding.dart';

class AuthDecorationWidget extends StatelessWidget {
  const AuthDecorationWidget({
    super.key,
    required this.mainTitle,
    required this.subTitle,
    required this.child,
  });
  final String mainTitle;
  final String subTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: DefaultPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                const AppLogo(),
                SizedBox(height: 32.h),
                Text(mainTitle, style: TextStyleManager.interBold),
                const SizedBox(height: 8),
                Text(subTitle, style: TextStyleManager.interRegular),
                SizedBox(height: 32.h),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
