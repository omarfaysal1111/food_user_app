import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePlaceholderPage();
  }
}

class HomePlaceholderPage extends StatelessWidget {
  const HomePlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            current is Unauthenticated && previous is LogoutInProgress,
        listener: (context, state) {
          if (state is Unauthenticated) {
            context.go(RouteNames.login);
          }
        },
        builder: (context, state) {
          final loggingOut = state is LogoutInProgress;
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الصفحة الرئيسية المؤقتة',
                    style: AppTextStyles.homeHeadline(context),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: loggingOut
                        ? null
                        : () => context.read<AuthBloc>().add(
                              const LogoutRequested(),
                            ),
                    child: Text(loggingOut ? 'Logging out…' : 'Logout'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
