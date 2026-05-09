import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
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
    super.dispose();
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();
    setState(() => _hasAttemptedValidation = true);
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.push(RouteNames.otp);
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
              l10n.forgotPasswordTitle,
              textAlign: TextAlign.start,
              style: AppTextStyles.screenTitle(context),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.forgotPasswordSubtitle,
              textAlign: TextAlign.start,
              style: AppTextStyles.subtitle(context),
            ),
            const SizedBox(height: 32),
            AuthTextField(
              controller: _emailController,
              label: l10n.registerEmailLabel,
              hintText: l10n.registerEmailHint,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => AuthValidators.emailRequiredDotCom(
                value,
                requiredMessage: l10n.validationEmailRequiredDotComRequired,
                invalidMessage: l10n.validationEmailRequiredDotComInvalid,
                dotComMessage: l10n.validationEmailRequiredDotComNeedsCom,
              ),
            ),
            const SizedBox(height: 20),
            AuthPrimaryButton(
              label: l10n.forgotPasswordSubmit,
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
