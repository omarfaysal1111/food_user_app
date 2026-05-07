import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _onVerify() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.push(RouteNames.resetPassword);
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
            const AuthBackButton(),
            const SizedBox(height: 20),
            const Text(
              'كود التحقق',
              textAlign: TextAlign.right,
              style: AppTextStyles.screenTitle,
            ),
            const SizedBox(height: 8),
            const Text(
              'أدخل الكود المرسل إليك لتأكيد رقم الجوال والمتابعة.',
              textAlign: TextAlign.right,
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 32),
            AuthTextField(
              controller: _otpController,
              label: 'رمز التحقق',
              hintText: '٠٠٠٠٠٠',
              keyboardType: TextInputType.number,
              maxLength: 6,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: AuthValidators.otpSixDigits,
            ),
            const SizedBox(height: 20),
            AuthPrimaryButton(
              label: 'تحقق',
              onPressed: _onVerify,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '59 ثانية',
                  style: AppTextStyles.timerText,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'إعادة الإرسال قريباً',
                          style: AppTextStyles.snackBarMessage,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'إعادة إرسال الكود ؟',
                    style: AppTextStyles.linkEmphasis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
