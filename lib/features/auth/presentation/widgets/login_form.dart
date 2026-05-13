import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_password_visibility_suffix.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onForgotPassword;
  final VoidCallback onLoginSuccess;

  const LoginForm({
    super.key,
    required this.onForgotPassword,
    required this.onLoginSuccess,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _hasAttemptedValidation = true);
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    context.read<AuthBloc>().add(
          LoginSubmitted(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = Directionality.of(context) == TextDirection.rtl;

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (prev, curr) =>
          prev != curr && (curr is AuthSuccess || curr is AuthError),
      listener: (context, state) {
        if (state is AuthSuccess) {
          widget.onLoginSuccess();
        } else if (state is AuthError) {
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
          curr is AuthStateInitial ||
          curr is AuthLoading ||
          curr is AuthSuccess ||
          curr is AuthError,
      builder: (context, state) {
        final isSubmitting = state is AuthLoading;
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthTextField(
                controller: _emailController,
                label: l10n.loginEmailLabel,
                hintText: l10n.loginEmailHint,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => AuthValidators.emailRequiredDotCom(
                  value,
                  requiredMessage: l10n.validationEmailRequiredDotComRequired,
                  invalidMessage: l10n.validationEmailRequiredDotComInvalid,
                  dotComMessage: l10n.validationEmailRequiredDotComNeedsCom,
                ),
              ),
              const SizedBox(height: 12),
              AuthTextField(
                controller: _passwordController,
                label: l10n.loginPasswordLabel,
                hintText: l10n.loginPasswordHint,
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
              const SizedBox(height: 8),
              Align(
                alignment:
                    isArabic ? Alignment.centerLeft : Alignment.centerRight,
                child: TextButton(
                  onPressed: widget.onForgotPassword,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.onSurface(context),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    l10n.loginForgotPassword,
                    textAlign: isArabic ? TextAlign.left : TextAlign.right,
                    style: AppTextStyles.textLink(context).copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.onSurface(context),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AuthPrimaryButton(
                label: isSubmitting ? l10n.loginSubmitting : l10n.loginSubmit,
                onPressed: isSubmitting ? null : _onSubmit,
              ),
            ],
          ),
        );
      },
    );
  }
}
