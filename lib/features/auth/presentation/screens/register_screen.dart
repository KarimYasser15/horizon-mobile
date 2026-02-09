import 'package:flutter/material.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/core/widgets/default_submit_button.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/already_have_an_account_text.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/auth_decoration_widget.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/labeled_text_field_widget.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_login_divider.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_login_group.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthDecorationWidget(
      mainTitle: StringsManager.createAccount,
      subTitle: StringsManager.createAccountDescription,
      child: Column(
        children: [
          LabeledTextFieldWidget(label: "Full Name", hint: "Sarah Miller"),
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
          DefaultSubmitButton(title: StringsManager.signUp, onPressed: () {}),
          const SocialLoginDivider(),
          const SocialLoginGroup(),
          const SizedBox(height: 24),
          const AlreadyHaveAnAccountText(),
        ],
      ),
    );
  }
}
