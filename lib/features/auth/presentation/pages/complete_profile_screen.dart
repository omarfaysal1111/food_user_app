import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/localization/context_locale_ext.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/auth/presentation/widgets/app_language_picker_modal.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_language_chip.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    // TODO(auth-api): Submit first/last name to backend after phone OTP is
    // verified. This pass intentionally completes the flow locally.
    context.go(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ProfileTopBar(onBack: () => context.pop()),
                const SizedBox(height: 32),
                Text(
                  l10n.completeProfileTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.screenTitle(context),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.completeProfileSubtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitle(context),
                ),
                const SizedBox(height: 32),
                AuthTextField(
                  controller: _firstNameController,
                  label: l10n.firstNameLabel,
                  hintText: l10n.firstNameHint,
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  controller: _lastNameController,
                  label: l10n.lastNameLabel,
                  hintText: l10n.lastNameHint,
                ),
                const SizedBox(height: 24),
                AuthPrimaryButton(
                  label: l10n.completeProfileSubmit,
                  onPressed: _submit,
                ),
                const SizedBox(height: 24),
                Text.rich(
                  TextSpan(
                    style: AppTextStyles.termsMuted(context),
                    children: [
                      TextSpan(text: l10n.completeProfileTermsPrefix),
                      TextSpan(
                        text: l10n.registerTermsLink,
                        style: const TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileTopBar extends StatelessWidget {
  const _ProfileTopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AuthLanguageChip(
              label: context.isArabic
                  ? AppLanguagePickerLabels.arabicOption
                  : AppLanguagePickerLabels.englishOption,
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
                Icons.chevron_left_rounded,
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
