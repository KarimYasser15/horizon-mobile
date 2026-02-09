import 'package:flutter/material.dart';
import 'package:horizon_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:horizon_mobile/features/auth/presentation/screens/register_screen.dart';

class RoutesManager {
  static const String login = '/login';
  static const String register = '/register';
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
    }
    return null;
  }
}
