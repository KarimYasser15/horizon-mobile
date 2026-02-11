import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horizon_mobile/config/assets_manager.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_auth_button.dart';

class SocialLoginGroup extends StatelessWidget {
  const SocialLoginGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final googleButton = SocialAuthButton(
      icon: SvgPicture.asset(IconsManager.google),
      buttonText: StringsManager.google,
      onPressed: () {
        context.read<AuthCubit>().signInWithGoogle();
      },
    );

    final appleButton = SocialAuthButton(
      icon: SvgPicture.asset(IconsManager.apple),
      buttonText: StringsManager.apple,
      onPressed: () {},
    );

    // For iOS, show both Google and Apple login buttons. For other show google only
    // This is commented only to follow the UI.
    // return Row(
    //   children: Platform.isIOS
    //       ? [googleButton, SizedBox(width: 16.w), appleButton]
    //       : [googleButton],
    // );
    return Row(
      children: [
        googleButton,
        SizedBox(width: 16.w),
        appleButton,
      ],
    );
  }
}
