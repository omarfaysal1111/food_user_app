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
  String _notes = '';

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
                    _ProductIntro(
                      item: widget.item,
                      notes: _notes,
                      onAddNotes: _showNotesDialog,
                    ),
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

  Future<void> _showNotesDialog() async {
    final notes = await showGeneralDialog<String>(
      context: context,
      barrierColor: AppColors.overlay(context),
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return ProductNotesDialog(initialNotes: _notes);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
    if (!mounted || notes == null) return;

    setState(() => _notes = notes);
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
      height: 120,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            top: 10,
            child: Image.asset(
              AppAssets.productDetailsStripes,
              fit: BoxFit.contain,
            ),
          ),
          Image.asset(imageAsset, width: 233, height: 120, fit: BoxFit.contain),
        ],
      ),
    );
  }
}

class _ProductIntro extends StatelessWidget {
  const _ProductIntro({
    required this.item,
    required this.notes,
    required this.onAddNotes,
  });

  final CartItem item;
  final String notes;
  final VoidCallback onAddNotes;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasNotes = notes.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          _localizedItemName(l10n),
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
          _localizedItemDescription(l10n),
          textAlign: TextAlign.start,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.paragraph(context),
            fontSize: 12,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onAddNotes,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppAssets.cartEditIcon, width: 14, height: 14),
                const SizedBox(width: 4),
                Text(
                  hasNotes ? l10n.productEditNotes : l10n.productAddNotes,
                  style: AppTextStyles.textLink(context).copyWith(
                    color: AppColors.onSurface(context),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (hasNotes) ...[
          const SizedBox(height: 16),
          _SavedProductNotes(notes: notes.trim()),
        ],
      ],
    );
  }

  String _localizedItemName(AppLocalizations l10n) {
    if (item.id == 'burger-combo-1' || item.id == 'burger-combo-2') {
      return l10n.cartProductBurgerCombo;
    }
    return item.name;
  }

  String _localizedItemDescription(AppLocalizations l10n) {
    if (item.id == 'burger-combo-1' || item.id == 'burger-combo-2') {
      return l10n.productBurgerDescription;
    }
    return item.description;
  }
}

class _SavedProductNotes extends StatelessWidget {
  const _SavedProductNotes({required this.notes});

  final String notes;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.productYourNotes,
          textAlign: TextAlign.start,
          style: AppTextStyles.heading4(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          notes,
          textAlign: TextAlign.start,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 12,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}

class ProductNotesDialog extends StatefulWidget {
  const ProductNotesDialog({required this.initialNotes, super.key});

  final String initialNotes;

  @override
  State<ProductNotesDialog> createState() => _ProductNotesDialogState();
}

class _ProductNotesDialogState extends State<ProductNotesDialog> {
  static const _dialogHeight = 271.0;
  static const _dialogMaxWidth = 375.0;
  static const _keyboardGap = 20.0;
  static const _minimumTopMargin = 20.0;

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialNotes);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;

    return Material(
      color: AppColors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dialogWidth = constraints.maxWidth < _dialogMaxWidth
              ? constraints.maxWidth
              : _dialogMaxWidth;
          final centeredTop = (constraints.maxHeight - _dialogHeight) / 2;
          final keyboardSafeTop =
              constraints.maxHeight -
              keyboardInset -
              _keyboardGap -
              _dialogHeight;
          final top = _resolveDialogTop(
            centeredTop: centeredTop,
            keyboardSafeTop: keyboardSafeTop,
            keyboardInset: keyboardInset,
          );

          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.of(context).pop();
                  },
                  child: const SizedBox.expand(),
                ),
              ),
              AnimatedPositionedDirectional(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                top: top,
                start: 0,
                end: 0,
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: SizedBox(
                      width: dialogWidth,
                      height: _dialogHeight,
                      child: Material(
                        color: AppColors.scaffoldBackground(context),
                        borderRadius: BorderRadius.circular(12),
                        clipBehavior: Clip.antiAlias,
                        child: _ProductNotesDialogContent(
                          controller: _controller,
                          l10n: l10n,
                          fieldBorder: _fieldBorder,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  double _resolveDialogTop({
    required double centeredTop,
    required double keyboardSafeTop,
    required double keyboardInset,
  }) {
    if (keyboardInset <= 0) {
      return centeredTop.clamp(_minimumTopMargin, double.infinity).toDouble();
    }

    if (keyboardSafeTop < _minimumTopMargin) {
      return _minimumTopMargin;
    }

    return centeredTop.clamp(_minimumTopMargin, keyboardSafeTop).toDouble();
  }

  OutlineInputBorder _fieldBorder(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 0.5),
    );
  }
}

class _ProductNotesDialogContent extends StatelessWidget {
  const _ProductNotesDialogContent({
    required this.controller,
    required this.l10n,
    required this.fieldBorder,
  });

  final TextEditingController controller;
  final AppLocalizations l10n;
  final OutlineInputBorder Function(BuildContext context, Color color)
  fieldBorder;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.productNotesTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.appBarTitle(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            Divider(
              height: 1,
              thickness: 0.5,
              color: AppColors.border(context),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.productNotesTitle,
              textAlign: TextAlign.start,
              style: AppTextStyles.body(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 96,
              child: TextField(
                controller: controller,
                minLines: null,
                maxLines: null,
                expands: true,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                cursorColor: AppColors.cursor(context),
                style: AppTextStyles.inputText(
                  context,
                ).copyWith(fontSize: 12, height: 1.3),
                decoration: InputDecoration(
                  hintText: l10n.productNotesHint,
                  hintStyle: AppTextStyles.inputHint(context).copyWith(
                    color: AppColors.hint(context),
                    fontSize: 12,
                    height: 1.3,
                  ),
                  filled: true,
                  fillColor: AppColors.surfaceCard(context),
                  contentPadding: const EdgeInsetsDirectional.fromSTEB(
                    16,
                    16,
                    16,
                    16,
                  ),
                  border: fieldBorder(context, AppColors.border(context)),
                  enabledBorder: fieldBorder(
                    context,
                    AppColors.border(context),
                  ),
                  focusedBorder: fieldBorder(
                    context,
                    AppColors.fieldFocusBorder(context),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).pop(controller.text.trim());
              },
              child: Container(
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  l10n.productNotesSubmit,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.primaryButtonLabel.copyWith(
                    color: AppColors.text,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
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
                  end: 8,
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
                          color: AppColors.shadow.withValues(alpha: 0.08),
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
                          : AppColors.inactiveIndicator,
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
