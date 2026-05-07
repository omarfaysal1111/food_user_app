import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/widgets/app_media.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
      backgroundColor: AppColors.primary,
      body: Center(
        child: SizedBox(
          width: 142,
          height: 114,
          child: AppSvgImage.asset(
            AppAssets.appLogo,
            width: 142,
            height: 114,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
