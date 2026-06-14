import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class OtpVerificationScreen extends StatefulWidget {
  /// Email captured during the Forgot Password step. Passed through the
  /// router as `extra`. The verify-OTP request reuses the same value.
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _otpFocusNode = FocusNode();

  Timer? _timer;
  int _secondsRemaining = 59;
  bool _shouldRefreshValidationOnLocaleChange = false;
  String? _lastLanguageCode;

  @override
  void initState() {
    super.initState();
    _otpFocusNode.addListener(_onFocusChanged);
    _startCountdown();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final lang = Localizations.localeOf(context).languageCode;
    if (_shouldRefreshValidationOnLocaleChange &&
        _lastLanguageCode != null &&
        _lastLanguageCode != lang) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _formKey.currentState?.validate();
      });
    }
    _lastLanguageCode = lang;
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
    final l10n = AppLocalizations.of(context)!;
    _otpController.clear();
    _formKey.currentState?.reset();
    setState(() {
      _shouldRefreshValidationOnLocaleChange = false;
    });
    _startCountdown();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _otpFocusNode.requestFocus();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.otpResentSnackbar,
          style: AppTextStyles.snackBarMessage(context),
        ),
      ),
    );
  }

  void _onVerify() {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) {
      setState(() => _shouldRefreshValidationOnLocaleChange = true);
      return;
    }
    setState(() => _shouldRefreshValidationOnLocaleChange = false);
    context.read<AuthBloc>().add(
      VerifyOtpSubmitted(email: widget.email, otp: _otpController.text.trim()),
    );
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
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (prev, curr) =>
          curr is VerifyOtpSuccess || curr is VerifyOtpFailure,
      listener: (context, state) {
        if (state is VerifyOtpSuccess) {
          context.push(RouteNames.resetPassword, extra: state.email);
        } else if (state is VerifyOtpFailure) {
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
          curr is VerifyOtpInProgress ||
          curr is VerifyOtpSuccess ||
          curr is VerifyOtpFailure ||
          curr is AuthStateInitial,
      builder: (context, state) {
        final l10n = AppLocalizations.of(context)!;
        final isLoading = state is VerifyOtpInProgress;

        return AuthScaffold(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthBackButton(),
                const SizedBox(height: 20),
                Text(
                  l10n.otpTitle,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.screenTitle(context),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.otpSubtitle,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.subtitle(context),
                ),
                const SizedBox(height: 32),
                FormField<String>(
                  validator: (_) => AuthValidators.otpSixDigits(
                    _otpController.text,
                    requiredMessage: l10n.validationOtpRequired,
                    invalidMessage: l10n.validationOtpSixDigits,
                  ),
                  builder: (fieldState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 48,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned.fill(
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
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
                            padding: const EdgeInsetsDirectional.only(top: 6),
                            child: Text(
                              fieldState.errorText ?? '',
                              textAlign: TextAlign.start,
                              style: AppTextStyles.validationCaption,
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                AuthPrimaryButton(
                  label: l10n.otpVerify,
                  onPressed: isLoading ? null : _onVerify,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.otpTimerSeconds(_secondsRemaining),
                      style: AppTextStyles.timerText(context),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: _onResend,
                      child: Text(
                        l10n.otpResend,
                        style: _secondsRemaining > 0
                            ? AppTextStyles.resendActionDisabled(context)
                            : AppTextStyles.linkEmphasis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OtpDigitBox extends StatelessWidget {
  const _OtpDigitBox({required this.char, required this.active});

  final String char;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: active
              ? AppColors.otpActiveBorder(context)
              : AppColors.border(context),
        ),
      ),
      child: Text(
        char,
        textAlign: TextAlign.center,
        style: active
            ? AppTextStyles.otpDigitActive(context)
            : AppTextStyles.otpDigitInactive(context),
      ),
    );
  }
}
