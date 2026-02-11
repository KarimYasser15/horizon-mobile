import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsManager.alreadyHaveAnAccount,
          style: TextStyleManager.interRegular.copyWith(fontSize: 13.sp),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            StringsManager.login,
            style: TextStyleManager.interSemiBold,
          ),
        ),
      ],
    );
  }
}
