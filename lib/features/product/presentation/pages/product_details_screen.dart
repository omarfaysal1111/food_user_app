import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({required this.item, super.key});

  final CartItem item;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 0;
  String _selectedType = 'chicken';
  String _selectedFlavor = 'hot';

  @override
  void initState() {
    super.initState();
    _quantity = widget.item.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final price = _selectedType == 'chicken' ? 250 : 190;
    final total = price * _quantity;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      bottomNavigationBar: _ProductBottomBar(
        quantity: _quantity,
        total: total,
        onIncrement: () => setState(() => _quantity++),
        onDecrement: () =>
            setState(() => _quantity = (_quantity - 1).clamp(0, 99)),
        onSubmit: () {
          // TODO: Persist product option and quantity changes through cart API.
          context.pop(widget.item.copyWith(quantity: _quantity, price: price));
        },
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsetsDirectional.only(bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: _ProductHeader(title: l10n.productDetailsTitle),
              ),
              const SizedBox(height: 20),
              _HeroProductImage(imageAsset: AppAssets.productBurgerCombo),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ProductIntro(item: widget.item),
                    const SizedBox(height: 20),
                    _OptionGroup(
                      title: l10n.productTypeTitle,
                      options: [
                        _ProductOption(
                          id: 'chicken',
                          label: l10n.productTypeChicken,
                          priceLabel: l10n.cartPrice(250),
                        ),
                        _ProductOption(
                          id: 'meat',
                          label: l10n.productTypeMeat,
                          priceLabel: l10n.cartPrice(190),
                        ),
                      ],
                      selectedId: _selectedType,
                      onChanged: (id) => setState(() => _selectedType = id),
                    ),
                    const SizedBox(height: 20),
                    _OptionGroup(
                      title: l10n.productFlavorTitle,
                      options: [
                        _ProductOption(
                          id: 'normal',
                          label: l10n.productFlavorNormal,
                        ),
                        _ProductOption(id: 'hot', label: l10n.productFlavorHot),
                      ],
                      selectedId: _selectedFlavor,
                      onChanged: (id) => setState(() => _selectedFlavor = id),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _AddonsSection(l10n: l10n),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  const _ProductHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.pop(),
          child: SizedBox(
            width: 28,
            height: 28,
            child: Center(
              child: SvgPicture.asset(
                AppAssets.productCloseIcon,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).brightness == Brightness.dark
                      ? AppColors.text
                      : AppColors.onSurface(context),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          textAlign: TextAlign.start,
          style: AppTextStyles.heading4(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _HeroProductImage extends StatelessWidget {
  const _HeroProductImage({required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            top: 34,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < 3; i++)
                  Container(
                    height: 10,
                    width: double.infinity,
                    color: AppColors.primary.withValues(alpha: 0.08),
                  ),
              ],
            ),
          ),
          Image.asset(imageAsset, width: 233, height: 120, fit: BoxFit.contain),
        ],
      ),
    );
  }
}

