import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/keyboard_dismiss_on_tap.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import 'package:food_user_app/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:food_user_app/features/cart/presentation/widgets/cart_summary.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, this.isActive = true});

  final bool isActive;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItem> _items;
  var _seededMockItems = false;
  var _wasClearedAfterMockPayment = false;
  Locale? _mockItemsLocale;

  @override
  void initState() {
    super.initState();
    _items = const [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    if (_mockItemsLocale?.languageCode == locale.languageCode) return;

    final l10n = AppLocalizations.of(context)!;
    if (!_seededMockItems) {
      _items = _mockItems(l10n);
      _seededMockItems = true;
    } else if (_items.isNotEmpty) {
      _items = _localizedMockItems(l10n, currentItems: _items);
    }
    _mockItemsLocale = locale;
  }

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.isActive &&
        widget.isActive &&
        _wasClearedAfterMockPayment &&
        _items.isEmpty) {
      final l10n = AppLocalizations.of(context)!;
      setState(() {
        _items = _mockItems(l10n);
        _mockItemsLocale = Localizations.localeOf(context);
        _wasClearedAfterMockPayment = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (!_seededMockItems) {
      _items = _mockItems(l10n);
      _seededMockItems = true;
      _mockItemsLocale = Localizations.localeOf(context);
    }

    final subtotal = _items.fold<int>(
      0,
      (total, item) => total + (item.price * item.quantity),
    );
    const delivery = 20;
    const discount = 80;
    final total = subtotal + delivery - discount;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: KeyboardDismissOnTap(
        child: SafeArea(
          bottom: false,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverPadding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                sliver: SliverToBoxAdapter(child: _CartHeader(l10n: l10n)),
              ),
              SliverPadding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 28, 16, 0),
                sliver: _items.isEmpty
                    ? SliverFillRemaining(
                        hasScrollBody: false,
                        child: _CartEmptyPlaceholder(l10n: l10n),
                      )
                    : SliverList.separated(
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return CartItemTile(
                            item: item,
                            onEdit: () => _openProductDetails(item),
                            onIncrement: () => _changeQuantity(index, 1),
                            onDecrement: () => _changeQuantity(index, -1),
                          );
                        },
                        separatorBuilder: (_, _) => Divider(
                          height: 32,
                          thickness: 0.5,
                          color: AppColors.border(context),
                        ),
                      ),
              ),
              if (_items.isNotEmpty)
                SliverToBoxAdapter(
                  child: CartSummary(
                    subtotal: subtotal,
                    delivery: delivery,
                    discount: discount,
                    total: total,
                    onCheckout: _openCheckout,
                    onAddMore: () {
                      // TODO: Navigate to restaurant menu when real cart source is wired.
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeQuantity(int index, int delta) {
    setState(() {
      final current = _items[index];
      final nextQuantity = (current.quantity + delta).clamp(0, 99);
      if (nextQuantity == 0) {
        _items.removeAt(index);
      } else {
        _items[index] = current.copyWith(quantity: nextQuantity);
      }
    });
    // TODO: Persist quantity changes through the cart API.
  }

  void _openProductDetails(CartItem item) {
    context.push(RouteNames.productDetails, extra: item);
  }

  Future<void> _openCheckout() async {
    // TODO: Connect checkout once cart API integration is ready.
    final completed = await context.push<bool>(RouteNames.checkout);
    if (!mounted || completed != true) return;

    setState(() {
      _items.clear();
      _wasClearedAfterMockPayment = true;
    });
  }

  List<CartItem> _mockItems(AppLocalizations l10n) {
    // TODO: Replace local mock cart data with real cart API response.
    return [
      CartItem(
        id: 'burger-combo-1',
        name: l10n.cartProductBurgerCombo,
        description: l10n.productBurgerDescription,
        price: 200,
        imageAsset: AppAssets.cartProductImage,
      ),
      CartItem(
        id: 'burger-combo-2',
        name: l10n.cartProductBurgerCombo,
        description: l10n.productBurgerDescription,
        price: 200,
        imageAsset: AppAssets.cartProductImage,
      ),
    ];
  }

  List<CartItem> _localizedMockItems(
    AppLocalizations l10n, {
    required List<CartItem> currentItems,
  }) {
    return currentItems.map((item) {
      if (item.id == 'burger-combo-1' || item.id == 'burger-combo-2') {
        return item.copyWith(
          name: l10n.cartProductBurgerCombo,
          description: l10n.productBurgerDescription,
        );
      }
      return item;
    }).toList();
  }
}

class _CartEmptyPlaceholder extends StatelessWidget {
  const _CartEmptyPlaceholder({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 64, 16, 64),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.paymentEmptyIcon, width: 80, height: 80),
            const SizedBox(height: 20),
            Text(
              l10n.cartEmptyTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading4(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.cartEmptyMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.body(context).copyWith(
                color: AppColors.paragraph(context),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartHeader extends StatelessWidget {
  const _CartHeader({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              l10n.cartTitle,
              textAlign: TextAlign.start,
              style: AppTextStyles.heading4(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          l10n.cartRestaurantSubtitle,
          textAlign: TextAlign.start,
          style: AppTextStyles.textLink(context).copyWith(
            color: AppColors.paragraph(context),
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.25,
          ),
        ),
      ],
    );
  }
}
