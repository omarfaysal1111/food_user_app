import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/localization/context_locale_ext.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:food_user_app/features/auth/presentation/pages/auth_entry_screen.dart';
import 'package:food_user_app/features/auth/presentation/widgets/app_language_picker_modal.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_language_chip.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/utils/auth_error_localizer.dart';
import 'package:food_user_app/l10n/app_localizations.dart';
import 'package:food_user_app/core/widgets/app_directional_icons.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key, required this.args});

  final PhoneAuthArgs args;

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) return;
    // Sends the OTP; navigation happens in the BlocListener once it succeeds.
    context.read<AuthBloc>().add(PhoneOtpRequested(phone: phone));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listenWhen: (prev, curr) =>
              curr is PhoneOtpSent || curr is PhoneOtpSendFailure,
          listener: (context, state) {
            if (state is PhoneOtpSent) {
              context.push(
                RouteNames.mockOtp,
                extra: MockOtpArgs(
                  phoneNumber: state.phone,
                  mockNewUser: !state.isExistingUser,
                  isSocial: widget.args.startedFromSocial,
                  firstName: widget.args.firstName,
                  lastName: widget.args.lastName,
                  email: widget.args.email,
                ),
              );
            } else if (state is PhoneOtpSendFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    localizedAuthError(
                      AppLocalizations.of(context)!,
                      state.message,
                    ),
                    style: AppTextStyles.snackBarMessage(context),
                  ),
                ),
              );
            }
          },
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _AuthTopBar(onBack: () => context.pop()),
                  const SizedBox(height: 32),
                  Text(
                    l10n.authPhoneTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.screenTitle(context),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.authPhoneSubtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle(context),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    l10n.registerPhoneLabel,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.fieldLabel(context),
                  ),
                  const SizedBox(height: 8),
                  _PhoneNumberField(controller: _phoneController, l10n: l10n),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (prev, curr) =>
                        curr is PhoneOtpSendInProgress ||
                        curr is PhoneOtpSent ||
                        curr is PhoneOtpSendFailure ||
                        curr is AuthStateInitial,
                    builder: (context, state) {
                      final isLoading = state is PhoneOtpSendInProgress;
                      return AuthPrimaryButton(
                        label: l10n.confirmOtp,
                        onPressed: isLoading ? null : _submit,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberField extends StatelessWidget {
  const _PhoneNumberField({required this.controller, required this.l10n});

  final TextEditingController controller;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);

    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppSvgImage.asset(
                    AppAssets.flagEg,
                    width: 16,
                    height: 16,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 4),
                  Text('+20', style: AppTextStyles.inputHint(context)),
                  const SizedBox(width: 12),
                  Container(
                    width: 0.5,
                    height: 18,
                    color: AppColors.border(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Directionality(
                textDirection: textDirection,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.inputText(context),
                  cursorColor: AppColors.cursor(context),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  decoration: InputDecoration(
                    hintText: l10n.registerPhoneHint,
                    hintStyle: AppTextStyles.inputHint(context),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                      8,
                      14,
                      16,
                      14,
                    ),
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

class _AuthTopBar extends StatelessWidget {
  const _AuthTopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: 36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AuthLanguageChip(
              label: context.isArabic
                  ? l10n.arabicLanguage
                  : l10n.englishLanguage,
              flagAsset: context.isArabic
                  ? AppAssets.flagEg
                  : AppAssets.flagUsa,
              onTap: () => showAppLanguagePicker(context),
            ),
          ),
          Center(
            child: AppRasterImage.asset(
              AppAssets.authHeaderLogo,
              width: 44,
              height: 39,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: IconButton(
              onPressed: onBack,
              padding: EdgeInsets.zero,
              icon: Icon(
                AppDirectionalIcons.backChevron(context),
                size: 28,
                color: AppColors.onSurface(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MockOtpArgs {
  const MockOtpArgs({
    required this.phoneNumber,
    this.mockNewUser = true,
    this.isSocial = false,
    this.firstName,
    this.lastName,
    this.email,
  });

  final String phoneNumber;
  final bool mockNewUser;
  final bool isSocial;
  final String? firstName;
  final String? lastName;
  final String? email;
}