class _ProductIntro extends StatelessWidget {
  const _ProductIntro({required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          item.name,
          textAlign: TextAlign.start,
          style: AppTextStyles.body(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.description,
          textAlign: TextAlign.start,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.paragraph(context),
            fontSize: 12,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(AppAssets.cartEditIcon, width: 14, height: 14),
            const SizedBox(width: 4),
            Text(
              l10n.productAddNotes,
              style: AppTextStyles.textLink(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OptionGroup extends StatelessWidget {
  const _OptionGroup({
    required this.title,
    required this.options,
    required this.selectedId,
    required this.onChanged,
  });

  final String title;
  final List<_ProductOption> options;
  final String selectedId;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: AppTextStyles.heading4(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        for (var index = 0; index < options.length; index++) ...[
          _OptionRow(
            option: options[index],
            selected: options[index].id == selectedId,
            onTap: () => onChanged(options[index].id),
          ),
          if (index != options.length - 1)
            Divider(
              height: 21,
              thickness: 0.5,
              color: AppColors.border(context),
            ),
        ],
      ],
    );
  }
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final _ProductOption option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _RadioMark(selected: selected),
              const SizedBox(width: 8),
              Text(
                option.label,
                style: AppTextStyles.caption(context).copyWith(
                  color: AppColors.onSurface(context),
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
            ],
          ),
          if (option.priceLabel != null)
            Text(
              '(${option.priceLabel})',
              style: AppTextStyles.textLink(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _RadioMark extends StatelessWidget {
  const _RadioMark({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected
              ? AppColors.onSurface(context)
              : AppColors.hint(context),
          width: 1,
        ),
      ),
      child: selected
          ? Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: AppColors.onSurface(context),
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }
}

class _AddonsSection extends StatelessWidget {
  const _AddonsSection({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final addons = [
      _AddonData(
        name: l10n.productAddonWater,
        price: l10n.cartPrice(190),
        image: AppAssets.productAddonWater,
      ),
      _AddonData(
        name: l10n.productAddonToast,
        price: l10n.cartPrice(190),
        image: AppAssets.productAddonToast,
      ),
      _AddonData(
        name: l10n.productAddonChips,
        price: l10n.cartPrice(190),
        image: AppAssets.productAddonToast,
      ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 18),
      color: AppColors.surfaceCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.productAddSomethingTitle,
            textAlign: TextAlign.start,
            style: AppTextStyles.heading4(context).copyWith(
              color: AppColors.onSurface(context),
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.productAddSomethingSubtitle,
            textAlign: TextAlign.start,
            style: AppTextStyles.caption(context).copyWith(
              color: AppColors.paragraph(context),
              fontSize: 12,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 166,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: addons.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) => _AddonCard(addon: addons[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddonCard extends StatelessWidget {
  const _AddonCard({required this.addon});

  final _AddonData addon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    addon.image,
                    width: 56,
                    height: 76,
                    fit: BoxFit.contain,
                  ),
                ),
                PositionedDirectional(
                  start: 8,
                  bottom: 8,
                  child: Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceCard(context),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF2C2B2B,
                          ).withValues(alpha: 0.08),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      AppAssets.cartPlusIcon,
                      width: 19,
                      height: 19,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 0.5, color: AppColors.border(context)),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addon.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption(context).copyWith(
                    color: AppColors.onSurface(context),
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  addon.price,
                  style: AppTextStyles.textLink(context).copyWith(
                    color: AppColors.onSurface(context),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductBottomBar extends StatelessWidget {
  const _ProductBottomBar({
    required this.quantity,
    required this.total,
    required this.onIncrement,
    required this.onDecrement,
    required this.onSubmit,
  });

  final int quantity;
  final int total;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final enabled = quantity > 0;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        border: Border(
          top: BorderSide(color: AppColors.border(context), width: 0.5),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
          child: Row(
            children: [
              _BottomQuantityControl(
                quantity: quantity,
                onIncrement: onIncrement,
                onDecrement: onDecrement,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: enabled ? onSubmit : null,
                  child: Container(
                    height: 48,
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    decoration: BoxDecoration(
                      color: enabled
                          ? AppColors.primary
                          : const Color(0xFFE7E7E7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.productAddToCart,
                          style: AppTextStyles.buttonHeading(context).copyWith(
                            color: enabled
                                ? AppColors.text
                                : AppColors.paragraph(context),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                          ),
                        ),
                        Text(
                          l10n.cartPrice(total),
                          style: AppTextStyles.buttonHeading(context).copyWith(
                            color: enabled
                                ? AppColors.text
                                : AppColors.paragraph(context),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomQuantityControl extends StatelessWidget {
  const _BottomQuantityControl({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onIncrement,
            child: SvgPicture.asset(
              AppAssets.cartPlusIcon,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 14),
          SizedBox(
            width: 13,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: AppTextStyles.body(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(width: 14),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onDecrement,
            child: SvgPicture.asset(
              quantity <= 1
                  ? AppAssets.cartDeleteIcon
                  : AppAssets.cartMinusIcon,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductOption {
  const _ProductOption({
    required this.id,
    required this.label,
    this.priceLabel,
  });

  final String id;
  final String label;
  final String? priceLabel;
}

class _AddonData {
  const _AddonData({
    required this.name,
    required this.price,
    required this.image,
  });

  final String name;
  final String price;
  final String image;
}
