import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _mobileController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'أحمد فرج');
    _mobileController = TextEditingController(text: '+20 10 1234 5678');
    _emailController = TextEditingController(text: 'afarag74@gmail.com');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _EditProfileHeader(title: l10n.editProfileTitle),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 28, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.personalDataTitle,
                      style: AppTextStyles.heading4(context),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _ProfileField(
                      label: l10n.fullName,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 14),
                    _ProfileField(
                      label: l10n.mobileNumber,
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 14),
                    _ProfileField(
                      label: l10n.email,
                      controller: _emailController,
                      readOnly: true,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    _SaveButton(
                      label: l10n.saveChanges,
                      onTap: () {
                        // TODO: Updating name/mobile should send OTP later.
                        // Email is read-only and cannot be edited.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.profileChangesSaved)),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final fill = readOnly
        ? AppColors.border(context).withValues(alpha: 0.24)
        : AppColors.surfaceCard(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.fieldLabel(context)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textDirection: readOnly && label.toLowerCase().contains('email')
              ? TextDirection.ltr
              : null,
          style: AppTextStyles.inputText(context).copyWith(
            color: readOnly
                ? AppColors.paragraph(context)
                : AppColors.onSurface(context),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: fill,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(AppRadius.sm),
              borderSide: BorderSide(color: AppColors.border(context)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(AppRadius.sm),
              borderSide: BorderSide(color: AppColors.border(context)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(AppRadius.sm),
              borderSide: BorderSide(
                color: AppColors.fieldFocusBorder(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(AppRadius.sm),
        ),
        alignment: Alignment.center,
        child: Text(label, style: AppTextStyles.primaryButtonLabel),
      ),
    );
  }
}

class _EditProfileHeader extends StatelessWidget {
  const _EditProfileHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.pop(),
              child: SizedBox(
                width: 28,
                height: 28,
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 28,
                  color: AppColors.onSurface(context),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: AppTextStyles.appBarTitle(context).copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
