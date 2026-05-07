import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _otpFocusNode = FocusNode();

  Timer? _timer;
  int _secondsRemaining = 59;

  @override
  void initState() {
    super.initState();
    _otpFocusNode.addListener(_onFocusChanged);
    _startCountdown();
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _otpFocusNode.removeListener(_onFocusChanged);
    _timer?.cancel();
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _timer?.cancel();
    if (!mounted) return;
    setState(() => _secondsRemaining = 59);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        }
        if (_secondsRemaining <= 0) {
          timer.cancel();
          _timer = null;
        }
      });
    });
  }

  void _onResend() {
    if (_secondsRemaining > 0) return;
    _otpController.clear();
    _formKey.currentState?.reset();
    setState(() {});
    _startCountdown();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _otpFocusNode.requestFocus();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم إرسال الكود مرة أخرى',
          style: AppTextStyles.snackBarMessage,
        ),
      ),
    );
  }

  void _onVerify() {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.push(RouteNames.resetPassword);
  }

  int get _activeBoxIndex {
    if (!_otpFocusNode.hasFocus) return -1;
    final len = _otpController.text.length;
    if (len >= 6) return 5;
    return len;
  }

  String _charAt(int index) {
    final t = _otpController.text;
    if (index < t.length) {
      return t[index];
    }
    return '-';
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
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
            FormField<String>(
              validator: (_) =>
                  AuthValidators.otpSixDigits(_otpController.text),
              builder: (fieldState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 48,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned.fill(
                            child: TextField(
                              controller: _otpController,
                              focusNode: _otpFocusNode,
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              textAlign: TextAlign.left,
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: AppTextStyles.hiddenOtpInput,
                              showCursor: false,
                              cursorColor: AppColors.transparent,
                              cursorWidth: 0,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                filled: false,
                                contentPadding: EdgeInsets.zero,
                                counterText: '',
                              ),
                              onChanged: (value) {
                                fieldState.didChange(value);
                                setState(() {});
                              },
                              onTapOutside: (_) =>
                                  FocusScope.of(context).unfocus(),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                for (var i = 0; i < 6; i++)
                                  InkWell(
                                    onTap: () =>
                                        _otpFocusNode.requestFocus(),
                                    borderRadius: BorderRadius.circular(8),
                                    child: _OtpDigitBox(
                                      char: _charAt(i),
                                      active: i == _activeBoxIndex,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (fieldState.hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          fieldState.errorText ?? '',
                          textAlign: TextAlign.right,
                          style: AppTextStyles.validationCaption,
                        ),
                      ),
                  ],
                );
              },
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
                Text(
                  '$_secondsRemaining ثانية',
                  style: AppTextStyles.timerText,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: _onResend,
                  child: Text(
                    'إعادة إرسال الكود ؟',
                    style: _secondsRemaining > 0
                        ? AppTextStyles.resendActionDisabled
                        : AppTextStyles.linkEmphasis,
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

class _OtpDigitBox extends StatelessWidget {
  const _OtpDigitBox({
    required this.char,
    required this.active,
  });

  final String char;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: active ? AppColors.otpActiveBorder : AppColors.border,
        ),
      ),
      child: Text(
        char,
        textAlign: TextAlign.center,
        style: active
            ? AppTextStyles.otpDigitActive
            : AppTextStyles.otpDigitInactive,
      ),
    );
  }
}
