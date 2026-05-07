import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_language_chip.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_password_visibility_suffix.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';

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
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _termsError = null);

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (!_acceptedTerms) {
      setState(() {
        _termsError = 'يجب الموافقة على الشروط والاحكام';
      });
      return;
    }

    context.go(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'مرحباً بك !',
                          textAlign: TextAlign.start,
                          style: AppTextStyles.screenTitle(context),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'انضم إلينا اليوم واستمتع بتجربة توصيل أسرع',
                          textAlign: TextAlign.start,
                          style: AppTextStyles.subtitle(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  AuthLanguageChip(
                    label: 'عربي',
                    flagAsset: AppAssets.flagEg,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Language switch is coming soon',
                            style: AppTextStyles.snackBarMessage(context),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            AuthTextField(
              controller: _usernameController,
              label: 'اسم المستخدم',
              hintText: 'اسم المستخدم',
              validator: AuthValidators.usernameRegister,
            ),
            const SizedBox(height: 20),
            _RegisterPhoneField(controller: _phoneController),
            const SizedBox(height: 20),
            AuthTextField(
              controller: _emailController,
              label: 'البريد الالكتروني',
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
              validator: AuthValidators.emailRequiredDotCom,
            ),
            const SizedBox(height: 20),
            AuthTextField(
              controller: _passwordController,
              label: 'كلمة المرور',
              hintText: 'كلمة المرور',
              obscureText: !_isPasswordVisible,
              suffixIcon: AuthPasswordVisibilitySuffix(
                isVisible: _isPasswordVisible,
                onPressed: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
              validator: AuthValidators.passwordRequiredMin8,
            ),
            const SizedBox(height: 20),
            AuthTextField(
              controller: _confirmPasswordController,
              label: 'تأكيد كلمه المرور',
              hintText: 'تأكيد كلمه المرور',
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
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Directionality(
                textDirection: TextDirection.rtl,
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'الموافقة على ',
                          style: AppTextStyles.termsMuted(context),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () =>
                              context.push(RouteNames.termsAndConditions),
                          child: const Text(
                            'الشروط والاحكام',
                            style: AppTextStyles.termsLink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (_termsError != null) ...[
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _termsError!,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.termsInlineError,
                ),
              ),
            ],
            const SizedBox(height: 24),
            AuthPrimaryButton(label: 'إنشاء حساب', onPressed: _onRegister),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () => context.go(RouteNames.login),
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.richTextBase14,
                    children: [
                      TextSpan(
                        text: 'هل لديك حساب من قبل ؟ ',
                        style: AppTextStyles.footerSecondary(context),
                      ),
                      const TextSpan(
                        text: 'تسجيل دخول',
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
    return FormField<String>(
      validator: (_) => AuthValidators.egyptianPhone(controller.text),
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'رقم الجوال',
              textAlign: TextAlign.right,
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
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.inputText(state.context),
                      cursorColor: AppColors.cursor(state.context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[\d\s]')),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'رقم الجوال',
                        hintStyle: AppTextStyles.inputHint(state.context),
                      ),
                      onChanged: (_) => state.didChange(controller.text),
                      onTapOutside: (_) {
                        FocusScope.of(state.context).unfocus();
                      },
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
                  textAlign: TextAlign.right,
                  style: AppTextStyles.validationCaption,
                ),
              ),
          ],
        );
      },
    );
  }
}
