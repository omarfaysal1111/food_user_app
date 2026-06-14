import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

enum AddressFlowMode { add, edit }

class AddressMapSelectionScreen extends StatelessWidget {
  const AddressMapSelectionScreen({super.key, required this.mode});

  final AddressFlowMode mode;

  static const _screenPadding = 16.0;
  static const _topInset = 20.0;
  static const _contentTopGap = 20.0;
  static const _mapHeight = 469.0;
  static const _buttonHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final detailsRoute = mode == AddressFlowMode.add
        ? RouteNames.addressBookAddDetails
        : RouteNames.addressBookEditDetails;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: _screenPadding,
                top: _topInset,
                end: _screenPadding,
              ),
              child: _AddressFlowHeader(title: l10n.chooseLocation),
            ),
            const SizedBox(height: _contentTopGap),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: _screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SearchLocationField(label: l10n.searchForAddress),
                    const SizedBox(height: 12),
                    const _MapPreview(height: _mapHeight),
                    const SizedBox(height: 16),
                    _SelectedLocationRow(text: l10n.deliveryAddress, size: 24),
                    const SizedBox(height: 24),
                    // TODO: Replace static map preview with the real map picker.
                  ],
                ),
              ),
            ),
            _AddressBottomBar(
              label: l10n.confirmLocation,
              onTap: () => context.push(detailsRoute),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key, required this.mode});

  final AddressFlowMode mode;

  static const _screenPadding = 16.0;
  static const _topInset = 20.0;
  static const _contentTopGap = 20.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isEdit = mode == AddressFlowMode.edit;
    final title = isEdit ? l10n.editAddressTitle : l10n.addAddressTitle;
    final buttonLabel = isEdit ? l10n.updateAddress : l10n.saveAddress;
    final snackMessage = isEdit
        ? l10n.addressUpdatedDesignOnly
        : l10n.addressSavedDesignOnly;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: _screenPadding,
                top: _topInset,
                end: _screenPadding,
              ),
              child: _AddressFlowHeader(title: title),
            ),
            const SizedBox(height: _contentTopGap),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: _screenPadding,
                ),
                child: Column(
                  children: [
                    _CurrentAddressPreview(address: l10n.deliveryAddress),
                    const SizedBox(height: 16),
                    _AddressInputField(
                      hint: l10n.building,
                      initialValue: isEdit ? l10n.sampleBuildingName : null,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _AddressInputField(
                            hint: l10n.floor,
                            initialValue: isEdit ? l10n.sampleFloorName : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _AddressInputField(
                            hint: l10n.apartment,
                            initialValue: isEdit
                                ? l10n.sampleApartmentNumber
                                : null,
                          ),
                        ),
                      ],
                    ),
                    // TODO: Submit this form through the real create/update address API.
                  ],
                ),
              ),
            ),
            _AddressBottomBar(
              label: buttonLabel,
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(snackMessage)));
                context.pop();
                if (context.mounted && context.canPop()) {
                  context.pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressFlowHeader extends StatelessWidget {
  const _AddressFlowHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: AppTextStyles.appBarTitle(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchLocationField extends StatelessWidget {
  const _SearchLocationField({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.addressSearchIcon,
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(
              AppColors.paragraph(context),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: AppTextStyles.caption(context).copyWith(
                color: AppColors.paragraph(context),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview({this.height, this.compactBottomRadius = false});

  final double? height;
  final bool compactBottomRadius;

  @override
  Widget build(BuildContext context) {
    final radius = compactBottomRadius
        ? const BorderRadius.vertical(bottom: Radius.circular(12))
        : BorderRadius.circular(16);

    return ClipRRect(
      borderRadius: radius,
      child: Stack(
        children: [
          if (height == null)
            SizedBox.expand(
              child: Image.asset(
                AppAssets.addressMapPreview,
                fit: BoxFit.cover,
              ),
            )
          else
            SizedBox(
              height: height,
              width: double.infinity,
              child: Image.asset(
                AppAssets.addressMapPreview,
                fit: BoxFit.cover,
              ),
            ),
          Positioned.fill(
            child: ColoredBox(color: Colors.black.withValues(alpha: 0.20)),
          ),
          if (!compactBottomRadius)
            PositionedDirectional(
              end: 16,
              bottom: 16,
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard(context),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  AppAssets.addressMapIcon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.onSurface(context),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          Positioned(
            left: 0,
            right: 0,
            top: compactBottomRadius ? null : height! * 0.44,
            bottom: compactBottomRadius ? 36 : null,
            child: SvgPicture.asset(
              AppAssets.addressLocationIcon,
              width: compactBottomRadius ? 28 : 36,
              height: compactBottomRadius ? 28 : 36,
              colorFilter: ColorFilter.mode(
                AppColors.paragraph(context),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectedLocationRow extends StatelessWidget {
  const _SelectedLocationRow({required this.text, required this.size});

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.addressLocationIcon,
          width: size,
          height: size,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppTextStyles.footerSecondary(context).copyWith(
              color: AppColors.onSurface(context),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}

class _CurrentAddressPreview extends StatelessWidget {
  const _CurrentAddressPreview({required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.selectedLocation,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.body(context).copyWith(
                    color: AppColors.onSurface(context),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 8),
                _SelectedLocationRow(text: address, size: 16),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Expanded(child: _MapPreview(compactBottomRadius: true)),
        ],
      ),
    );
  }
}

class _AddressInputField extends StatelessWidget {
  const _AddressInputField({required this.hint, this.initialValue});

  final String hint;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        initialValue: initialValue,
        textAlign: TextAlign.start,
        cursorColor: AppColors.cursor(context),
        style: AppTextStyles.inputText(
          context,
        ).copyWith(fontSize: 12, height: 1.3),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.inputHint(
            context,
          ).copyWith(color: AppColors.hint(context), fontSize: 12, height: 1.3),
          filled: true,
          fillColor: AppColors.surfaceCard(context),
          contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.border(context),
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.border(context),
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.fieldFocusBorder(context),
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _AddressBottomBar extends StatelessWidget {
  const _AddressBottomBar({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bottomSafe = MediaQuery.of(context).padding.bottom;

    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, bottomSafe + 20),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2C2B2B).withValues(alpha: 0.08),
            blurRadius: 4,
          ),
        ],
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          height: AddressMapSelectionScreen._buttonHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
