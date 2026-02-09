import 'package:flutter/material.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/core/widgets/default_submit_button.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/auth_decoration_widget.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/dont_have_an_account_text.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/labeled_text_field_widget.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_login_divider.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_login_group.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthDecorationWidget(
      mainTitle: StringsManager.welcomeBack,
      subTitle: StringsManager.welcomeBackDescription,
      child: Column(
        children: [
          LabeledTextFieldWidget(
            label: "Email Address",
            hint: "sarah@example.com",
            keyboardType: TextInputType.emailAddress,
          ),
          LabeledTextFieldWidget(
            label: "Password",
            hint: "*****",
            obscureText: true,
          ),
          const SizedBox(height: 8),
          DefaultSubmitButton(title: StringsManager.login, onPressed: () {}),
          const SocialLoginDivider(),
          const SocialLoginGroup(),
          const SizedBox(height: 24),
          const DontHaveAnAccountText(),
        ],
      ),
    );
  }
}
