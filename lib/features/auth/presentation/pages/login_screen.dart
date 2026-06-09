import 'package:flutter/material.dart';
import 'package:food_user_app/features/auth/presentation/pages/login_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Reconnect AuthBloc and real API after backend is ready.
    return const LoginPage();
  }
}
