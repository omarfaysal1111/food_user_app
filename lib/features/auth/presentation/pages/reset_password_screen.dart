import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_password_visibility_suffix.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class ResetPasswordScreen extends StatefulWidget {
  /// Email forwarded from the OTP verification step. Not included in the
  /// `/auth/set-password` request body (the backend identifies the user via
  /// the Bearer token), but kept here to preserve the existing nav contract
  /// and to surface in any future UI confirmation copy.
  final String email;

  const ResetPasswordScreen({super.key, this.email = ''});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _hasAttemptedValidation = false;
  String? _lastLanguageCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final lang = Localizations.localeOf(context).languageCode;
    if (_hasAttemptedValidation &&
        _lastLanguageCode != null &&
        _lastLanguageCode != lang) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _formKey.currentState?.validate();
      });
    }
    _lastLanguageCode = lang;
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _hasAttemptedValidation = true);
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    // Send only `newPassword` per backend contract; the Bearer token is
    // attached by AuthInterceptor — never set it from the screen.
    context.read<AuthBloc>().add(
      SetPasswordSubmitted(newPassword: _passController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (prev, curr) =>
          curr is SetPasswordSuccess || curr is SetPasswordFailure,
      listener: (context, state) {
        if (state is SetPasswordSuccess) {
          // Match the rest of the auth flow (register/forgot/verify): no
          // success snackbar — just clear the forgot-password stack and land
          // on Login so the user can sign in with the new password.
          context.go(RouteNames.login);
        } else if (state is SetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
                style: AppTextStyles.snackBarMessage(context),
              ),
            ),
          );
        }
      },
      buildWhen: (prev, curr) =>
          curr is SetPasswordInProgress ||
          curr is SetPasswordSuccess ||
          curr is SetPasswordFailure ||
          curr is AuthStateInitial,
      builder: (context, state) {
        final l10n = AppLocalizations.of(context)!;
        final isLoading = state is SetPasswordInProgress;

        return AuthScaffold(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthBackButton(),
                const SizedBox(height: 20),
                Text(
                  l10n.resetPasswordTitle,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.screenTitle(context),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.resetPasswordSubtitle,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.subtitle(context),
                ),
                const SizedBox(height: 32),
                AuthTextField(
                  controller: _passController,
                  label: l10n.registerPasswordLabel,
                  hintText: l10n.registerPasswordHint,
                  obscureText: !_isPasswordVisible,
                  suffixIcon: AuthPasswordVisibilitySuffix(
                    isVisible: _isPasswordVisible,
                    onPressed: () => setState(
                      () => _isPasswordVisible = !_isPasswordVisible,
                    ),
                  ),
                  validator: (value) => AuthValidators.passwordRequiredMin8(
                    value,
                    requiredMessage: l10n.validationPasswordRequired,
                    minMessage: l10n.validationPasswordMin8,
                  ),
                ),
                const SizedBox(height: 20),
                AuthTextField(
                  controller: _confirmController,
                  label: l10n.registerConfirmPasswordLabel,
                  hintText: l10n.registerConfirmPasswordHint,
                  obscureText: !_isConfirmPasswordVisible,
                  suffixIcon: AuthPasswordVisibilitySuffix(
                    isVisible: _isConfirmPasswordVisible,
                    onPressed: () => setState(
                      () =>
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
                    ),
                  ),
                  validator: (value) => AuthValidators.confirmPassword(
                    value,
                    _passController.text,
                    requiredMessage: l10n.validationConfirmPasswordRequired,
                    mismatchMessage: l10n.validationConfirmPasswordMismatch,
                  ),
                ),
                const SizedBox(height: 24),
                AuthPrimaryButton(
                  label: l10n.resetPasswordSubmit,
                  onPressed: isLoading ? null : _onSubmit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
