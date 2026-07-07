import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_directional_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:food_user_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:food_user_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:food_user_app/l10n/app_localizations.dart';
import 'package:food_user_app/features/user/domain/models/update_profile_request.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  bool _didSetInitialProfileData = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didSetInitialProfileData) return;
    final profile = context.read<ProfileBloc>().state.profile;
    if (profile != null) {
      _nameController.text = profile.fullName.isNotEmpty
          ? profile.fullName
          : '${profile.firstName} ${profile.lastName}';
      _emailController.text = profile.email;
      _phoneController.text = profile.phone;
    } else {
      _nameController.text = AppLocalizations.of(
        context,
      )!.accountPlaceholderName;
    }
    _didSetInitialProfileData = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    FocusManager.instance.primaryFocus?.unfocus();
    final fullName = _nameController.text.trim();
    final parts = fullName.split(' ');
    final firstName = parts.isNotEmpty ? parts.first : '';
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    context.read<ProfileBloc>().add(
      UpdateProfileEvent(
        UpdateProfileRequest(firstName: firstName, lastName: lastName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.updateProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.profileUpdatedDesignOnly,
                  style: AppTextStyles.snackBarMessage(context),
                ),
              ),
            );
            context.pop();
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage!,
                  style: AppTextStyles.snackBarMessage(context),
                ),
              ),
            );
          }
          final profile = state.profile;
          if (profile != null) {
            if (_nameController.text.isEmpty ||
                _nameController.text == l10n.accountPlaceholderName) {
              _nameController.text = profile.fullName.isNotEmpty
                  ? profile.fullName
                  : '${profile.firstName} ${profile.lastName}';
            }
            if (_emailController.text.isEmpty) {
              _emailController.text = profile.email;
            }
            if (_phoneController.text.isEmpty) {
              _phoneController.text = profile.phone;
            }
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ProfileHeader(title: l10n.personalDataTitle),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      16,
                      20,
                      16,
                      24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _ProfileField(
                          label: l10n.email,
                          controller: _emailController,
                          readOnly: true,
                          keyboardType: TextInputType.emailAddress,
                          textDirection: TextDirection.ltr,
                        ),
                        const SizedBox(height: 16),
                        _ProfileField(
                          label: l10n.fullName,
                          controller: _nameController,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 16),
                        _ProfileField(
                          label: l10n.mobileNumber,
                          controller: _phoneController,
                          readOnly: true,
                          keyboardType: TextInputType.phone,
                          textDirection: TextDirection.ltr,
                          trailing: _PhoneChangeAction(
                            label: l10n.changePhone,
                            onTap: () => context.push(RouteNames.changePhone),
                          ),
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            if (state.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return _PrimaryProfileButton(
                              label: l10n.saveChanges,
                              onTap: _saveProfile,
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
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
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
                  AppDirectionalIcons.backChevron(context),
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

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.keyboardType,
    this.textDirection,
    this.textInputAction,
    this.trailing,
  });

  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final fieldTextAlign = textDirection == TextDirection.ltr && isRtl
        ? TextAlign.right
        : TextAlign.start;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: AppTextStyles.fieldLabel(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surfaceCard(context),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border(context), width: 0.5),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: readOnly,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  textDirection: textDirection,
                  textAlign: fieldTextAlign,
                  cursorColor: AppColors.cursor(context),
                  style: AppTextStyles.inputText(context).copyWith(
                    color: readOnly
                        ? AppColors.paragraph(context)
                        : AppColors.onSurface(context),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 12), trailing!],
            ],
          ),
        ),
      ],
    );
  }
}

class _PhoneChangeAction extends StatelessWidget {
  const _PhoneChangeAction({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: 32,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTextStyles.textLink(context).copyWith(
                  color: AppColors.onSurface(context),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
              const SizedBox(width: 6),
              SvgPicture.asset(
                AppAssets.profileEditIcon,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimaryProfileButton extends StatelessWidget {
  const _PrimaryProfileButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(AppRadius.sm),
        ),
        child: Text(
          label,
          style: AppTextStyles.primaryButtonLabel.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.25,
          ),
        ),
      ),
    );
  }
}
