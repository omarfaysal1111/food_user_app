import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _minSplashDuration = Duration(milliseconds: 900);

  bool _navigated = false;
  bool _minDelayElapsed = false;
  AuthState? _pendingAuthState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<AuthBloc>().add(const AuthCheckRequested());
    });
    Timer(_minSplashDuration, () {
      if (!mounted) return;
      setState(() => _minDelayElapsed = true);
      _maybeNavigate();
    });
  }

  void _maybeNavigate() {
    if (_navigated || !_minDelayElapsed) return;
    final state = _pendingAuthState;
    if (state is Authenticated) {
      _navigated = true;
      context.go(RouteNames.home);
    } else if (state is Unauthenticated) {
      _navigated = true;
      context.go(RouteNames.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (prev, curr) =>
          curr is Authenticated || curr is Unauthenticated,
      listener: (context, state) {
        _pendingAuthState = state;
        _maybeNavigate();
      },
      child: Scaffold(
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
      ),
    );
  }
}
