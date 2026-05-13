import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/core/di/injection_container.dart';
import 'package:food_user_app/core/localization/app_locale_scope.dart';
import 'package:food_user_app/core/localization/locale_controller.dart';
import 'package:food_user_app/core/router/app_router.dart';
import 'package:food_user_app/core/theme/app_theme.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key, required this.localeController});

  final LocaleController localeController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => sl<AuthBloc>(),
      child: AppLocaleScope(
        notifier: localeController,
        child: ListenableBuilder(
          listenable: localeController,
          builder: (context, _) {
            final locale = localeController.locale;
            final code = locale.languageCode;
            return MaterialApp.router(
              title: 'Food User App',
              locale: locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                if (code == 'ar' || code == 'en') {
                  return locale;
                }
                return const Locale('en');
              },
              theme: code == 'ar'
                  ? AppTheme.lightArabic
                  : AppTheme.lightEnglish,
              darkTheme: code == 'ar'
                  ? AppTheme.darkArabic
                  : AppTheme.darkEnglish,
              themeMode: ThemeMode.system,
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
