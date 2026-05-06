import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _splashLogoUrl =
      'https://www.figma.com/api/mcp/asset/aa19c6ac-9d1f-4421-b8f5-bfaa8c6f6fc4';

  @override
  void initState() {
    super.initState();
    // UI Preview Mode: simple timed navigation only.
    // TODO: Replace with real startup flow when backend/auth is ready.
    Future<void>.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      context.go(RouteNames.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA3090F),
      body: Center(
        child: SizedBox(
          width: 142,
          height: 114,
          child: Image(
            image: NetworkImage(_splashLogoUrl),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
