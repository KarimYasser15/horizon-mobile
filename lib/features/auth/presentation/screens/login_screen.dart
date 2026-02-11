import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_mobile/config/routes_manager.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/core/utils/ui_utils.dart';
import 'package:horizon_mobile/core/widgets/default_submit_button.dart';
import 'package:horizon_mobile/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:horizon_mobile/features/auth/presentation/cubit/auth_states.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/auth_decoration_widget.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/dont_have_an_account_text.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/labeled_text_field_widget.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_login_divider.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_login_group.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    context.read<AuthCubit>().login(
      _emailController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showLoading(context);
        } else {
          hideLoading(context);
          if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(
              context,
              RoutesManager.home,
              arguments: state.displayName,
            );
          }
        }
      },
      child: AuthDecorationWidget(
        mainTitle: StringsManager.welcomeBack,
        subTitle: StringsManager.welcomeBackDescription,
        child: Column(
          children: [
            LabeledTextFieldWidget(
              label: 'Email Address',
              hint: 'sarah@example.com',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            LabeledTextFieldWidget(
              label: 'Password',
              hint: '*****',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 8),
            DefaultSubmitButton(
              title: StringsManager.login,
              onPressed: _onLoginPressed,
            ),
            const SocialLoginDivider(),
            const SocialLoginGroup(),
            const SizedBox(height: 24),
            const DontHaveAnAccountText(),
          ],
        ),
      ),
    );
  }
}
