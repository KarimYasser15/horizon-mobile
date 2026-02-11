import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/core/utils/ui_utils.dart';
import 'package:horizon_mobile/core/widgets/default_submit_button.dart';
import 'package:horizon_mobile/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:horizon_mobile/features/auth/presentation/cubit/auth_states.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/already_have_an_account_text.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/auth_decoration_widget.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/labeled_text_field_widget.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_login_divider.dart';
import 'package:horizon_mobile/features/auth/presentation/widgets/social_login_group.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onRegisterPressed() {
    context.read<AuthCubit>().register(
      _fullNameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
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
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account created successfully')),
            );
          }
        }
      },
      builder: (context, state) {
        return AuthDecorationWidget(
          mainTitle: StringsManager.createAccount,
          subTitle: StringsManager.createAccountDescription,
          child: Column(
            children: [
              LabeledTextFieldWidget(
                label: 'Full Name',
                hint: 'Sarah Miller',
                controller: _fullNameController,
              ),
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
                title: StringsManager.signUp,
                onPressed: _onRegisterPressed,
              ),
              const SocialLoginDivider(),
              const SocialLoginGroup(),
              const SizedBox(height: 24),
              const AlreadyHaveAnAccountText(),
            ],
          ),
        );
      },
    );
  }
}
