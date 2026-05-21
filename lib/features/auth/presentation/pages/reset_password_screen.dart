import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_password_visibility_suffix.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class ResetPasswordScreen extends StatefulWidget {
  /// Email forwarded from the OTP verification step. The Set New Password
  /// API will need this value once it's available on the backend.
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
    // TODO(reset-password-api): Wire `POST /auth/reset-password` once the
    // backend is ready. Use `widget.email` + `_passController.text` and
    // dispatch a new `ResetPasswordSubmitted` event on AuthBloc. For now we
    // just navigate the user back to the login screen so the UI flow stays
    // testable end-to-end.
    context.go(RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                onPressed: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
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
                  () => _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
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
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
