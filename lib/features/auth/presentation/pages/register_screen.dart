import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/localization/context_locale_ext.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/auth/presentation/widgets/app_language_picker_modal.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_language_chip.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_password_visibility_suffix.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _acceptedTerms = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _termsError;
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
        setState(() {
          if (_termsError != null) {
            _termsError = AppLocalizations.of(context)!.registerTermsError;
          }
        });
        _formKey.currentState?.validate();
      });
    }
    _lastLanguageCode = lang;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onToggleTerms() {
    setState(() {
      _acceptedTerms = !_acceptedTerms;
      if (_acceptedTerms) {
        _termsError = null;
      }
    });
  }

  void _onRegister() {
    final l10n = AppLocalizations.of(context)!;
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _hasAttemptedValidation = true;
      _termsError = null;
    });

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (!_acceptedTerms) {
      setState(() {
        _termsError = l10n.registerTermsError;
      });
      return;
    }

    context.go(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final headerChip = AuthLanguageChip(
      label: context.isArabic ? l10n.languageArabic : l10n.languageEnglish,
      flagAsset: context.isArabic ? AppAssets.flagEg : AppAssets.flagUsa,
      onTap: () => showAppLanguagePicker(context),
    );
    final headerTitles = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.registerWelcomeTitle,
            textAlign: TextAlign.start,
            style: AppTextStyles.screenTitle(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.registerWelcomeSubtitle,
            textAlign: TextAlign.start,
            style: AppTextStyles.subtitle(context),
          ),
        ],
      ),
    );

    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerTitles,
                const SizedBox(width: 12),
                headerChip,
              ],
            ),
            const SizedBox(height: 32),
            AuthTextField(
              controller: _usernameController,
              label: l10n.registerUsernameLabel,
              hintText: l10n.registerUsernameHint,
              validator: (value) => AuthValidators.usernameRegister(
                value,
                requiredMessage: l10n.validationUsernameRequired,
                minMessage: l10n.validationUsernameMin3,
              ),
            ),
            const SizedBox(height: 20),
            _RegisterPhoneField(controller: _phoneController),
            const SizedBox(height: 20),
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
            AuthTextField(
              controller: _passwordController,
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
              controller: _confirmPasswordController,
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
                _passwordController.text,
                requiredMessage: l10n.validationConfirmPasswordRequired,
                mismatchMessage: l10n.validationConfirmPasswordMismatch,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      onTap: _onToggleTerms,
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: _acceptedTerms
                                  ? AppColors.primary
                                  : AppColors.surfaceCard(context),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _acceptedTerms
                                    ? AppColors.primary
                                    : AppColors.border(context),
                                width: 0.5,
                              ),
                            ),
                            child: _acceptedTerms
                                ? const Icon(
                                    Icons.check_rounded,
                                    size: 16,
                                    color: AppColors.text,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4,
                      children: [
                        Text(
                          l10n.registerTermsPrefix,
                          style: AppTextStyles.termsMuted(context),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () =>
                              context.push(RouteNames.termsAndConditions),
                          child: Text(
                            l10n.registerTermsLink,
                            style: AppTextStyles.termsLink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (_termsError != null) ...[
              const SizedBox(height: 8),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  _termsError!,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.termsInlineError,
                ),
              ),
            ],
            const SizedBox(height: 24),
            AuthPrimaryButton(label: l10n.registerSubmit, onPressed: _onRegister),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () => context.go(RouteNames.login),
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.richTextBase14,
                    children: [
                      TextSpan(
                        text: l10n.registerHasAccount,
                        style: AppTextStyles.footerSecondary(context),
                      ),
                      TextSpan(
                        text: l10n.registerSignIn,
                        style: AppTextStyles.linkEmphasis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterPhoneField extends StatelessWidget {
  final TextEditingController controller;

  const _RegisterPhoneField({required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return FormField<String>(
      validator: (_) => AuthValidators.egyptianPhone(
        controller.text,
        requiredMessage: l10n.validationPhoneRequired,
        invalidMessage: l10n.validationPhoneEgyptian,
      ),
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.registerPhoneLabel,
              textAlign: TextAlign.start,
              style: AppTextStyles.fieldLabel(state.context),
            ),
            const SizedBox(height: 8),
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.surfaceCard(state.context),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: state.hasError
                      ? AppColors.fieldError(state.context)
                      : AppColors.border(state.context),
                  width: 0.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextField(
                        controller: controller,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.inputText(state.context),
                        cursorColor: AppColors.cursor(state.context),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[\d\s]')),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: l10n.registerPhoneHint,
                          hintStyle: AppTextStyles.inputHint(state.context),
                        ),
                        onChanged: (_) => state.didChange(controller.text),
                        onTapOutside: (_) {
                          FocusScope.of(state.context).unfocus();
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 8),
                      Container(
                        width: 0.5,
                        height: 16,
                        color: AppColors.border(state.context),
                      ),
                      const SizedBox(width: 8),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          '+20',
                          style: AppTextStyles.termsMuted(state.context),
                        ),
                      ),
                      const SizedBox(width: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const AppSvgImage.asset(
                          AppAssets.flagEg,
                          width: 16,
                          height: 16,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 6, start: 4),
                child: Text(
                  state.errorText ?? '',
                  textAlign: TextAlign.start,
                  style: AppTextStyles.validationCaption,
                ),
              ),
          ],
        );
      },
    );
  }
}
