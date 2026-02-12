import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
  });
  final String buttonText;
  final void Function() onPressed;
  final SvgPicture icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          fixedSize: Size.fromHeight(48.h),
          backgroundColor: ColorsManager.whitishGrey,
          elevation: 0,
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: TextStyleManager.interMedium.copyWith(fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
