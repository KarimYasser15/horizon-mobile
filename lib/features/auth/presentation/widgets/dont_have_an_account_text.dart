import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/routes_manager.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsManager.dontHaveAnAccount,
          style: TextStyleManager.interRegular.copyWith(fontSize: 13.sp),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, RoutesManager.register),
          child: Text(
            StringsManager.signUp,
            style: TextStyleManager.interSemiBold,
          ),
        ),
      ],
    );
  }
}
